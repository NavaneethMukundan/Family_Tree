import 'package:family_tree/features/forms/view/search_page.dart';
import 'package:family_tree/features/home/view/details_page/user_details.dart';
import 'package:family_tree/features/member/controllers/member_provider.dart';
import 'package:family_tree/features/member/models/family_tree_model.dart';
import 'package:family_tree/features/member/models/member_model.dart';
import 'package:family_tree/utils/colors.dart';
import 'package:family_tree/utils/constraints.dart';
import 'package:flutter/material.dart';
import "package:collection/collection.dart";


class HomePage extends StatelessWidget {
  const HomePage(
      {this.memberId = 'pUEAQb8VBcSazFNKFTkw',
      this.member,
      this.motherMember,
      this.fatherMember,
      super.key});

  final String? memberId;
  final Member? member;
  final Member? fatherMember;
  final Member? motherMember;

  // List<Widget> buildChildrenAvatars(){

  //   return List.generate(10, (index) => null)
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBlack,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 18.0),
            child: IconButton(onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchPage(title: 'Member'))); 

            }, icon: const Icon(Icons.search)),
          )
        ],
        elevation: 0,
        title: const Text(
          'PP Family',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: FutureBuilder(
          future: FamilyTreeProvider().findFamily(
            memberId ?? 'pUEAQb8VBcSazFNKFTkw',
            member: member,
            fatherMember: fatherMember,
            motherMember: motherMember,
          ),
          builder: (context, AsyncSnapshot<FamilyTreeModel> data) {
            if (data.hasData) {
              return Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      kheight20,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => UserDetailsPage(
                                        memberId: data.data?.member.id),
                                  ));
                            },
                            child: SizedBox(
                              width: 100,
                              child: Column(
                                children: [
                                  Card(
                                    elevation: 20,
                                    shadowColor: kGrey,
                                    shape: const CircleBorder(),
                                    color: kblue,
                                    child: Container(
                                      height: 90,
                                      width: 90,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          border: Border.all(color: kBlack),
                                          image: DecorationImage(
                                              fit: BoxFit.fill,
                                              image: NetworkImage(data
                                                      .data?.member.imageUrl ??
                                                  'https://gptckannur.ac.in/wp-content/uploads/2021/09/profile-pic-placeholder.jpg'))),
                                    ),
                                  ),
                                  Text(
                                    data.data?.member.name.toString() ?? '',
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                          ),
                          kWidth20,
                          buildSpouseList(data)
                        ],
                      ),
                      Image.asset('assets/design.png', color: kBlack),
                      const Text(
                        'Family',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      kheight,
                      data.data?.children != null
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                kheight20,
                                const Text(
                                  'Children',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w800),
                                ),
                                kheight20,
                                Wrap(
                                  children: buillChildrenList(data, context),
                                ),
                              ],
                            )
                          : const SizedBox(),
                      kheight20,
                    ],
                  ),
                ),
              );
            } else if (data.hasError) {
              return const Center(child: Text('Something Went Wrong'));
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }

  Expanded buildSpouseList(AsyncSnapshot<FamilyTreeModel> data) {
    return Expanded(
      child: SizedBox(
        height: 110,
        child: Builder(builder: (context) {
          final spouseCount = data.data?.spouse?.length ?? 0;
          return ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  SizedBox(
                    width: 100,
                    child: Column(
                      children: [
                        Card(
                          elevation: 20,
                          shadowColor: kGrey,
                          shape: const CircleBorder(),
                          color: kblue,
                          child: Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(color: kBlack),
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(data
                                            .data?.spouse?[index].imageUrl ??
                                        'https://gptckannur.ac.in/wp-content/uploads/2021/09/profile-pic-placeholder.jpg'))),
                          ),
                        ),
                        Text(
                          data.data?.spouse?[index].name ??
                              "Spuose ${index + 1}",
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                ],
              );
            },
            separatorBuilder: (context, index) {
              return kWidth;
            },
            itemCount: spouseCount,
          );
        }),
      ),
    );
  }

  List<Widget> buillChildrenList(
      AsyncSnapshot<FamilyTreeModel> data, BuildContext context) {
    List<Widget> list = [];
        final childrenData = data.data?.children;
    if (childrenData != null) {
      if (childrenData.isNotEmpty) {
        childrenData.sort(((a, b) {

           return compareAsciiUpperCase( b.birthYear!,a.birthYear!  );
        }));
      }
    } 
    final genaratedList =
        List<Widget>.generate(data.data?.children?.length ?? 0, (index) {
      final child = data.data?.children?[index];
      final motherId = child?.motherId;

      final List<Member>? motherMemberList = data.data?.spouse
          ?.where((element) => element.id == motherId)
          .toList();
      // print(motherMemberList);
      final Member? childsMotherMember =
          motherMemberList!.isNotEmpty ? motherMemberList[0] : null;

      return SizedBox(
        width: 100,
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UserDetailsPage(
                    // memberId: child?.id,
                    member: child,
                    fatherMember: data.data?.member,
                    motherMember: childsMotherMember,
                  ),
                ));
          },
          child: Column(
            children: [
              Card(
                elevation: 15,
                shadowColor: kGrey,
                shape: const CircleBorder(),
                color: kblue,
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: kBlack),
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(child?.imageUrl ??
                              'https://gptckannur.ac.in/wp-content/uploads/2021/09/profile-pic-placeholder.jpg'))),
                ),
              ),
              Text(child?.name ?? ""),
            ],
          ),
        ),
      );
    });
    list.addAll(genaratedList);
    return list.reversed.toList();
  }
}

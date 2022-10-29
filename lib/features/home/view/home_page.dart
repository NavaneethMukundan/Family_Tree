import 'package:family_tree/features/forms/view/search_page.dart';
import 'package:family_tree/features/home/view/details_page/user_details.dart';
import 'package:family_tree/features/home/widget/bottom_sheet.dart';
import 'package:family_tree/features/member/controllers/member_provider.dart';
import 'package:family_tree/features/member/models/family_tree_model.dart';
import 'package:family_tree/features/member/models/member_model.dart';
import 'package:family_tree/utils/colors.dart';
import 'package:family_tree/utils/constraints.dart';
import 'package:family_tree/utils/routes.dart';
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
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0XFFE8E8E8), Color(0XFF6F9040)])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          toolbarHeight: 80,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 18.0),
              child: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const SearchPage(title: 'Member')));
                  },
                  icon: const Icon(
                    Icons.search,
                    color: kBlack,
                    size: 30,
                  )),
            )
          ],
          elevation: 0,
          title: const Text(
            'PP Family',
            style: TextStyle(
                fontSize: 35, fontWeight: FontWeight.w800, color: kBlack),
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
                  padding: const EdgeInsets.only(left: 16),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        kheight20,
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => UserDetailsPage(
                                      memberId: data.data?.member.id),
                                ));
                          },
                          child: Center(
                            child: Column(
                              children: [
                                Card(
                                  elevation: 20,
                                  shadowColor: kGrey,
                                  shape: const CircleBorder(),
                                  color: kblue,
                                  child: Container(
                                    height: 120,
                                    width: 120,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        border: Border.all(color: kBlack),
                                        image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: NetworkImage(data
                                                    .data?.member.imageUrl ??
                                                'https://gptckannur.ac.in/wp-content/uploads/2021/09/profile-pic-placeholder.jpg'))),
                                  ),
                                ),
                                kheight,
                                Text(
                                  data.data?.member.name.toString() ?? '',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ),
                        kheight,
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [kWidth20, buildSpouseList(data)],
                        ),
                        kheight,
                        Image.asset('assets/design.png', color: kBlack),
                        kheight,
                        data.data?.children != null
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  kheight20,
                                  const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 15),
                                    child: Text(
                                      'Children',
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.w800,
                                          color: kBlack),
                                    ),
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
      ),
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                        Expanded(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Text(
                              data.data?.spouse?[index].name ??
                                  "Spuose ${index + 1}",
                              maxLines: 1,
                              overflow: TextOverflow.fade,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              );
            },
            separatorBuilder: (context, index) {
              return kWidth20;
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
          return compareAsciiUpperCase(b.birthYear!, a.birthYear!);
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
        width: 120,
        child: GestureDetector(
          onTap: () {
            showModalBottomSheet(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                context: context,
                builder: (context) {
                  return BottomSheetWidget(
                    image: DecorationImage(
                        image: NetworkImage(data.data?.member.imageUrl ??
                            'https://gptckannur.ac.in/wp-content/uploads/2021/09/profile-pic-placeholder.jpg')),
                    name: child?.name ?? "",
                    houseName: data.data?.member.house ?? '',
                    fathername: data.data?.member.name.toString() ?? '',
                    ontap: () {
                      RouteController.popupRoute(context);
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
                  );
                });
          },
          child: Column(
            children: [
              Card(
                elevation: 15,
                shadowColor: kGrey,
                shape: const CircleBorder(),
                color: kblue,
                child: Container(
                  height: 65,
                  width: 65,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: kBlack),
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(child?.imageUrl ??
                              'https://gptckannur.ac.in/wp-content/uploads/2021/09/profile-pic-placeholder.jpg'))),
                ),
              ),
              Text(child?.name ?? "",
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold)),
              kheight20,
            ],
          ),
        ),
      );
    });
    list.addAll(genaratedList);
    return list.reversed.toList();
  }
}

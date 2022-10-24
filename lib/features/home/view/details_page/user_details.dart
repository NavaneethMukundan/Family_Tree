import 'package:family_tree/features/forms/controller/form_controller.dart';
import 'package:family_tree/features/forms/controller/search_controller.dart';
import 'package:family_tree/features/forms/view/forms_page.dart';
import 'package:family_tree/features/member/controllers/member_provider.dart';
import 'package:family_tree/features/member/models/family_tree_model.dart';
import 'package:family_tree/features/member/models/member_model.dart';
import 'package:family_tree/utils/colors.dart';
import 'package:family_tree/utils/constraints.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserDetailsPage extends StatelessWidget {
  const UserDetailsPage(
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
            child: IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          )
        ],
        elevation: 0,
        title: const Text(
          'Details ',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          FamilyTreeProvider().findFamily('voBhMo6Y6MnP1HbRpFfT');
        }),
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
                                    height: 90,
                                    width: 90,
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
                                Text(
                                  data.data?.member.name.toString() ?? '',
                                  textAlign: TextAlign.center,
                                )
                              ],
                            ),
                          ),
                          kWidth20,
                          buildSpouseList(data)
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    data.data?.member.mobile ?? '',
                                    style: const TextStyle(
                                      color: Color(0xff1f1f1f),
                                      fontSize: 20,
                                      fontFamily: "Inter",
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    data.data?.member.house ?? '',
                                    style: const TextStyle(
                                      color: Color(0xff1f1f1f),
                                      fontSize: 16,
                                      fontFamily: "Inter",
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                IconButton(
                                    onPressed: () {
                                      context.read<FormController>().fillFields(
                                          data.data!.member,
                                          fatherMember: data.data?.father,
                                          motherMember: data.data?.mother);
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const FormPage(),
                                          ));
                                    },
                                    icon: const Icon(Icons.edit)),
                                const Text('Edit'),
                              ],
                            ),
                            kWidth20,
                            data.data!.member.mobile!.isNotEmpty
                                ? Column(
                                    children: [
                                      IconButton(
                                          onPressed: () {},
                                          icon: const Icon(Icons.call)),
                                      const Text('Call'),
                                    ],
                                  )
                                : const SizedBox(),
                          ],
                        ),
                      ),
                      Image.asset('assets/design.png', color: kBlack),
                      const Text(
                        'Family',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      kheight,
                      data.data?.father != null || data.data?.mother != null
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Parents',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w800),
                                ),
                                kheight20,
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                                  borderRadius:
                                                      BorderRadius.circular(50),
                                                  border:
                                                      Border.all(color: kBlack),
                                                  image: const DecorationImage(
                                                      fit: BoxFit.fill,
                                                      image: NetworkImage(
                                                          'https://gptckannur.ac.in/wp-content/uploads/2021/09/profile-pic-placeholder.jpg'))),
                                            ),
                                          ),
                                          Text(
                                            data.data?.father?.name ?? "Father",
                                            textAlign: TextAlign.center,
                                          )
                                        ],
                                      ),
                                    ),
                                    kWidth20,
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
                                                  borderRadius:
                                                      BorderRadius.circular(50),
                                                  border:
                                                      Border.all(color: kBlack),
                                                  image: const DecorationImage(
                                                      fit: BoxFit.fill,
                                                      image: NetworkImage(
                                                          'https://gptckannur.ac.in/wp-content/uploads/2021/09/profile-pic-placeholder.jpg'))),
                                            ),
                                          ),
                                          Text(
                                            data.data?.mother?.name ?? "Mother",
                                            textAlign: TextAlign.center,
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          : const SizedBox(),
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
                      Image.asset(
                        'assets/design.png',
                        color: kBlack,
                      ),
                      const Center(
                        child: Text(
                          'Details',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ),
                      kheight20,
                      const Text(
                        'Address : ',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w800),
                      ),
                      kheight,
                      Text(
                        data.data?.member.address ?? '',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      ),
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
              return index == spouseCount
                  ? Row(
                      children: [
                        SizedBox(
                          width: 100,
                          height: 100,
                          child: Center(
                            child: SizedBox(
                              width: 56,
                              height: 56, // button width and height
                              child: ClipOval(
                                child: Material(
                                  color: Colors.black, // button color
                                  child: InkWell(
                                    splashColor: Colors.grey, // splash color
                                    onTap: () {
                                      context
                                          .read<FormController>()
                                          .clearAllFields();
                                      context
                                          .read<FormController>()
                                          .addRootMember(
                                              husbandMember: data.data?.member);
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => FormPage(
                                                fromId: data.data?.member.id),
                                          ));
                                    }, // button pressed
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const <Widget>[
                                        Icon(
                                          Icons.add,
                                          color: kWhite,
                                        ), // icon
                                        Text(
                                          "add",
                                          style: TextStyle(color: kWhite),
                                        ), // text
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  : Row(
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
                                          image: NetworkImage(data.data
                                                  ?.spouse?[index].imageUrl ??
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
            itemCount: spouseCount + 1,
          );
        }),
      ),
    );
  }

  List<Widget> buillChildrenList(
      AsyncSnapshot<FamilyTreeModel> data, BuildContext context) {
    List<Widget> list = [
      SizedBox(
        width: 100,
        height: 100,
        child: Center(
          child: SizedBox(
            width: 56,
            height: 56, // button width and height
            child: ClipOval(
              child: Material(
                color: Colors.black, // button color
                child: InkWell(
                  splashColor: Colors.grey, // splash color
                  onTap: () {
                    final spouses = data.data?.spouse ?? [];
                    if (spouses.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content:
                              Text('Please Add Spouse Before Adding A Child')));
                      return;
                    }
                    context.read<FormController>().clearAllFields();
                    context.read<SearchController>().addSpouses(spouses);
                    context.read<FormController>().addRootMember(
                        fatherMember: data.data?.member,
                        motherMember: spouses[0]);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FormPage(
                            fromId: data.data?.member.id,
                          ),
                        ));
                  }, // button pressed
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Icon(
                        Icons.add,
                        color: kWhite,
                      ), // icon
                      Text(
                        "add",
                        style: TextStyle(color: kWhite),
                      ), // text
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      )
    ];
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
            // context.read<FormController>().fillFields(child!,
            // fatherMember:  data.data?.member,
            // motherMember: childsMotherMember);
            // Navigator.push(context, MaterialPageRoute(builder: (context) => FormPage(),));
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

import 'package:family_tree/features/forms/controller/form_controller.dart';
import 'package:family_tree/features/forms/controller/search_controller.dart';
import 'package:family_tree/features/forms/view/forms_page.dart';
import 'package:family_tree/features/forms/view/search_page.dart';
import 'package:family_tree/features/home/widget/bottom_sheet.dart';
import 'package:family_tree/features/member/controllers/member_provider.dart';
import 'package:family_tree/features/member/models/family_tree_model.dart';
import 'package:family_tree/features/member/models/member_model.dart';
import 'package:family_tree/utils/colors.dart';
import 'package:family_tree/utils/constraints.dart';
import 'package:family_tree/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import "package:collection/collection.dart";

class UserDetailsPage extends StatelessWidget {
  UserDetailsPage(
      {this.memberId = 'pUEAQb8VBcSazFNKFTkw',
      this.member,
      this.motherMember,
      this.fatherMember,
      super.key});

  final String? memberId;
  final Member? member;
  final Member? fatherMember;
  final Member? motherMember;
  final ValueNotifier<String> selectedMotherId = ValueNotifier<String>('all');
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
            toolbarHeight: 70,
            automaticallyImplyLeading: false,
            leading: IconButton(
                onPressed: () {
                  RouteController.popupRoute(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: kBlack,
                )),
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
            title: const Center(
              child: Text(
                'DETAILS',
                style: TextStyle(
                    fontSize: 30, fontWeight: FontWeight.w800, color: kBlack),
              ),
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
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  selectedMotherId.value = 'all';
                                  selectedMotherId.notifyListeners();
                                },
                                child: SizedBox(
                                  width: 150,
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
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              border: Border.all(color: kBlack),
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(data.data
                                                          ?.member.imageUrl ??
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
                              kWidth10,
                              buildSpouseList(data)
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Text(
                                        data.data?.member.mobile ?? '',
                                        style: const TextStyle(
                                          color: Color(0xff1f1f1f),
                                          fontSize: 20,
                                          fontFamily: "Inter",
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Text(
                                        data.data?.member.house ?? '',
                                        style: const TextStyle(
                                          color: Color(0xff1f1f1f),
                                          fontSize: 20,
                                          fontFamily: "Inter",
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        context
                                            .read<FormController>()
                                            .fillFields(data.data!.member,
                                                fatherMember: data.data?.father,
                                                motherMember:
                                                    data.data?.mother);
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const FormPage(),
                                            ));
                                      },
                                      icon: const Icon(Icons.edit)),
                                  const Text(
                                    'Edit',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
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
                          Image.asset('assets/design.png', color: kBlack),
                          kheight,
                          data.data?.father != null || data.data?.mother != null
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(left: 20),
                                      child: Text(
                                        'Parents',
                                        style: TextStyle(
                                            fontSize: 27,
                                            fontWeight: FontWeight.w800),
                                      ),
                                    ),
                                    kheight20,
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      UserDetailsPage(
                                                    // memberId: child?.id,
                                                    member: data.data?.father,
                                                  ),
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
                                                    height: 80,
                                                    width: 80,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(50),
                                                        border: Border.all(
                                                            color: kBlack),
                                                        image: const DecorationImage(
                                                            fit: BoxFit.fill,
                                                            image: NetworkImage(
                                                                'https://gptckannur.ac.in/wp-content/uploads/2021/09/profile-pic-placeholder.jpg'))),
                                                  ),
                                                ),
                                                Text(
                                                  data.data?.father?.name ??
                                                      "Father",
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        kWidth20,
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      UserDetailsPage(
                                                    // memberId: child?.id,
                                                    member: data.data?.mother,
                                                  ),
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
                                                    height: 80,
                                                    width: 80,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(50),
                                                        border: Border.all(
                                                            color: kBlack),
                                                        image: const DecorationImage(
                                                            fit: BoxFit.fill,
                                                            image: NetworkImage(
                                                                'https://gptckannur.ac.in/wp-content/uploads/2021/09/profile-pic-placeholder.jpg'))),
                                                  ),
                                                ),
                                                Text(
                                                  data.data?.mother?.name ??
                                                      "Mother",
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )
                                              ],
                                            ),
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
                                    const Padding(
                                      padding: EdgeInsets.only(left: 20),
                                      child: Text(
                                        'Childrens',
                                        style: TextStyle(
                                            fontSize: 27,
                                            fontWeight: FontWeight.w800),
                                      ),
                                    ),
                                    kheight20,
                                    ValueListenableBuilder(
                                        valueListenable: selectedMotherId,
                                        builder: (context, _, __) {
                                          return Wrap(
                                            children: buillChildrenList(
                                              data,
                                              context,
                                              selectedMotherId:
                                                  selectedMotherId.value,
                                            ),
                                          );
                                        }),
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
        ));
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
                        GestureDetector(
                          onLongPress: () {
                            context.read<FormController>().clearAllFields();

                            context.read<FormController>().fillFields(
                                  data.data!.spouse![index],
                                );
                            context.read<FormController>().addRootMember(
                                husbandMember: data.data?.member);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => FormPage(
                                    fromId: data.data?.member.id,
                                  ),
                                ));
                          },
                          onDoubleTap: () {
                            selectedMotherId.value =
                                data.data?.spouse?[index].id ?? '';
                            selectedMotherId.notifyListeners();
                          },
                          onTap: () {
                            showModalBottomSheet(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                context: context,
                                builder: (builder) {
                                  final spouse = data.data?.spouse![index];
                                  return BottomSheetWidget(
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(spouse?.imageUrl ??
                                            'https://gptckannur.ac.in/wp-content/uploads/2021/09/profile-pic-placeholder.jpg')),
                                    name: spouse?.name ?? "",
                                    houseName: data.data?.member.house ?? '',
                                    fathername:
                                        data.data?.member.name.toString() ?? '',
                                    ontap: () {
                                      RouteController.popupRoute(context);
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                UserDetailsPage(
                                              // memberId: child?.id,
                                              member: spouse,
                                            ),
                                          ));
                                    },
                                  );
                                });
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
                                    height: 80,
                                    width: 80,
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
                                Expanded(
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Text(
                                      data.data?.spouse?[index].name ??
                                          "Spuose ${index + 1}",
                                      textAlign: TextAlign.center,
                                      maxLines: 1,
                                      overflow: TextOverflow.visible,
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                )
                              ],
                            ),
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
      AsyncSnapshot<FamilyTreeModel> data, BuildContext context,
      {String? selectedMotherId}) {
    List<Widget> list = [AddChildButton(data)];
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
      if (selectedMotherId != 'all') {
        return selectedMotherId == child?.motherId
            ? SizedBox(
                width: 100,
                child: GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        context: context,
                        builder: (builder) {
                          return BottomSheetWidget(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(child?.imageUrl ??
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
              )
            : const SizedBox();
      } else {
        return SizedBox(
          width: 125,
          child: GestureDetector(
            onTap: () {
              showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  context: context,
                  builder: (builder) {
                    return BottomSheetWidget(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(child?.imageUrl ??
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
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) => UserDetailsPage(
              //         // memberId: child?.id,
              //         member: child,
              //         fatherMember: data.data?.member,
              //         motherMember: childsMotherMember,
              //       ),
              //     ));
            },
            child: Column(
              children: [
                Card(
                  elevation: 15,
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
                            image: NetworkImage(child?.imageUrl ??
                                'https://gptckannur.ac.in/wp-content/uploads/2021/09/profile-pic-placeholder.jpg'))),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Text(child?.name ?? "",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
        );
      }
    });
    list.addAll(genaratedList);
    return list.reversed.toList();
  }
}

class AddChildButton extends StatelessWidget {
  final AsyncSnapshot<FamilyTreeModel> data;
  const AddChildButton(
    this.data, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
    );
  }
}

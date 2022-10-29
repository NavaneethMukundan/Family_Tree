import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:family_tree/features/member/models/member_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class FormController extends ChangeNotifier {
  final fireDb = FirebaseFirestore.instance.collection('members');
  final fireStorageRef = FirebaseStorage.instance.ref();

  String? id;

  final nameController = TextEditingController();
  final aliasController = TextEditingController();
  final houseController = TextEditingController();
  final birthYearController = TextEditingController();

  Member? father;
  Member? mother;
  Member? husband;

  final addressController = TextEditingController();
  final detailsController = TextEditingController();
  final mobileController = TextEditingController();

  bool isFemale = false;
  final husbandNameController = TextEditingController();
  final childrenController = TextEditingController();

  bool isMemberInlaw = false;
  final fatherNameController = TextEditingController();
  final motherNameController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  String? imageUrl;
  File? imageFile;

  // Image.file(File(path))
  Member member = Member();

  addFather(Member member) {
    father = member;
    notifyListeners();
  }

  clearFather() {
    father = null;
    notifyListeners();
  }

  addMother(Member member) {
    mother = member;
    notifyListeners();
  }

  clearMother() {
    mother = null;
    notifyListeners();
  }

  addHusband(Member member) {
    husband = member;
    notifyListeners();
  }

  clearHusband() {
    husband = null;
    notifyListeners();
  }

  Future<String?> addMember(BuildContext context) async {
    if (!formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please fill required fields.')));
      return null;
    }
    if (isMemberInlaw && husband == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Please Select Husband')));
      return null;
    }
    if (!isMemberInlaw && (father == null || mother == null)) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Please Select Parents')));
      return null;
      //return;
    }
    if(father!=null&& mother!=null){
      bool a = father?.id.toString() != mother?.husbandId.toString();
      if(a){
        ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Parents missmatch')));
      return null;
      }
    }
    print('validation done');
    final DocumentReference<Map<String, dynamic>> fireMember;

    if (id != null) {
      fireMember = fireDb.doc(id);
    } else {
      fireMember = fireDb.doc();
      id = fireMember.id;
    }
    if (imageFile != null) {
      imageUrl = await uploadImage() ?? '';
    }

    final details = detailsController.text.split(',');
    if (details.isEmpty) details.add('No Details');

    final children = detailsController.text.split(',');
    if (details.isEmpty) details.add('No Details');

    String fullName = '${nameController.text} ${aliasController.text}';

    member = Member(
      id: id,
      name: nameController.text,
      alias: aliasController.text,
      house: houseController.text,
      fatherId: isMemberInlaw ? 'inLaw' : father?.id ?? 'FID',
      motherId: isMemberInlaw ? 'inLaw' : mother?.id ?? 'MID',
      fatherName: isMemberInlaw ? fatherNameController.text : father?.name,
      motherName: isMemberInlaw ? motherNameController.text : mother?.name,
      address: addressController.text,
      imageUrl: imageUrl,
      details: details,
      mobile: mobileController.text,
      isFemale: isFemale,
      husbandName: isFemale ? husbandNameController.text : null,
      children: children,
      husbandId: isMemberInlaw ? husband!.id : null,
      birthYear: birthYearController.text,
      searchStrings: getSearchString(),
    );

    final map = member.toJson();
    bool success = false;
    await fireMember.set(map).then((value) {
      success = true;
      return ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Member Added')));
    }).onError((error, stackTrace) => ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Something went wrong'))));
    if (success) {
      return id;
    }
    print('completed');
    return null;
  }

  List<String>? getSearchString() {
    List<String>? searchStringList = ["allMembers"];
    final nameStrings = setSearchParam(nameController.text.toLowerCase());
    final aliasStrings = setSearchParam(aliasController.text.toLowerCase());
    searchStringList.addAll(nameStrings);
    searchStringList.addAll(aliasStrings);

    return searchStringList;
  }

  setSearchParam(String text) {
    List<String> stringList = [];
    String temp = "";
    for (int i = 0; i < text.length; i++) {
      temp = temp + text[i];
      stringList.add(temp);
    }
    return stringList;
  }

  String getTrimmedName(String name) {
    final names = name.split(' ');
    String finalName = '';
    for (var n in names) {
      n.trim();
      if (n.isNotEmpty) {
        finalName += '${n.toLowerCase()} ';
      }
    }

    return finalName.trim().toLowerCase();
  }

  Future<String?> uploadImage() async {
    if (imageFile == null) return null;
    String tempUrl = imageUrl??'';
    final imagesRef = fireStorageRef.child("images");
    final uuid = const Uuid().v1();
    final imageRef = imagesRef.child(uuid);
    try {
      await imageRef.putFile(imageFile!);
      final a= await  imageRef.getDownloadURL();
      return a;
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<void> pickCompressedImage() async {
    XFile? compressedImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 25,
    );

    if (compressedImage == null) return;
    imageFile = File(compressedImage.path);
    notifyListeners();
  }

  toggleFemaleMode() {
    isFemale = !isFemale;
    notifyListeners();
  }

  toggleInLawMode() {
    isMemberInlaw = !isMemberInlaw;
    notifyListeners();
  }

  clearAllFields() {
    id = null;
    nameController.clear();
    aliasController.clear();
    houseController.clear();
    addressController.clear();
    detailsController.clear();
    mobileController.clear();
    husbandNameController.clear();
    childrenController.clear();
    fatherNameController.clear();
    motherNameController.clear();
    birthYearController.clear();

    imageFile = null;
    imageUrl = null;
    father = null;
    mother = null;
    husband = null;
    isFemale = false;
    isMemberInlaw = false;
    notifyListeners();
  }

  fillFields(Member member,
      {Member? fatherMember, Member? motherMember, Member? husbandMember}) {
    id = member.id;
    nameController.text = member.name ?? '';
    aliasController.text = member.alias ?? '';
    houseController.text = member.house ?? '';
    addressController.text = member.address ?? '';
    detailsController.text = member.details?.join(',') ?? '';
    mobileController.text = member.mobile ?? '';
    husbandNameController.text = member.husbandName ?? '';
    childrenController.text = member.children?.join(',') ?? '';
    fatherNameController.text = member.fatherName ?? '';
    motherNameController.text = member.motherName ?? '';
    birthYearController.text = member.birthYear ?? '0';

    imageFile = null;
    imageUrl = member.imageUrl;
    father = fatherMember;
    mother = motherMember;
    husband = husbandMember;
    isFemale = member.isFemale ?? false;
    isMemberInlaw = member.isInlaw ?? false;
    notifyListeners();
  }

  addRootMember(
      {Member? fatherMember, Member? motherMember, Member? husbandMember}) {
    father = fatherMember;
    mother = motherMember;
    husband = husbandMember;
    if (husbandMember != null) {
      isMemberInlaw = true;
    }
    notifyListeners();
  }
}

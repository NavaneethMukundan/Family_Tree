import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:family_tree/features/member/models/member_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class FormController extends ChangeNotifier {
  final fireDb = FirebaseFirestore.instance.collection('members');
  final fireStorageRef = FirebaseStorage.instance.ref();

  final nameController = TextEditingController();
  final aliasController = TextEditingController();
  final houseController = TextEditingController();

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

  addMother(Member member) {
    mother = member;
    notifyListeners();
  }

  addHusband(Member member) {
    husband = member;
    notifyListeners();
  }

  addMember(BuildContext context) async {
    if (!formKey.currentState!.validate()) {
      print('fasdfs');

      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please fill required fields.')));
      return;
    }
    print('object');
    if (isMemberInlaw && husband == null) {
      print('husband is null');
      return;
    }
    if (!isMemberInlaw && (father == null || mother == null)) {
      print('parents  is null');
 
      //return; 
    }
    print('validation done');

    final fireMember = fireDb.doc();
    final id = fireMember.id;

    imageUrl = await uploadImage() ?? '';

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
      fatherId: father?.id ?? 'FID',
      motherId: mother?.id ?? 'MID',
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
      searchStrings: getSearchString(),
    );

    final map = member.toJson();
    // final mem = Member.fromJson(map);
    // final reMap = mem.toJson();
    // print(map);
    // print('map');
    // print(reMap);

    await fireMember
        .set(map)
        .then((value) => ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Member Added'))))
        .onError((error, stackTrace) => ScaffoldMessenger.of(context)
            .showSnackBar(
                const SnackBar(content: Text('Something went wrong'))));
    clearAllFields();

    print('completed');
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
    final imagesRef = fireStorageRef.child("images");
    final uuid = const Uuid().v1();
    final imageRef = imagesRef.child(uuid);
    try {
      await imageRef.putFile(imageFile!);
      return await imageRef.getDownloadURL();
    } catch (e) {
      print(e);
    }
  }

  Future<void> pickCompressedImage() async {
    XFile? compressedImage = await ImagePicker().pickImage(
      source: ImageSource.camera,
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

    father = null;
    mother = null;
    husband = null;
    isFemale = false;
    isMemberInlaw = false;
    notifyListeners();
  }
}

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:family_tree/features/member/models/member_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
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

  bool isFemaile = false;
  final husbandNameController = TextEditingController();
  final childrenController = TextEditingController();

  bool isMemberInlaw = false;
  final fatherName = TextEditingController();
  final motherName = TextEditingController();

  String imageUrl = '';

  addMember() async {
    final fireMember = fireDb.doc();
    final id = fireMember.id;
    Member member = Member(
        id: id,
        name: nameController.text,
        alias: aliasController.text,
        house: houseController.text,
        fatherId: father?.id ?? 'FID',
        motherId: mother?.id ?? 'MID',
        fatherName: father?.name,
        motherName: mother?.name,
        address: addressController.text,
        imageUrl: imageUrl,
        details: detailsController.text.split(','),
        mobile: mobileController.text,
        isFemale: false,
        husbandName: husbandNameController.text,
        children: childrenController.text.split(","));
    final map = member.toJson();
    // final mem = Member.fromJson(map);
    // final reMap = mem.toJson();
    // print(map);
    // print('map');
    // print(reMap);

    await fireMember.set(map);
    print('completed');
  }

  uploadImage() async {
    final imageXfile = await compressImage();
    if (imageXfile == null) return;
    final image = File(imageXfile.path);
    final imagesRef = fireStorageRef.child("images");
    final uuid = Uuid().v1();
    final imageRef = imagesRef.child(uuid);
    try {
      await imageRef.putFile(image);
    } catch (e) {
      print(e);
    }
  }

  Future<XFile?> compressImage() async {
    ImagePicker imagePicker = ImagePicker();
    XFile? compressedImage = await imagePicker.pickImage(
      source: ImageSource.camera,
      imageQuality: 25,
    );

    return compressedImage;
  }

  addinLawMember() async {
    Member member = Member(
      name: nameController.text,
      alias: aliasController.text,
      house: houseController.text,
      address: addressController.text,
      imageUrl: imageUrl,
      details: detailsController.text.split(','),
      mobile: mobileController.text,
      isInlaw: true,
      fatherName: fatherName.text,
      motherName: motherName.text,
      husbandName: husband?.name,
    );

    print(member.toJson());
  }

  toggleFemaleMode() {
    isFemaile = !isFemaile;
    notifyListeners();
  }
}

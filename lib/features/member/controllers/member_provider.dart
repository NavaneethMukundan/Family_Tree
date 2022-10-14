import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:family_tree/features/member/models/family_tree_model.dart';
import 'package:family_tree/features/member/models/member_model.dart';
import 'package:flutter/cupertino.dart';

class FamilyTreeProvider extends ChangeNotifier {

  final db = FirebaseFirestore.instance.collection('members');

  findFamily(String id) async {
    final members = await db.doc(id).get();
    final children = await db.where('father_id', isEqualTo: id).get();
    final motherId = members.data()?["father_id"].toString();
    if (motherId != null && motherId.isNotEmpty) {
      final mother = await db.doc(motherId).get();
    }
    final fatherId = members.data()?["father_id"].toString();
    if (fatherId != null && fatherId.isNotEmpty) {
      final father = await db.doc(fatherId).get();
    }
    final spouse = await db.where('spuose', isEqualTo: id).get();
 
    FamilyTreeModel(member: Member.fromJson(members.data()!));
    
  }
}

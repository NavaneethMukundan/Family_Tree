import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:family_tree/features/member/models/family_tree_model.dart';
import 'package:family_tree/features/member/models/member_model.dart';
import 'package:flutter/cupertino.dart';

class FamilyTreeProvider extends ChangeNotifier {
  final db = FirebaseFirestore.instance.collection('members');

  Future<FamilyTreeModel> findFamily(String id,
      {Member? member, Member? motherMember, Member? fatherMember}) async {
    print('working');
    final Map<String, dynamic>? members;
    final String memberId ;
    if (member == null|| member.id==null) {
      final memberSnapshot = await db.doc(id).get();
      members = memberSnapshot.data();
      memberId = memberSnapshot.id;
    } else {
      members = member.toJson();
      memberId = member.id!;
    }
 
    final children = await db.where('fatherId', isEqualTo: memberId).get();
    Member? mother;  
    Member? father;

    if (motherMember != null) {
      print('got mother member');
      mother = motherMember;
    } else {
      print('getting mother member');
      final motherId = members?["motherId"].toString();
      if (motherId != null &&
          motherId.isNotEmpty &&
          motherId != "MID" &&
          motherId != "null") {
        print(motherId);
        final motherSnapshot = await db.doc(motherId).get();
        if (motherSnapshot.data() != null ||
            motherSnapshot.data()!.isNotEmpty) {
          mother = Member.fromJson(motherSnapshot.data()!);
        }
      }
    }
    if (fatherMember != null) {
      father = fatherMember;
    } else {
      final fatherId = members?["fatherId"].toString();
      if (fatherId != null &&
          fatherId.isNotEmpty &&
          fatherId != "FID" &&
          fatherId != "null") {
        final fatherSnapshot = await db.doc(fatherId).get();
        if (fatherSnapshot.data() != null ||
            fatherSnapshot.data()!.isNotEmpty) {
          father = Member.fromJson(fatherSnapshot.data()!);
        }
      }
    }
    final spouse = await db.where('husbandId', isEqualTo: memberId).get();

    List<Member>? spouseMemmbers =
        spouse.docs.map((e) => Member.fromJson(e.data())).toList();
    List<Member>? childrenMemmbers =
        children.docs.map((e) => Member.fromJson(e.data())).toList();
    print('completed');
    return FamilyTreeModel(
      member: Member.fromJson(members!),
      children: childrenMemmbers,
      spouse: spouseMemmbers,
      mother: mother,
      father: father,
    );
  }
}

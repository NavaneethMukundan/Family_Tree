import 'package:family_tree/features/member/models/member_model.dart';

class FamilyTreeModel {
  final Member member;
  Member? father;
  Member? mother;
  List<Member>? spouse;
  List<Member>? children;

  FamilyTreeModel({
    required this.member,
    this.children,
    this.spouse,
    this.father,
    this.mother,
  });
}

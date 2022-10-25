import 'package:family_tree/features/forms/controller/search_controller.dart';
import 'package:family_tree/features/forms/widget/list_members_widget.dart';
import 'package:family_tree/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    print('building search page');
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kBlack,
          title: TextFormField(
            onChanged: (p0) {
              context.read<SearchController>().searchMember();
            },
            controller: context.watch<SearchController>().searchController,
            style: const TextStyle(fontSize: 20.0, height: 1.5, color: kBlack ),
            cursorColor: kBlack,
            decoration:  InputDecoration(
              border: const UnderlineInputBorder(),
              fillColor: Colors.white,
              filled: true,
              hintText: 'Enter $title Name',
            ),
          ),
        ),
        body: ListMembersWidget(
          title: title,
        ));
  }
}

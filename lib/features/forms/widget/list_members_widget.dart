import 'package:family_tree/features/forms/controller/form_controller.dart';
import 'package:family_tree/features/forms/controller/search_controller.dart';
import 'package:family_tree/features/home/view/details_page/user_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListMembersWidget extends StatelessWidget {
  const ListMembersWidget({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    print("building list");
    return SafeArea(
      child: context.watch<SearchController>().memberList.isNotEmpty
          ? ListView.builder(
              itemCount: context.watch<SearchController>().memberList.length,
              itemBuilder: (context, index) {
                final member =
                    context.watch<SearchController>().memberList[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                      child: ListTile(
                    onTap: (() {
                      if (title == "Father") {
                        context.read<FormController>().addFather(member);
                      }
                      if (title == "Mother") {
                        context.read<FormController>().addMother(member);
                      }
                      if (title == "Husband") {
                        context.read<FormController>().addHusband(member);
                      }
                      Navigator.pop(context);
                      if(title == "Member"){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => UserDetailsPage(member: member,),));
                      }
                    }),
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundImage: const NetworkImage(
                          'https://gptckannur.ac.in/wp-content/uploads/2021/09/profile-pic-placeholder.jpg'),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Container(
                          height: 100,
                          width: 100,
                          child: Image.network(
                            member.imageUrl ??
                                'https://gptckannur.ac.in/wp-content/uploads/2021/09/profile-pic-placeholder.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    title: Text(member.name ?? "Name"),
                    subtitle: Text(member.fatherName ?? ""),
                  )),
                );
              })
          : const Center(
              child: Text('Member Not Found'),
            ),
    );
  }
}

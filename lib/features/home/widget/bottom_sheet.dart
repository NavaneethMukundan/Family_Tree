import 'package:family_tree/features/home/view/details_page/user_details.dart';
import 'package:family_tree/utils/colors.dart';
import 'package:family_tree/utils/constraints.dart';
import 'package:family_tree/utils/routes.dart';
import 'package:flutter/material.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget(
      {super.key,
      required this.image,
      required this.name,
      required this.houseName,
      required this.fathername,
      required this.childrenName});

  final DecorationImage image;
  final String name;
  final String houseName;
  final String fathername;
  final String childrenName;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: 90,
            child: Divider(
              thickness: 5,
              color: kGrey,
            ),
          ),
          kheight40,
          Card(
            elevation: 20,
            shadowColor: kGrey,
            shape: const CircleBorder(),
            color: kblue,
            child: Container(
              height: 160,
              width: 160,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(80),
                  border: Border.all(color: kBlack),
                  image: image),
            ),
          ),
          kheight20,
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(
              name,
              maxLines: 1,
              overflow: TextOverflow.clip,
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          kheight,
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(
              houseName,
              maxLines: 1,
              overflow: TextOverflow.clip,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ),
          kheight,
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(
              fathername,
              maxLines: 1,
              overflow: TextOverflow.clip,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ),
          kheight20,
          const Text(
            'Childrens',
            maxLines: 1,
            overflow: TextOverflow.clip,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
          ),
          const SizedBox(
            width: 150,
            child: Divider(
              thickness: 3,
            ),
          ),
          kheight20,
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Center(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Text(
                    childrenName,
                    maxLines: 1,
                    overflow: TextOverflow.clip,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const Divider();
            },
            itemCount: 3,
          ),
          kheight20,
          ElevatedButton(
              onPressed: () {
                RouteController.popupRoute(context);
                RouteController.pushRoute(context, const UserDetailsPage());
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: kBlack, minimumSize: const Size(230, 60)),
              child: const Text(
                'View Tree',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              )),
          kheight20
        ],
      ),
    );
  }
}

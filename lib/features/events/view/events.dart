import 'package:family_tree/features/events/view/event_add.dart';
import 'package:family_tree/features/events/view/event_view.dart';
import 'package:family_tree/utils/colors.dart';
import 'package:family_tree/utils/constraints.dart';
import 'package:family_tree/utils/routes.dart';
import 'package:flutter/material.dart';

class EventPage extends StatelessWidget {
  const EventPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBlack,
        toolbarHeight: 100,
        elevation: 0,
        title: const Padding(
          padding: EdgeInsets.only(left: 70),
          child: Text(
            'Events',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Column(
          children: [
            kheight20,
            ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return ColoredBox(
                    color: const Color.fromARGB(255, 229, 227, 227),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 80,
                          width: 90,
                          decoration: const BoxDecoration(
                              color: kBlack,
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      'https://img.freepik.com/free-vector/gradient-golden-floral-wedding-invitation_52683-60511.jpg?w=2000'))),
                        ),
                        const Text(
                          'Wedding Invitation',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                            onPressed: () {
                              RouteController.pushRoute(
                                  context, const EventViewPage());
                            },
                            icon: const Icon(
                              Icons.keyboard_arrow_right_rounded,
                              size: 30,
                            ))
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider();
                },
                itemCount: 1),
          ],
        ),
      ),
      floatingActionButton: ElevatedButton(
          onPressed: () {
            RouteController.pushRoute(context, const EventAddPage());
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: kBlack,
              shape: const CircleBorder(),
              minimumSize: const Size(65, 65)),
          child: const Icon(
            Icons.add,
            size: 25,
          )),
    );
  }
}

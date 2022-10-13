import 'package:family_tree/utils/constraints.dart';
import 'package:flutter/material.dart';

import '../../../utils/colors.dart';

class EventViewPage extends StatelessWidget {
  const EventViewPage({super.key});

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
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              kheight20,
              Center(
                child: Container(
                  height: 250,
                  width: 300,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            'https://img.freepik.com/free-vector/gradient-golden-floral-wedding-invitation_52683-60511.jpg?w=2000')),
                    color: kBlack,
                  ),
                ),
              ),
              kheight30,
              const Text(
                'Wedding Invitation Of My Son X',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              kheight30,
              Row(
                children: const [
                  Flexible(
                    child: Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              kheight30,
            ],
          ),
        ),
      )),
    );
  }
}

import 'package:family_tree/utils/colors.dart';
import 'package:family_tree/utils/constraints.dart';
import 'package:flutter/material.dart';

class EventAddPage extends StatelessWidget {
  const EventAddPage({super.key});

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
            'Add Events',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            kheight30,
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
            TextFormField(
              decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.text_format_rounded,
                    color: kBlack,
                  ),
                  hintText: 'Heading..',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: kBlack),
                  )),
            ),
            kheight20,
            TextFormField(
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(80),
                  prefixIcon: const Icon(
                    Icons.text_format_rounded,
                    size: 30,
                    color: kBlack,
                  ),
                  hintText: 'Comments...',
                  hintStyle: const TextStyle(fontSize: 20),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: kBlack),
                  )),
            ),
            kheight20,
            Center(
                child: ElevatedButton(
                    onPressed: () {}, child: const Text('SAVE'))),
          ]),
        ),
      ),
    );
  }
}

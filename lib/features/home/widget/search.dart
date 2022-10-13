import 'package:family_tree/utils/colors.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(25),
          ),
        ),
        backgroundColor: Colors.black,
        toolbarHeight: 130,
        elevation: 10,
        title: const Center(
          child: Text(
            'PULATHU PULIKOTTIL',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(
            child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.search,
                    color: kBlack,
                  ),
                  hintText: 'Search...',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: kBlack),
                  )),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Secret key is required";
                } else {
                  return null;
                }
              },
            ),
          ],
        )),
      ),
    );
  }
}

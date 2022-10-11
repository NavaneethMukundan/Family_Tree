import 'package:family_tree/features/forms/controller/form.dart';
import 'package:family_tree/features/forms/widget/text_form_field.dart';
import 'package:family_tree/utils/colors.dart';
import 'package:family_tree/utils/constraints.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormPage extends StatelessWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FormController>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBlack,
        toolbarHeight: 100,
        elevation: 0,
        title: const Center(
          child: Text(
            'Add Member',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Center(
                child: CircleAvatar(
                  radius: 70,
                  backgroundImage: NetworkImage(
                      'https://cdn.dribbble.com/users/1176657/screenshots/15468294/media/34af996ddff444391edab94abcf3c7f3.png?compress=1&resize=400x300'),
                ),
              ),
              kheight20,
              const TextFormWidget(
                icon: Icons.person,
                hintText: 'Name',
                iconsize: 28,
                textHeight: 10,
                padding: 20,
                color: kBlack,
                radius: 15,
                iconcolor: kBlack,
              ),
              kheight,
              const TextFormWidget(
                icon: Icons.text_format,
                hintText: 'Alias',
                iconsize: 28,
                textHeight: 10,
                padding: 20,
                color: kBlack,
                radius: 15,
                iconcolor: kBlack,
              ),
              kheight,
              const TextFormWidget(
                icon: Icons.boy,
                hintText: 'Father',
                iconsize: 28,
                textHeight: 10,
                padding: 20,
                color: kBlack,
                radius: 15,
                iconcolor: kBlack,
              ),
              kheight,
              const TextFormWidget(
                icon: Icons.girl,
                hintText: 'Mother',
                iconsize: 28,
                textHeight: 10,
                padding: 20,
                color: kBlack,
                radius: 15,
                iconcolor: kBlack,
              ),
              kheight,
              const TextFormWidget(
                icon: Icons.girl,
                hintText: 'Spouse',
                iconsize: 28,
                textHeight: 10,
                padding: 20,
                color: kBlack,
                radius: 15,
                iconcolor: kBlack,
              ),
              kheight,
              const TextFormWidget(
                icon: Icons.phone,
                hintText: 'Mobile',
                iconsize: 28,
                textHeight: 10,
                padding: 20,
                color: kBlack,
                radius: 15,
                iconcolor: kBlack,
              ),
              kheight,
              const TextFormWidget(
                icon: Icons.text_format_outlined,
                hintText: 'Address',
                iconsize: 28,
                textHeight: 10,
                padding: 20,
                color: kBlack,
                radius: 15,
                iconcolor: kBlack,
              ),
              kheight20,
              ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      primary: kBlack, minimumSize: const Size(250, 50)),
                  child: const Text(
                    'Add Member',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )),
              kheight30,
            ],
          ),
        ),
      ),
    );
  }
}

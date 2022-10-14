import 'package:family_tree/features/forms/controller/form_controller.dart';
import 'package:family_tree/features/forms/widget/text_form_field.dart';
import 'package:family_tree/utils/colors.dart';
import 'package:family_tree/utils/constraints.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormPage extends StatelessWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FormController>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBlack,
        // toolbarHeight: 100,
        elevation: 0,
        title: const Center(
          child: Text(
            'Add Member',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              kheight20, 
              const Center(
                child: CircleAvatar(
                  radius: 70,
                  backgroundImage: NetworkImage(
                      'https://cdn.dribbble.com/users/1176657/screenshots/15468294/media/34af996ddff444391edab94abcf3c7f3.png?compress=1&resize=400x300'),
                ),
              ),
              kheight20,
              TextFormWidget(
                controller: provider.nameController,
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
              TextFormWidget(
                controller: provider.aliasController,
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
              Card(
                child: provider.father == null
                    ? const ListTile(
                        title: Text('Please Add Father'),
                      )
                    : ListTile(
                        title: Text(provider.father?.name ?? ""),
                      ),
              ),
              kheight,
              Card(
                child: provider.father == null
                    ? const ListTile(
                        title: Text('Please Add Mother'),
                      )
                    : ListTile(
                        title: Text(provider.father?.name ?? ""),
                      ),
              ),
              kheight,
              TextFormWidget(
                controller: provider.mobileController,
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
              TextFormWidget(
                controller: provider.addressController,
                icon: Icons.text_format_outlined,
                hintText: 'Address',
                iconsize: 28,
                textHeight: 10,
                padding: 20,
                color: kBlack,
                radius: 15,
                iconcolor: kBlack,
              ),
              kheight,
              Row(
                  children: [
                    kWidth10,
                    const Text('Is Member Female',
                        style: TextStyle(fontSize: 20)),
                    kWidth20,
                    Transform.scale(
                        scale: 1.5,
                        child: Switch(
                          onChanged: (_) {
                            provider.toggleFemaleMode();
                          },
                          value: provider.isFemaile,
                        )),
                  ]),
              kheight,
              Visibility(
                visible: provider.isFemaile, 
                child: Column(
                  children: [
                    TextFormWidget(
                      controller: provider.husbandNameController,
                      icon: Icons.text_format_outlined,
                      hintText: 'Husband Name',
                      iconsize: 28,
                      textHeight: 10,
                      padding: 20,
                      color: kBlack,
                      radius: 15,
                      iconcolor: kBlack,
                    ),
                    kheight,
                    TextFormWidget(
                      controller: provider.childrenController,
                      icon: Icons.text_format_outlined,
                      hintText: 'Children',
                      iconsize: 28,
                      textHeight: 10,
                      padding: 20,
                      color: kBlack,
                      radius: 15,
                      iconcolor: kBlack,
                    ),
                  ],
                ),
              ),
              kheight20,
              ElevatedButton(
                  onPressed: () {
                    provider.uploadImage(); 
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: kBlack,
                      minimumSize: const Size(250, 50)),
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

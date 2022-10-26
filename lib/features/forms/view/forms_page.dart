import 'package:family_tree/features/forms/controller/form_controller.dart';
import 'package:family_tree/features/forms/view/search_page.dart';
import 'package:family_tree/features/forms/widget/text_form_field.dart';
import 'package:family_tree/features/home/view/details_page/user_details.dart';
import 'package:family_tree/utils/colors.dart';
import 'package:family_tree/utils/constraints.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormPage extends StatelessWidget {
  const FormPage({this.fromId, Key? key}) : super(key: key);
  final String? fromId;
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
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
          ),
          child: SingleChildScrollView(
            child: Form(
              key: provider.formKey,
              child: Column(
                children: [
                  kheight20,
                  Center(
                    child: InkWell(
                      onTap: () => provider.pickCompressedImage(),
                      child: CircleAvatar(
                        radius: 70,
                        backgroundImage: const NetworkImage(
                            'https://gptckannur.ac.in/wp-content/uploads/2021/09/profile-pic-placeholder.jpg'),
                        child: provider.imageFile == null
                            ? provider.imageUrl != null &&
                                    provider.imageUrl!.isNotEmpty
                                ? Image.network(provider.imageUrl ?? '')
                                : null
                            : SizedBox(
                                height: 140,
                                width: 140,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100.0),
                                  child: Image.file(
                                    provider.imageFile!,
                                    fit: BoxFit.cover,
                                  ),
                                )),
                      ),
                    ),
                  ),
                  kheight20,
                  TextFormWidget(
                    validate: true,
                    controller: provider.nameController,
                    icon: Icons.person,
                    hintText: 'Name',
                    iconcolor: kBlack,
                  ),
                  kheight,
                  TextFormWidget(
                    controller: provider.aliasController,
                    icon: Icons.text_format,
                    hintText: 'Nick Name',
                  ),
                  kheight,
                  TextFormWidget(
                    validate: true,
                    controller: provider.houseController,
                    icon: Icons.home,
                    hintText: 'House Name',
                  ),
                  kheight,
                  Row(children: [
                    kWidth10,
                    const Text('Is Member In-Law',
                        style: TextStyle(fontSize: 20)),
                    kWidth20,
                    Transform.scale(
                        scale: 1.5,
                        child: Switch(
                          onChanged: (_) {
                            provider.toggleInLawMode();
                          },
                          value: provider.isMemberInlaw,
                        )),
                  ]),
                  kheight,
                  Visibility(
                    visible: provider.isMemberInlaw,
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Husband"),
                            Card(
                              child: provider.husband == null
                                  ? ListTile(
                                      title: const Text('Please Add Husband'),
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const SearchPage(
                                                      title: "Husband"),
                                            ));
                                      },
                                    )
                                  : ListTile(
                                      trailing: InkWell(
                                          child: const Icon(Icons.close,
                                              color: Colors.red),
                                          onTap: () {
                                            context
                                                .read<FormController>()
                                                .clearHusband();
                                          }),
                                      leading: CircleAvatar(
                                        radius: 30,
                                        backgroundImage: const NetworkImage(
                                            'https://gptckannur.ac.in/wp-content/uploads/2021/09/profile-pic-placeholder.jpg'),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          child: SizedBox(
                                            height: 100,
                                            width: 100,
                                            child: Image.network(
                                              provider.husband?.imageUrl ??
                                                  'https://gptckannur.ac.in/wp-content/uploads/2021/09/profile-pic-placeholder.jpg',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      title: Text(provider.husband?.name ?? ""),
                                      subtitle: Text(
                                          provider.husband?.fatherName ?? ""),
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const SearchPage(
                                                      title: "Husband"),
                                            ));
                                      },
                                    ),
                            ),
                          ],
                        ),
                        kheight,
                        TextFormWidget(
                          controller: provider.fatherNameController,
                          icon: Icons.text_format_outlined,
                          hintText: 'Name of Father',
                        ),
                        kheight,
                        TextFormWidget(
                          controller: provider.motherNameController,
                          icon: Icons.text_format_outlined,
                          hintText: 'Name of Mother',
                        ),
                      ],
                    ),
                  ),
                  Visibility(
                      visible: !provider.isMemberInlaw,
                      child: Column(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Father"),
                              Card(
                                child: provider.father == null
                                    ? ListTile(
                                        title: const Text('Please Add Father'),
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const SearchPage(
                                                        title: "Father"),
                                              ));
                                        },
                                      )
                                    : ListTile(
                                        trailing: InkWell(
                                            child: const Icon(Icons.close,
                                                color: Colors.red),
                                            onTap: () {
                                              context
                                                  .read<FormController>()
                                                  .clearFather();
                                            }),
                                        leading: CircleAvatar(
                                          radius: 30,
                                          backgroundImage: const NetworkImage(
                                              'https://gptckannur.ac.in/wp-content/uploads/2021/09/profile-pic-placeholder.jpg'),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            child: SizedBox(
                                              height: 100,
                                              width: 100,
                                              child: Image.network(
                                                provider.father?.imageUrl ??
                                                    'https://gptckannur.ac.in/wp-content/uploads/2021/09/profile-pic-placeholder.jpg',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                        title:
                                            Text(provider.father?.name ?? ""),
                                        subtitle: Text(
                                            provider.father?.fatherName ?? ""),
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const SearchPage(
                                                        title: "Father"),
                                              ));
                                        },
                                      ),
                              ),
                            ],
                          ),
                          kheight,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Mother"),
                              Card(
                                child: provider.mother == null
                                    ? ListTile(
                                        title: const Text('Please Add Mother'),
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const SearchPage(
                                                        title: "Mother"),
                                              ));
                                        },
                                      )
                                    : ListTile(
                                        trailing: InkWell(
                                            onTap: () {
                                              context
                                                  .read<FormController>()
                                                  .clearMother();
                                            },
                                            child: const Icon(Icons.close,
                                                color: Colors.red)),
                                        leading: CircleAvatar(
                                          radius: 30,
                                          backgroundImage: const NetworkImage(
                                              'https://gptckannur.ac.in/wp-content/uploads/2021/09/profile-pic-placeholder.jpg'),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            child: SizedBox(
                                              height: 100,
                                              width: 100,
                                              child: Image.network(
                                                provider.mother?.imageUrl ??
                                                    'https://gptckannur.ac.in/wp-content/uploads/2021/09/profile-pic-placeholder.jpg',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                        title: Text(provider.mother?.name ??
                                            "Please add Mother Name"),
                                        subtitle: Text(
                                            provider.mother?.husbandName ?? ""),
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const SearchPage(
                                                        title: "Mother"),
                                              ));
                                        },
                                      ),
                              ),
                            ],
                          ),
                        ],
                      )),
                  kheight,
                  TextFormWidget(
                    controller: provider.mobileController,
                    icon: Icons.phone,
                    hintText: 'Mobile',
                    isNumber: true,
                  ),
                  kheight,
                  TextFormWidget(
                    controller: provider.birthYearController,
                    icon: Icons.cake,
                    hintText: 'Year of Birth',
                    isNumber: true,
                  ),
                  kheight,
                  TextFormWidget(
                    controller: provider.addressController,
                    icon: Icons.text_format_outlined,
                    hintText: 'Address',
                  ),
                  kheight,
                  Row(children: [
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
                          value: provider.isFemale,
                        )),
                  ]),
                  kheight,
                  Visibility(
                    visible: provider.isFemale,
                    child: Column(
                      children: [
                        TextFormWidget(
                          controller: provider.husbandNameController,
                          icon: Icons.text_format_outlined,
                          hintText: 'Husband Name',
                        ),
                        kheight,
                        TextFormWidget(
                          controller: provider.childrenController,
                          icon: Icons.text_format_outlined,
                          hintText: 'Children',
                        ),
                      ],
                    ),
                  ),
                  kheight20,
                  ElevatedButton(
                      onPressed: () async {
                        final id = await provider.addMember(context);
                        if (id == null) {}
                        if (id != null) {
                          Navigator.pop(context);
                          Navigator.pop(context);
                          if (fromId == null) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => UserDetailsPage(
                                    memberId: id,
                                  ),
                                ));
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => UserDetailsPage(
                                    memberId: fromId,
                                  ),
                                ));
                          }
                          provider.clearAllFields();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: kBlack,
                          minimumSize: const Size(250, 50)),
                      child: const Text(
                        'Update Member',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )),
                  kheight30,
                ],
              ),
            ),
          )),
    );
  }
}

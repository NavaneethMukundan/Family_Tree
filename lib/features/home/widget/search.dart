import 'package:family_tree/utils/colors.dart';
import 'package:family_tree/utils/routes.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 150,
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        RouteController.popupRoute(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: kBlack,
                      )),
                  const Padding(
                    padding: EdgeInsets.only(right: 130),
                    child: Text(
                      'Search',
                      style: TextStyle(
                          color: kBlack,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              TextField(
                autofocus: true,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Search',
                    prefixIcon: Icon(Icons.search)),
                onChanged: (String? value) {},
              ),
            ],
          ),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SafeArea(
              child: ListView.separated(
                  padding: const EdgeInsets.only(top: 20),
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: const CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                          'https://static.vecteezy.com/system/resources/thumbnails/001/234/720/small/portrait-of-a-black-young-man.jpg',
                        ),
                      ),
                      title: const Text(
                        'User Name',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w400),
                      ),
                      trailing: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.arrow_forward_ios_sharp,
                            color: kBlack,
                            size: 25,
                          )),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                  itemCount: 1))),
    );
  }
}

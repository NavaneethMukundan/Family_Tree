import 'package:family_tree/utils/colors.dart';
import 'package:family_tree/utils/constraints.dart';
import 'package:flutter/material.dart';

class UserDetailsPage extends StatelessWidget {
  const UserDetailsPage({super.key});

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
            'Tree View',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              kheight20,
              Row(
                children: [
                  Card(
                    elevation: 20,
                    shadowColor: kGrey,
                    shape: const CircleBorder(),
                    color: kblue,
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: kBlack),
                          image: const DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT6O3TnZ4tksBRP43nvtRlPfOxkUOc0wxjqSw&usqp=CAU'))),
                    ),
                  ),
                  kWidth20,
                  Expanded(
                    child: SizedBox(
                      height: 110,
                      child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              Card(
                                shadowColor: kGrey,
                                elevation: 10,
                                shape: const CircleBorder(),
                                color: kblue,
                                child: Container(
                                  height: 80,
                                  width: 80,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      border: Border.all(color: kBlack),
                                      image: const DecorationImage(
                                          fit: BoxFit.fill,
                                          image: NetworkImage(
                                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRdTrss4dCtYvMu4hr8pyZ31Zh3hjvTXWcrpA&usqp=CAU'))),
                                ),
                              )
                            ],
                          );
                        },
                        separatorBuilder: (context, index) {
                          return kWidth;
                        },
                        itemCount: 1,
                      ),
                    ),
                  )
                ],
              ),
              Image.asset(
                'assets/design.png',
                color: kBlack,
              ),
              const Center(
                child: Text(
                  'Family',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              kheight,
              const Text(
                'Parents',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
              ),
              kheight20,
              Row(
                children: [
                  Card(
                    elevation: 20,
                    shadowColor: kGrey,
                    shape: const CircleBorder(),
                    color: kblue,
                    child: Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: kBlack),
                          image: const DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                  'https://thumbs.dreamstime.com/b/cartoon-senior-elderly-old-man-vector-illustration-145176212.jpg'))),
                    ),
                  ),
                  kWidth20,
                  Card(
                    elevation: 20,
                    shadowColor: kGrey,
                    shape: const CircleBorder(),
                    color: kblue,
                    child: Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: kBlack),
                          image: const DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                  'https://cdn2.vectorstock.com/i/1000x1000/32/86/cartoon-old-woman-with-a-cane-vector-25043286.jpg'))),
                    ),
                  )
                ],
              ),
              kheight20,
              const Text(
                'Childrens',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
              ),
              kheight20,
              GridView.builder(
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 20,
                    crossAxisCount: 4,
                    mainAxisSpacing: 20),
                itemBuilder: (_, index) => GestureDetector(
                  child: Card(
                    elevation: 15,
                    shadowColor: kGrey,
                    shape: const CircleBorder(),
                    color: kblue,
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: kBlack),
                          image: const DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                  'https://i.pinimg.com/originals/42/5f/77/425f77d2aa6bf3f1fe63e0b2e94cbc88.jpg'))),
                    ),
                  ),
                ),
                itemCount: 5,
              ),
              Image.asset(
                'assets/design.png',
                color: kBlack,
              ),
              const Center(
                child: Text(
                  'Details',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              kheight20,
              const Text(
                'Address :',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
              ),
              kheight,
              const Text(
                'Pulath Pulikkottil House \nPuthan Purakkal \nKerala, India',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              kheight20,
            ],
          ),
        ),
      ),
    );
  }
}

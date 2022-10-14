import 'package:family_tree/features/home/widget/bottom_sheet.dart';
import 'package:family_tree/features/home/widget/floating_btn.dart';
import 'package:family_tree/features/home/widget/search.dart';
import 'package:family_tree/utils/colors.dart';
import 'package:family_tree/utils/constraints.dart';
import 'package:family_tree/utils/routes.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBlack,
        toolbarHeight: 100,
        elevation: 0,
        title: const Center(
          child: Text(
            'PULATHU PULIKOTTIL',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                      // height: 110,  
                      child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                                SizedBox(
                                  width: 100,
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.all(Radius.circular(100)),
                                          child: SizedBox(
                                            height: 80,
                                            width: 80,
                                            child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRdTrss4dCtYvMu4hr8pyZ31Zh3hjvTXWcrpA&usqp=CAU'))),
                                      ),
                                        Text('Mohammed Riyas Tpdfsfsdfsfsfsfsfsffssafsadfsfsfsfsffsdffdf ')
                                    ],
                                  ),
                                )
                              // Card(
                              //   shadowColor: kGrey,
                              //   elevation: 10,
                              //   shape: const CircleBorder(),
                              //   color: kblue,
                              //   child: Container(
                              //     height: 80,
                              //     width: 80,
                              //     decoration: BoxDecoration(
                              //         borderRadius: BorderRadius.circular(50),
                              //         border: Border.all(color: kBlack),
                              //         image: const DecorationImage(
                              //             fit: BoxFit.fill,
                              //             image: NetworkImage(
                              //                 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRdTrss4dCtYvMu4hr8pyZ31Zh3hjvTXWcrpA&usqp=CAU'))),
                              //   ),
                              // )
                            ],
                          );
                        },
                        separatorBuilder: (context, index) {
                          return kWidth20;
                        },
                        itemCount: 3,
                      ),
                    ),
                  )
                ],
              ),
              Image.asset(
                'assets/design.png',
                color: kBlack,
              ),
              kheight20,
              const Text(
                'Children',
                style: TextStyle(
                  letterSpacing: 0.5,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              kheight20,
              GridView.builder(
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 20,
                    crossAxisCount: 3,
                    mainAxisSpacing: 20),
                itemBuilder: (_, index) => Card(
                  elevation: 15,
                  shadowColor: kGrey,
                  shape: const CircleBorder(),
                  color: kblue,
                  child: Column(
                    children: [
                      Container(
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
                      // Text("Mohammed Riyasdfsdfsds Tpsfsfsfsfsdf sfsdfsdfs  dffd"),
                 
                    ],
                  ),
                ),
                itemCount: 5,
              )
            ],
          ),
        ),
      ),
      floatingActionButton: ElevatedButton(
          onPressed: () {
            RouteController.pushRoute(context, const FormPage());
          },
          style: ElevatedButton.styleFrom(
              minimumSize: const Size(60, 60),
              primary: kBlack,
              shape: const CircleBorder()),
          child: const Icon(Icons.add)),
    );
  }
}

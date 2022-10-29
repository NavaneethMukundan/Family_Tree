// import 'package:family_tree/features/register/view/signin.dart';
// import 'package:family_tree/utils/colors.dart';
// import 'package:family_tree/utils/constraints.dart';
// import 'package:family_tree/utils/routes.dart';
// import 'package:flutter/material.dart';

// class OnBoardScreen extends StatelessWidget {
//   const OnBoardScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: MediaQuery.of(context).size.height,
//       width: MediaQuery.of(context).size.width,
//       decoration: BoxDecoration(
//         image: DecorationImage(
//           colorFilter:
//               ColorFilter.mode(kGrey.withOpacity(0.5), BlendMode.dstATop),
//           fit: BoxFit.fill,
//           image: const AssetImage(
//             'assets/edited2.jpg',
//           ),
//         ),
//       ),
//       child: Scaffold(
//         backgroundColor: Colors.transparent,
//         body: SafeArea(
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.end,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: const [
//                 Text(
//                   'PULATHU \nPULIKOTTIL',
//                   style: TextStyle(
//                       fontSize: 50, fontWeight: FontWeight.bold, color: kWhite),
//                 ),
//                 kheight20,
//                 Text(
//                   '“The strength of a family, like the strength\n of an army, lies in its loyalty to each other.”',
//                   style: TextStyle(
//                       fontSize: 17, fontWeight: FontWeight.w500, color: kWhite),
//                 ),
//                 kheight50,
//                 kheight30
//               ],
//             ),
//           ),
//         ),
//         floatingActionButton: Padding(
//           padding: const EdgeInsets.only(bottom: 5),
//           child: ElevatedButton(
//               onPressed: () {
//                 RouteController.pushReplacementRoute(
//                     context, const SigninScreen());
//               },
//               style: ElevatedButton.styleFrom(
//                   shape: const CircleBorder(),
//                   backgroundColor: Colors.transparent,
//                   elevation: 0),
//               child: const Icon(
//                 Icons.arrow_right_alt_outlined,
//                 color: kWhite,
//                 size: 70,
//               )),
//         ),
//       ),
//     );
//   }
// }

import 'package:family_tree/features/register/view/signin.dart';
import 'package:family_tree/utils/colors.dart';
import 'package:family_tree/utils/constraints.dart';
import 'package:family_tree/utils/routes.dart';
import 'package:flutter/material.dart';

class OnBoardScreen extends StatelessWidget {
  const OnBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 450,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/edited2.jpg'))),
            ),
            kheight20,
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'PULATHU \nPULIKOTTIL',
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: kBlack),
                  ),
                  kheight20,
                  const Text(
                    '“The strength of a family, like the strength\n of an army, lies in its loyalty to each other.”',
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: kBlack),
                  ),
                  kheight50,
                  Center(
                    child: ElevatedButton(
                        onPressed: () {
                          RouteController.pushReplacementRoute(
                              context, const SigninScreen());
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: kBlack,
                            minimumSize: const Size(200, 70)),
                        child: const Icon(
                          Icons.arrow_right_alt_outlined,
                          size: 55,
                        )),
                  ),
                  kheight50,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

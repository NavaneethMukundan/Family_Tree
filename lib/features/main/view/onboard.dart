import 'package:family_tree/features/register/view/signin.dart';
import 'package:family_tree/utils/colors.dart';
import 'package:family_tree/utils/constraints.dart';
import 'package:family_tree/utils/routes.dart';
import 'package:flutter/material.dart';

class OnBoardScreen extends StatelessWidget {
  const OnBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          image: DecorationImage(
              colorFilter:
                  ColorFilter.mode(kGrey.withOpacity(0.5), BlendMode.dstATop),
              fit: BoxFit.cover,
              image: const AssetImage(
                'assets/onboard.png',
              ))), 
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'PULATHU \nPULIKOTTIL',
                  style: TextStyle(
                      fontSize: 50, fontWeight: FontWeight.bold, color: kWhite),
                ),
                kheight20,
                Text(
                  '“The strength of a family, like the strength\n of an army, lies in its loyalty to each other.”',
                  style: TextStyle(
                      fontSize: 17, fontWeight: FontWeight.w500, color: kWhite),
                ),
                kheight50,
                kheight30
              ],
            ),
          ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(right: 20, bottom: 30),
          child: IconButton(
              splashRadius: 50,
              splashColor: Colors.transparent,
              onPressed: () {
                RouteController.pushReplacementRoute(
                    context, const SigninScreen());
              },
              icon: const Icon(
                Icons.arrow_right_alt_outlined,
                color: kWhite,
                size: 70,
              )),
        ),
      ),
    );
  }
}

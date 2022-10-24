import 'package:family_tree/features/home/view/home_page.dart';
import 'package:family_tree/features/register/controller/signin.dart';
import 'package:family_tree/utils/colors.dart';
import 'package:family_tree/utils/constraints.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SigninController>(context, listen: false);
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: provider.signInFormKeys,
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
              const Text(
                'Hello!',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              const Text(
                'Sign in to your account',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
              ),
              kheight,
              Consumer<SigninController>(builder: (context, value, child) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: provider.secretkey,
                    obscureText: value.isHidden ? false : true,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.key,
                          color: kBlack,
                        ),
                        suffixIcon: IconButton(
                            onPressed: () {
                              provider.isHidden = !provider.isHidden;
                            },
                            icon: Icon(
                              provider.isHidden
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: kBlack,
                            )),
                        hintText: 'Secret key',
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
                );
              }),
              kheight,
              Consumer<SigninController>(builder: (context, value, child) {
                return ElevatedButton(
                    onPressed: () {
                      value.formValidation(context, const HomePage());
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: kBlack,
                        minimumSize: const Size(200, 70)),
                    child: const Text(
                      'Login',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ));
              }),
              kheight50,
            ],
          ),
        ),
      ),
    );
  }
}

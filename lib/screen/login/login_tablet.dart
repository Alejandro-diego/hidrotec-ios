import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hidrotec/widget/form.dart';
import 'package:hidrotec/widget/information.dart';
import 'package:hidrotec/widget/iotech_logo_small.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widget/logo.dart';

class TabletLoginScrenn extends StatefulWidget {
  const TabletLoginScrenn({
    Key? key,
  }) : super(key: key);

  @override
  State<TabletLoginScrenn> createState() => _TabletLoginScrennState();
}

class _TabletLoginScrennState extends State<TabletLoginScrenn> {
  DatabaseReference database = FirebaseDatabase.instance.ref();

  late String email = "";
  late String pass = "";

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
      child: Stack(
        children: [
          Positioned(
              width: size.width * 0.88,
              height: size.height,
              left: size.width * 0.05,
              bottom: size.height * -0.05,
              child: LogoHidrotec1(
                fontSize1: 35,
                fontSize2: 10,
              )),
          Positioned(
            width: size.width * 0.90,
            height: size.height,
            left: size.width * -0.21,
            bottom: -size.height * 0.09,
            child: const Information(),
          ),
          Positioned(
            width: size.width * 0.7,
            height: size.height,
            left: size.width * 0.34,
            bottom: size.height * -0.1,
            child: FormSigIn(
              keyvalidator: _formKey,
              passcontroller: _passController,
              usercontroller: _emailController,
            ),
          ),
          Positioned(
            left: size.width * 0.22,
            bottom: size.height * 0.1,
            child: SizedBox(
              height: 50,
              width: size.width * .5,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Colors.black,
                        content: Text(
                          'Firebase Go',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                    sigIN();
                    _colocarCredenciales();
                  }
                },
                style: ElevatedButton.styleFrom(
                  shadowColor: Colors.black,
                  primary: const Color.fromARGB(255, 19, 18, 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                child: const Text(
                  'Log in',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
          Positioned(
            right: size.width * 0.05,
            top: size.height * 0.93,
            child: const IotechLogo(),
          ),
        ],
      ),
    );
  }

  Future sigIN() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        if (kDebugMode) {
          print('No user found for that email.');
        }
      } else if (e.code == 'wrong-password') {
        if (kDebugMode) {
          print('Wrong password provided for that user.');
        }
      }
    }
  }

  Future<void> _colocarCredenciales() async {
    SharedPreferences preference = await SharedPreferences.getInstance();

    setState(
      () {
        preference.setString('emai', _emailController.text);
        preference.setString('password', _passController.text);
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hidrotec/screen/login/login_ipad.dart';

import '../../responsive.dart';
import 'login_tablet.dart';
import 'login_movil.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("lib/image/pool.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: const Responsive(
          mobile: MobileLoginScrenn(),
          tablet: TabletLoginScrenn(),
          ipad: IpadLoginScrenn(),
        ),
      ),
    );
  }
}

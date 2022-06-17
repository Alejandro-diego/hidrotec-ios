import 'package:flutter/material.dart';

import '../../responsive.dart';
import 'login-tablet.dart';
import 'login_movil.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Responsive(
        mobile: MobileLoginScrenn(),
        tablet: TabletLoginScrenn(),
      ),
    );
  }
}

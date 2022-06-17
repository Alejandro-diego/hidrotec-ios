import 'package:flutter/material.dart';

import '../../widget/form.dart';
import '../../widget/logo.dart';

class LogPage extends StatefulWidget {
  const LogPage({Key? key}) : super(key: key);

  @override
  State<LogPage> createState() => _LogPageState();
}

class _LogPageState extends State<LogPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            LogoHidrotec(
              fontSize1: 35,
              fontSize2: 10,
            ),
            Row(
              children: [
                const Spacer(),
                Expanded(
                  flex: 8,
                  child: FormSigIn(
                    keyvalidator: _formKey,
                    passcontroller: _passController,
                    usercontroller: _emailController,
                  ),
                ),
                const Spacer(),
              ],
            )
          ],
        ),
      ),
    );
  }
}

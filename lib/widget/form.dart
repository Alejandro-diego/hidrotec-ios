import 'package:flutter/material.dart';



class FormSigIn extends StatefulWidget {
  const FormSigIn(
      {Key? key,
      required this.passcontroller,
      required this.usercontroller,
      required this.keyvalidator})
      : super(key: key);

  final TextEditingController usercontroller;
  final TextEditingController passcontroller;
  final GlobalKey<FormState> keyvalidator;

  @override
  State<FormSigIn> createState() => _FormSigInState();
}

class _FormSigInState extends State<FormSigIn> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.13),
      child: Form(
        key: widget.keyvalidator,
        child: Column(
          children: [
            const Spacer(),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: widget.usercontroller,
              cursorColor: Colors.amberAccent,
              style: const TextStyle(fontSize: 20),
              decoration: const InputDecoration(
                hintText: 'Usuario',
                prefixIcon: Padding(
                  child: Icon(
                    Icons.person_outline,
                    size: 35,
                    color: Colors.grey,
                  ),
                  padding: EdgeInsetsDirectional.only(start: 2),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Colors.amberAccent),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Ingresar e-mail';
                }
                return null;
              },
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16 * 1.50),
              child: TextFormField(
                controller: widget.passcontroller,
                cursorColor: Colors.amberAccent,
                style: const TextStyle(fontSize: 20),
                decoration: const InputDecoration(
                  hintText: 'Senha',
                  prefixIcon: Padding(
                    child: Icon(
                      Icons.lock_outline_rounded,
                      size: 35,
                      color: Colors.grey,
                    ),
                    padding: EdgeInsetsDirectional.only(start: 2),
                  ),
                  focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(width: 2, color: Colors.amberAccent)),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Senha';
                  }
                  return null;
                },
              ),
            ),
            const Spacer(flex: 2)
          ],
        ),
      ),
    );
  }
}

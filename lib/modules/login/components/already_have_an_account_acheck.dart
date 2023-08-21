import 'package:flutter/material.dart';

import '../../../utils/colors.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final Function press;
  const AlreadyHaveAnAccountCheck({
    Key? key,
    required this.login,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? "Already Member? " : "Not a Member? ",
          style: TextStyle(color: kPrimaryColor),
        ),
        GestureDetector(
          onTap: () {
            press();
          },
          child: Text(
            login ? "Login" : "Register",
            style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}

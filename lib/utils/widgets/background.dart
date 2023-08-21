import 'package:flutter/material.dart';

import '../colors.dart';

class Background extends StatelessWidget {
  final Widget child;

  const Background({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        width: double.infinity,
        height: size.height,
        color: kWhiteGreyColor,
        child: child,
      ),
    );
  }
}

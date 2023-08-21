import 'package:app_demo/utils/widgets/text_field_container.dart';
import 'package:flutter/material.dart';

import '../colors.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final Key? key;
  final TextEditingController controller;
  final bool enable;
  final FormFieldValidator<String>? validator;
  final Color? borderSideColor;

  const RoundedInputField(
      {required this.hintText,
      this.icon = Icons.person,
      this.key,
      required this.controller,
      required this.enable,
      required this.validator,
      this.borderSideColor});

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        key: key,
        validator: validator,
        cursorColor: kPrimaryColor,
        controller: controller,
        enabled: enable,
        autofocus: false,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          hintText: hintText,
          border: borderSideColor == null
              ? InputBorder.none
              : OutlineInputBorder(
                  borderSide: BorderSide(color: borderSideColor!),
                ),
        ),
      ),
    );
  }
}

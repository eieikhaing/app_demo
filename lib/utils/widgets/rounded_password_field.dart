import 'package:app_demo/utils/widgets/text_field_container.dart';
import 'package:flutter/material.dart';

import '../colors.dart';

class RoundedPasswordField extends StatelessWidget {
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  final String hint;
  final Color? borderSideColor;

  const RoundedPasswordField(
      {Key? key,
      required this.controller,
      required this.validator,
      required this.hint,
      this.borderSideColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      key: key,
      child: TextFormField(
        obscureText: true,
        cursorColor: kPrimaryColor,
        controller: controller,
        validator: validator,
        autofocus: false,
        decoration: InputDecoration(
          hintText: hint,
          icon: const Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          suffixIcon: const Icon(
            Icons.visibility,
            color: kPrimaryColor,
          ),
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

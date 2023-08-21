import 'package:app_demo/modules/login/components/already_have_an_account_acheck.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/login_controller.dart';
import '../../../utils/colors.dart';
import '../../../utils/dimens.dart';
import '../../../utils/widgets/background.dart';
import '../../../utils/widgets/rounded_button.dart';
import '../../../utils/widgets/rounded_input_field.dart';
import '../../../utils/widgets/rounded_password_field.dart';
import '../../../utils/widgets/sizebox_small.dart';
import '../../../utils/style.dart' as st;

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _controller = Get.put(LoginController()); // inject controller
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  var _toggle = false;
  late AutovalidateMode autovalidateMode;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Obx(() {
        return SingleChildScrollView(
          child: SizedBox(
            width: size.width,
            height: size.height,
            child: Form(
              key: _key,
              child: Column(
                verticalDirection: VerticalDirection.down,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizeBoxSmall(size: size),
                  Align(
                    alignment: Alignment.topRight,
                    child: buildLangContainer(),
                  ),
                  Expanded(
                    child: buildLoginForm(size),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  Column buildLoginForm(Size size) {
    return Column(
      verticalDirection: VerticalDirection.down,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'sign_in'.tr,
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: dTextSizeTitle),
        ),
        SizeBoxSmall(size: size),
        Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
                child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Row(children: [
                Expanded(
                  child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      onChanged: ((value) {}),
                      controller: _emailController,
                      decoration: InputDecoration(
                        isCollapsed: false,
                        border: const OutlineInputBorder(),
                        labelText: 'gmail'.tr,
                        hintText: 'gmail'.tr,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 12.0),
                      ),
                      validator: (value) => _controller.validateEmail(value)),
                ),
              ]),
            ))),
        RoundedInputField(
            hintText: 'gmail'.tr,
            controller: _emailController,
            enable: !_controller.isLoading.value,
            validator: (value) => _controller.validateEmail(value)),
        Visibility(
          visible: _controller.isLoading.value,
          child: const CircularProgressIndicator(),
        ),
        RoundedPasswordField(
            hint: 'password'.tr,
            controller: _passwordController,
            validator: (value) => _controller.validatePassword(value)),
        RoundedButton(
          text: 'login'.tr,
          press: () {
            if (_key.currentState!.validate()) {
              // _controller.login(
              //     _emailController.text, _passwordController.text);
            }
          },
          color: kPrimaryDark,
          textColor: kPrimaryLightColor,
        ),
        SizedBox(height: size.height * 0.03),
        AlreadyHaveAnAccountCheck(
          login: false,
          press: () {
            // _controller.navigateToSignUp();
          },
        ),
        SizeBoxSmall(size: size),
        Align(
          alignment: Alignment.bottomRight,
          child: SizedBox(
            width: dItemDetailPictWidth,
            child: SwitchListTile(
                title: const Text("Dark Theme"),
                secondary: const Icon(Icons.dark_mode),
                tileColor: Colors.transparent,
                activeColor: kPrimaryDark,
                value: _toggle,
                onChanged: (value) {
                  setState(() {
                    _toggle = value;
                    _controller.changeDarkTheme(value);
                  });
                }),
          ),
        ),
      ],
    );
  }

  SizedBox buildLangContainer() {
    return SizedBox(
      width: dProfilePictureSize,
      child: Row(
        children: [
          Container(
            width: 40.0,
            height: 30.0,
            color: kLightGrey,
            child: TextButton(
              child: Text(
                "EN",
                style: st.stWhiteText(),
              ),
              onPressed: () => _controller.setMyanmarLan(false),
            ),
          ),
          Container(
            width: 40.0,
            height: 30.0,
            color: kPrimaryDark,
            child: TextButton(
              child: Text(
                "MY",
                style: st.stWhiteText(),
              ),
              onPressed: () => _controller.setMyanmarLan(true),
            ),
          ),
        ],
      ),
    );
  }
}

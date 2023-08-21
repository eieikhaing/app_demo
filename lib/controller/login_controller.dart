import 'dart:ui';

import 'package:app_demo/utils/extension.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../utils/const.dart';
import '../utils/theme.dart';

class LoginController extends GetxController {
  // late LoginRequestModel _requestModel;
  var isLoading = false.obs;
  final String spaceId = "1";
  late String password;
  late GetStorage _storage;
  late String email;
  var mmLang = const Locale('mm', 'MY');
  var enLang = const Locale('en', 'US');

  @override
  Future<void> onInit() async {
    _storage = await storage();
    super.onInit();
  }

  // void login(String email, String password) {
  //   isLoading(true);
  //   _requestModel = LoginRequestModel(email, password, spaceId);
  //   LoginProvider().login(
  //       requestBody: _requestModel.loginFormData(),
  //       onSuccess: (resp) {
  //         isLoading(false);
  //         var _responseData = DefaultServerResponse.fromJson(resp.data);
  //         if (_responseData.data != null) {
  //           var _loginModel = LoginModel.fromJson(_responseData.data!);
  //           _setAccessToken(_loginModel.token.accessToken);
  //           _setRefreshToken(_loginModel.token.refreshToken.filterNull());
  //           AppService.to.login();
  //           _setUserInfo(_loginModel.user);
  //           navigateToLeaveList();
  //         }
  //       },
  //       onError: (error) {
  //         print("Error here" + error.toString());
  //         isLoading(false);
  //       });
  // }

  void showDialog(storeToken) {
    Get.defaultDialog(
        title: "Dialog", middleText: storeToken, textCancel: "Cancel");
  }

  String? validatePassword(String? value) {
    return value.filterNull().trim().isNotEmpty
        ? null
        : "Please enter validate password";
  }

  String? validateEmail(String? value) {
    return GetUtils.isEmail(value.filterNull())
        ? null
        : "Please enter valid email";
  }

  _setAccessToken(String sToken) async {
    return await _storage.write(cToken, sToken);
  }

  _setRefreshToken(String rToken) async {
    return await _storage.write(cRefreshToken, rToken);
  }

  // _setUserInfo(dynamic data){
  //   return AppService.to.getStorage().write(userInfo,data);
  // }

  // void navigateToSignUp() {
  //   Get.toNamed(Routes.SIGNUP, arguments: ["Register"]);
  // }

  // void navigateToLeaveList() {
  //   Get.offNamed(Routes.DASHBOARD);
  // }

  void setMyanmarLan(bool status) {
    Get.updateLocale(status ? mmLang : enLang);
  }

  void changeDarkTheme(bool status) {
    Get.changeTheme(status ? Themes().darkTheme : Themes().lightTheme);
  }
}

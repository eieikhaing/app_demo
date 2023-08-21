import 'package:get_storage/get_storage.dart';

import 'const.dart';

extension StringExtension on String? {
  bool wasEmpty() {
    if (this != null) {
      return this!.isEmpty;
    } else {
      return false;
    }
  }

  String filterNull() {
    if (this == null) {
      return "";
    } else {
      return this!;
    }
  }
}

extension IntExtension on int? {
  bool isNull() {
    return this == null;
  }

  bool wasResponseSuccess() {
    return this == 200;
  }
}

extension Storage on void {
  Future<GetStorage> storage() async {
    return GetStorage(appName);
  }
}

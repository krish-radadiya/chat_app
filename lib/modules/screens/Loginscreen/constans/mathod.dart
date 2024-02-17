import 'dart:developer';

import 'package:chat_app/utils/helper/auth-helper.dart';

anonymous() async {
  Map<String, dynamic> res = await AuthHelper.authHelper.anonymous();
  if (res['error'] != null) {
    return log("Login Faild");
  } else {
    return log("Login Succes");
  }
}

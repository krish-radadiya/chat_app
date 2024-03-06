import 'dart:developer';
import 'package:chat_app/modules/screens/Loginscreen/model/sign-up-model.dart';
import 'package:chat_app/utils/helper/auth-helper.dart';
import 'package:chat_app/utils/helper/firestore_helper.dart';
import 'package:cherry_toast/cherry_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//todo: anonymous btn click
anonymous() async {
  Map<String, dynamic> res = await AuthHelper.authHelper.anonymous();
  if (res['error'] != null) {
    log("login failed");
  } else {
    log("login success");
    Get.offAllNamed('/home');
  }
}

//todo: signup btn click
signUp({required String email, required String password}) async {
  SignUpModel signUpModel = SignUpModel(email: email, password: password);
  Map<String, dynamic> res =
      await AuthHelper.authHelper.signUp(signUpModel: signUpModel);
  if (res['error'] != null) {
    log('signup failed');
  } else {
    log('user created');

    Get.toNamed('/login');
  }
}

//todo: login btn click
login(
    {required String email,
    required String password,
    required BuildContext context}) async {
  SignUpModel signUpModel = SignUpModel(email: email, password: password);
  Map<String, dynamic> res =
      await AuthHelper.authHelper.login(signUpModel: signUpModel);
  if (res['error'] != null) {
    return CherryToast.error(
      title: const Text("Login Failed"),
    ).show(context);
  } else {
    Get.offAllNamed('/home');
    FireStoreHelper.fireStoreHelper.addUser();
  }
}

google() async {
  Map<String, dynamic> res = await AuthHelper.authHelper.signInWithGoogle();
  if (res['error'] != null) {
    return log('login failed');
  } else {
    Get.offAllNamed('/home');
    FireStoreHelper.fireStoreHelper.addUser();
  }
}

Stack loginStack() => Stack(
      alignment: Alignment.center,
      children: [
        Divider(
          color: (Get.isDarkMode == true) ? Colors.white : Colors.black,
        ),
        Container(
          padding: const EdgeInsets.only(left: 5, right: 5),
          color: (Get.isDarkMode == true) ? Colors.black : Colors.white,
          child: const Text("OR"),
        ),
      ],
    );

Container loginContainer(
        {required String img, required BuildContext context}) =>
    Container(
      padding: const EdgeInsets.all(10),
      height: MediaQuery.sizeOf(context).height / 15,
      width: MediaQuery.sizeOf(context).height / 15,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: (Get.isDarkMode == true)
              ? Colors.white.withOpacity(0.5)
              : Colors.black.withOpacity(0.5),
        ),
      ),
      child: Image.asset(img),
    );

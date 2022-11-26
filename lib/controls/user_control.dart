import 'package:compartilhando_gurda/pages_guarda/app_pages.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class UserControls extends GetxController {
  RxBool isLoading = false.obs;
  Future signIn({required String email, required String password}) async {
    isLoading.value = true;
    final response = await Dio().get(
        'https://tecbleus-app-api-dev.herokuapp.com/login/v1/app?username=$email&password=$password&token=AYwb^!n8b4b5T%235E2A5V0@t^kTW*j9');
    if (response.data == "você está logado") {
      Get.toNamed(PagesRoute.home);
    } else {
      Fluttertoast.showToast(
          msg: "Email e/ou senha inválido",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 15);
    }
    isLoading.value = false;
  }
}

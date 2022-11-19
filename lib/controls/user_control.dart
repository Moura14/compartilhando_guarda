import 'package:dio/dio.dart';
import 'package:get/get.dart';

class UserControls extends GetxController {
  RxBool isLoading = false.obs;
  Future<void> signIn({required String email, required String password}) async {
    isLoading.value = true;
    try {
      final response = await Dio().get(
          'https://tecbleus-app-api-dev.herokuapp.com/login/v1/app?username=$email&password=$password&token=AYwb^!n8b4b5T%235E2A5V0@t^kTW*j9');

      await Future.delayed(const Duration(seconds: 2));
      isLoading.value = false;
      print(response);
    } catch (e) {
      print(e);
    }
  }
}

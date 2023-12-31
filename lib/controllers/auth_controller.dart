import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {

  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var isLoading = false.obs;

  setIsLoading(bool newValue) {
    isLoading.value = newValue;
  }
}

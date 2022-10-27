import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showCustomSnackBar(
    {String title = "info", String message = "", Color color = Colors.green}) {
  Get.snackbar(title, message, backgroundColor: color);
}

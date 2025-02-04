import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionService {
  Future<void> requestUserPermission({required Permission permission}) async {
    await permission.request().then((PermissionStatus status) {
      switch (status) {
        case PermissionStatus.granted:
          _showSnackBar(Get.context!, '$permission Permission granted', Colors.green);
        case PermissionStatus.denied:
          _showSnackBar(Get.context!, '$permission Permission denied', Colors.amber);
        case PermissionStatus.permanentlyDenied:
          _showSnackBar(Get.context!, '$permission Permanently denied', Colors.redAccent);
        default:
          _showSnackBar(Get.context!, '$permission Something went wrong', Colors.red);
      }
    });
  }

  void _showSnackBar(BuildContext context, String text, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(text, textAlign: TextAlign.center),
      backgroundColor: color,
    ));
  }
}

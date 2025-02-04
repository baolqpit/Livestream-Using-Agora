import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CameraButton extends StatefulWidget {
  const CameraButton({super.key});

  @override
  State<CameraButton> createState() => _CameraButtonState();
}

class _CameraButtonState extends State<CameraButton> {
  Rx<bool> isShowCamera = Rx<bool>(true);

  @override
  Widget build(BuildContext context) {
    return Obx(() => IconButton(
      onPressed: () {
        isShowCamera.value = !isShowCamera.value;
      },
      icon: Icon(isShowCamera.value ? Icons.videocam : Icons.videocam_off, color: Colors.white,),
      style: IconButton.styleFrom(backgroundColor: Colors.blueGrey),
    ));
  }
}

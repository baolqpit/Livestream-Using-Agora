import 'package:flutter/material.dart';

class SwitchCameraButton extends StatefulWidget {
  const SwitchCameraButton({super.key});

  @override
  State<SwitchCameraButton> createState() => _SwitchCameraButtonState();
}

class _SwitchCameraButtonState extends State<SwitchCameraButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {},
        style: IconButton.styleFrom(backgroundColor: Colors.blueGrey),
        icon: const Icon(
          Icons.cameraswitch,
          color: Colors.white,
        ));
  }
}

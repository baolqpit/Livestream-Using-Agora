import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MicrophoneButton extends StatefulWidget {
  const MicrophoneButton({super.key});

  @override
  State<MicrophoneButton> createState() => _MicrophoneButtonState();
}

class _MicrophoneButtonState extends State<MicrophoneButton> {
  Rx<bool> isMicrophoneEnabled = Rx<bool>(true);

  @override
  Widget build(BuildContext context) {
    return Obx(() => IconButton(
      onPressed: () {
        isMicrophoneEnabled.value = !isMicrophoneEnabled.value;
      },
      icon: Icon(
        isMicrophoneEnabled.value ? Icons.mic : Icons.mic_off,
        color: Colors.white,
      ),
      style: IconButton.styleFrom(
        backgroundColor: Colors.blueGrey,
      ),
    ));
  }
}

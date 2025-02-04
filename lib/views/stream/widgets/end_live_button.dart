import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EndLiveButton extends StatefulWidget {
  const EndLiveButton({super.key});

  @override
  State<EndLiveButton> createState() => _EndLiveButtonState();
}

class _EndLiveButtonState extends State<EndLiveButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Get.back();
      },
      icon: const Icon(Icons.call_end, color: Colors.white,),
      style: IconButton.styleFrom(backgroundColor: Colors.red, padding: const EdgeInsets.all(18)),
    );
  }
}

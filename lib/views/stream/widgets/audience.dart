import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:livestream_with_agora/controllers/livestream_controller.dart';

class Audience extends StatefulWidget {
  const Audience({super.key});

  @override
  State<Audience> createState() => _AudienceState();
}

class _AudienceState extends State<Audience> {
  final LivestreamController livestreamController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey.withOpacity(0.5)),
      child: Row(
        children: <Widget>[
          const Icon(
            Icons.people_alt_rounded,
            color: Colors.white,
          ),
          const SizedBox(
            width: 5.0,
          ),
          Obx(() => Text(livestreamController.audiences.value.toString(),
              style: const TextStyle(color: Colors.white)))
        ],
      ),
    );
  }
}

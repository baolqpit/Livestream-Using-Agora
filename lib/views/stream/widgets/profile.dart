import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:livestream_with_agora/controllers/livestream_controller.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final LivestreamController livestreamController = Get.find();

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey.withOpacity(0.5)),
      child: Row(
        children: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.person,
              color: Colors.white,
            ),
            style: IconButton.styleFrom(backgroundColor: Colors.blueGrey),
          ),
          const SizedBox(
            width: 5.0,
          ),
          Text(
            '${livestreamController.username.value}',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}

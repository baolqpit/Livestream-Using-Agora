import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:livestream_with_agora/controllers/livestream_controller.dart';

class CommentButton extends StatefulWidget {
  const CommentButton({super.key});

  @override
  State<CommentButton> createState() => _CommentButtonState();
}

class _CommentButtonState extends State<CommentButton> {
  final LivestreamController livestreamController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() => IconButton(
          onPressed: () {
            livestreamController.isShowAudiences.value =
                !livestreamController.isShowAudiences.value;
          },
          icon: Icon(
            livestreamController.isShowAudiences.value
                ? Icons.comment_rounded
                : Icons.comments_disabled,
            color: Colors.white,
          ),
          style: IconButton.styleFrom(backgroundColor: Colors.blueGrey),
        ));
  }
}

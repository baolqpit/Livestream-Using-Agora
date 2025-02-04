import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:livestream_with_agora/controllers/livestream_controller.dart';

class AudienceChatbox extends StatefulWidget {
  const AudienceChatbox({super.key});

  @override
  State<AudienceChatbox> createState() => _AudienceChatboxState();
}

class _AudienceChatboxState extends State<AudienceChatbox> {
  final LivestreamController livestreamController = Get.find();
  final ScrollController _scrollController = ScrollController();
  Rx<bool> isAtBottom = Rx<bool>(true);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController.addListener(() {
      isAtBottom.value = _scrollController.offset >=
          _scrollController.position.maxScrollExtent - 10;
    });

    livestreamController.comments.listen((_) {
      if (isAtBottom.value) {
        Future.delayed(const Duration(milliseconds: 100), () {
          _scrollToBottom();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => SizedBox(
          height: 200,
          child: ListView.builder(
              controller: _scrollController,
              shrinkWrap: true,
              itemCount: livestreamController.comments.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const CircleAvatar(
                    child: Icon(Icons.person),
                  ),
                  title: Text(
                      livestreamController.comments.elementAt(index)!.username),
                  subtitle: Text(livestreamController.comments
                      .elementAt(index)!
                      .liveComment),
                );
              }),
        ));
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

}

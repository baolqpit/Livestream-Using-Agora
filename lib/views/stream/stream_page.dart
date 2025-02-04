import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:livestream_with_agora/controllers/livestream_controller.dart';
import 'package:livestream_with_agora/services/agora_service.dart';
import 'package:livestream_with_agora/views/stream/widgets/audience.dart';
import 'package:livestream_with_agora/views/stream/widgets/audience_chatbox.dart';
import 'package:livestream_with_agora/views/stream/widgets/camera_button.dart';
import 'package:livestream_with_agora/views/stream/widgets/comment_button.dart';
import 'package:livestream_with_agora/views/stream/widgets/end_live_button.dart';
import 'package:livestream_with_agora/views/stream/widgets/microphone_button.dart';
import 'package:livestream_with_agora/views/stream/widgets/profile.dart';
import 'package:livestream_with_agora/views/stream/widgets/switch_camera_button.dart';

class StreamPage extends StatefulWidget {
  const StreamPage({super.key});

  @override
  State<StreamPage> createState() => _StreamPageState();
}

class _StreamPageState extends State<StreamPage> {
  final LivestreamController livestreamController = Get.find();
  final AgoraService agoraService = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    agoraService.initAgora();
    livestreamController.startRandomComments();
    livestreamController.startAutoIncreaseAudiences();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    livestreamController.stopRandomComments();
    livestreamController.stopAutoIncreaseAudiences();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _renderLocalVideo(),
          agoraService.engine != null
              ? _renderRemoteVideo()
              : const CircularProgressIndicator(),
          bottomButtonsStream(),
          audienceAndProfile(),
          audienceChatBox(),
          topButtonsStream(),
        ],
      ),
    );
  }

  Widget audienceAndProfile() {
    return const Positioned(
      top: 50,
      left: 10,
      child: Row(
        children: <Widget>[
          Profile(),
          SizedBox(
            width: 10,
          ),
          Audience()
        ],
      ),
    );
  }

  Widget bottomButtonsStream() {
    return const Positioned(
        left: 0,
        right: 0,
        bottom: 10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            MicrophoneButton(),
            EndLiveButton(),
            CameraButton()
          ],
        ));
  }

  Widget topButtonsStream() {
    return const Positioned(
        top: 50,
        right: 10,
        child: Row(
          children: <Widget>[
            CommentButton(),
            SizedBox(
              width: 10,
            ),
            SwitchCameraButton(),
          ],
        ));
  }

  Widget _renderLocalVideo() {
    return Positioned(
      child: AgoraVideoView(
        controller: VideoViewController(
          rtcEngine: agoraService.engine,
          canvas: const VideoCanvas(uid: 0),
        ),
      ),
    );
  }

  Widget _renderRemoteVideo() {
    return Obx(() {
      if (livestreamController.remoteUID.value != null &&
          livestreamController.remoteUID.value != 0) {
        return AgoraVideoView(
          controller: VideoViewController.remote(
            rtcEngine: agoraService.engine,
            canvas: VideoCanvas(uid: livestreamController.remoteUID.value),
            connection: RtcConnection(
                channelId: livestreamController.channelName.value),
          ),
        );
      } else {
        return const SizedBox();
      }
    });
  }

  Widget audienceChatBox() {
    return Obx(() => livestreamController.isShowAudiences.value
        ? const Positioned(left: 10, bottom: 80, right: 10, child: AudienceChatbox())
        : const SizedBox());
  }
}

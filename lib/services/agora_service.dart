import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:livestream_with_agora/controllers/livestream_controller.dart';

class AgoraService extends GetxService{
  late final RtcEngine engine;
  final String appId = '1f43f0b3941c4e1b92ae96c2247a1fbd';
  final String tempToken =
      '007eJxTYHga5ZVw0NCkiEXa11BhoXLjkrd/Hx86yliUXe/8Xuot+3wFBsM0E+M0gyRjSxPDZJNUwyRLo8RUS7NkIyMT80TDtKQUuxML0xsCGRlcM4IYGIGQBYhBfCYwyQwmWcAkH0NxSVFqYm58Wk5pSUlqEQMDAIUzJRQ=';

  final LivestreamController livestreamController = Get.find();

  Future<void> initAgora() async {
    engine = createAgoraRtcEngine();

    await engine.initialize(RtcEngineContext(appId: appId));

    engine.registerEventHandler(
      RtcEngineEventHandler(
        onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
          print('Đã tham gia channel: ${connection.channelId}');
        },
        onUserJoined: (RtcConnection connection, int remoteUid, int elapsed) {
          print("Remote UID: $remoteUid");
          livestreamController.remoteUID.value = remoteUid;
        },
        onUserOffline: (RtcConnection connection, int remoteUid,
            UserOfflineReasonType reason) {
          livestreamController.remoteUID.value = null;
        },
      ),
    );

    await engine.enableVideo();
    await engine.startPreview();
    await engine.joinChannel(
      token: tempToken,
      channelId: livestreamController.channelName.value!,
      uid: 0,
      options: const ChannelMediaOptions(),
    );
  }
}

import 'dart:async';
import 'dart:math';

import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

import '../models/comment.dart';

class LivestreamController extends GetxController {
  Rx<String?> channelName = Rx<String?>('stream_flutter');
  Rx<String?> username = Rx<String?>('');

  Rx<int?> remoteUID = Rx<int?>(0);

  Rx<bool> isShowAudiences = Rx<bool>(true);

  RxList<String> commentsDefine = RxList<String>([
    "Hello, How are you today?",
    "Wonderful Video, Keep it up.",
    "Contact me, bro",
    "How much is this?",
    "Wao, this information help me very much"
  ]);

  RxList<String> userNameDefine = RxList<String>([
    "AlexSandre",
    "Jun",
    "Victor Axelsen",
    "Tokuda",
    "Maria",
    "Anthony Nguyen",
    "NKD"
  ]);

  Rx<int> audiences = Rx<int>(0);

  RxList<Comment?> comments = RxList<Comment?>([]);

  Timer? timer;

  void startAutoIncreaseAudiences() {
    timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      final random = Random();

      audiences.value = audiences.value + random.nextInt(5);
    });
  }


  void stopAutoIncreaseAudiences() {
    timer?.cancel();
  }

  void startRandomComments() {
    timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      final random = Random();
      final username = userNameDefine.value[random.nextInt(userNameDefine.length)];
      final liveComment = commentsDefine.value[random.nextInt(commentsDefine.length)];

      comments.add(Comment(liveComment, username));
    });
  }

  void stopRandomComments() {
    timer?.cancel();
  }
}

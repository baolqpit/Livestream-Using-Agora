import 'package:get/instance_manager.dart';
import 'package:livestream_with_agora/controllers/livestream_controller.dart';
import 'package:livestream_with_agora/services/agora_service.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<LivestreamController>(LivestreamController());
    Get.put<AgoraService>(AgoraService());
  }

}
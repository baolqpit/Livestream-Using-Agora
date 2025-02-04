import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:livestream_with_agora/controllers/livestream_controller.dart';
import 'package:livestream_with_agora/routes/app_routes.dart';
import 'package:livestream_with_agora/services/agora_service.dart';
import 'package:livestream_with_agora/services/permission_service.dart';
import 'package:permission_handler/permission_handler.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController usernameController = TextEditingController();
    final PermissionService permissionService = PermissionService();
    final LivestreamController livestreamController = Get.find();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(
                  hintText: 'username',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      borderSide: BorderSide(color: Colors.deepPurpleAccent))),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.greenAccent),
                  child: const Text('Watch'),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                ElevatedButton(
                  onPressed: () async {
                    await permissionService.requestUserPermission(
                        permission: Permission.camera);

                    await permissionService.requestUserPermission(
                        permission: Permission.microphone);

                    livestreamController.username.value = usernameController.text;

                    Get.toNamed(AppRoutes.STREAM_PAGE);
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: const Text(
                    'Go live',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

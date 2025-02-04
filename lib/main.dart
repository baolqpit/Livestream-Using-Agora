import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:livestream_with_agora/bindings/app_bindings.dart';
import 'package:livestream_with_agora/routes/app_routes.dart';
import 'package:livestream_with_agora/services/permission_service.dart';
import 'package:livestream_with_agora/views/homepage/homepage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await PermissionService().requestUserPermission();
  runApp(const LiveStreamApp());
}

class LiveStreamApp extends StatelessWidget {
  const LiveStreamApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Livestream App',
      initialRoute: AppRoutes.HOME_PAGE,
      getPages: AppRoutes.routes,
      initialBinding: AppBindings(),
    );
  }
}


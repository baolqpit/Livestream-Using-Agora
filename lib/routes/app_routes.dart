import 'package:get/get_navigation/get_navigation.dart';
import 'package:livestream_with_agora/views/homepage/homepage.dart';
import 'package:livestream_with_agora/views/stream/stream_page.dart';

class AppRoutes {
  static const HOME_PAGE = '/home';
  static const STREAM_PAGE = '/stream';

  static final routes = [
    GetPage(name: HOME_PAGE, page: () => const Homepage()),
    GetPage(name: STREAM_PAGE, page: () => const StreamPage()),
  ];
}
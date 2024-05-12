import 'package:go_router/go_router.dart';
import 'package:qiita_app/screens/freezed_user_page.dart';

import 'package:qiita_app/screens/sign_in_screen.dart';
import 'package:qiita_app/screens/test_screen.dart';

class RouteConfig {
  static const String root = '/';
  static const String about = '/about';
  static const String about2 = '/about2';
  static const String user_page = '/freezed_user_page';
}

final goRouter = GoRouter(
  routes: [
    GoRoute(
      path: RouteConfig.root,
      builder: (context, state) => SignInScreen(),
    ),
    GoRoute(
      path: RouteConfig.about,
      builder: (context, state) => TestScreen(),
    ),
    GoRoute(
      path: RouteConfig.about2,
      builder: (context, state) => TestScreen(),
    ),
    GoRoute(
      path: RouteConfig.user_page,
      builder: (context, state) => FreezedUserPage(),
    ),
  ],
);

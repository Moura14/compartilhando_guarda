import 'package:compartilhando_gurda/screens/home_screens.dart';
import 'package:compartilhando_gurda/screens/signIn_screens.dart';
import 'package:compartilhando_gurda/screens/signup_screens.dart';

import 'package:get/get.dart';

abstract class AppPages {
  static final pages = <GetPage>[
    GetPage(name: PagesRoute.signIn, page: (() => SignIn())),
    GetPage(name: PagesRoute.signUp, page: (() => SignUpScreens())),
    GetPage(name: PagesRoute.home, page: (() => const HomeScreens()))
  ];
}

abstract class PagesRoute {
  static const String signUp = '/signUp';
  static const String signIn = '/signIn';
  static const String home = '/home';
}

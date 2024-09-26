import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:telegram_flutter/common/getx_binding.dart';
import 'package:telegram_flutter/common/router.dart';
import 'package:telegram_flutter/data/datasources/local/app_database.dart';
import 'package:telegram_flutter/presentation/loginPage/login_page.dart';
import 'package:telegram_flutter/presentation/introScreen/intro_screen.dart';
import 'package:telegram_flutter/presentation/unitHorizontalScreen/horizontal_merged_chatlist_chatpage_screen.dart';
import 'common/bloc_binding.dart';
import 'common/bloc_observer.dart';
import 'data/datasources/local/sharedStore.dart';

void main() async {
  await SharedStore.init();
  BlocOverrides.runZoned(
    () => runApp(AppBindingsBloc(child: MyApp())),
    blocObserver: AppBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  int page = 0;
  int limit = 0;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Chat',
      initialBinding: GetxBinding(),
      // initialRoute: introPage,
      initialRoute: getInitialRoute(),
      routes: {
        introRoute: (context) => const IntroScreen(),
        loginRoute: (context) => const LoginPage(),
        chatPageRoute: (context) => MergedChatListChatPageScreen(),
      },
      onGenerateRoute: AppRouter().generateRoute,
    );
  }

  String getInitialRoute() {
    return !SharedStore.isFirstRun()
        ? introRoute
        : SharedStore.getUserName().isNotEmpty
            ? chatPageRoute
            : loginRoute;
  }
}

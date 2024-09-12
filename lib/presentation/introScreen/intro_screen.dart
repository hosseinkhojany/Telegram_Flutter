import 'package:flutter/material.dart';
import 'package:telegram_flutter/common/router.dart';
import 'package:telegram_flutter/data/datasources/local/sharedStore.dart';
import 'package:telegram_flutter/presentation/introScreen/components/page_view_indictator.dart';
import 'package:telegram_flutter/presentation/introScreen/components/page_view_model.dart';
import 'package:telegram_flutter/presentation/introScreen/data/page_view_data.dart';

import '../../common/gen/colors.gen.dart';

int page = 0;

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController pageController = PageController();

  @override
  void initState() {
    super.initState();
    // SharedStore.setFirstRun(false);
    pageController.addListener(() {
      if (pageController.page!.round() != page) {
        setState(() {
          page = pageController.page!.round();
        });
      }
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.chatPageMainBackground,
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(height: 30),
          Expanded(
            child: PageView.builder(
              controller: pageController,
              itemCount: pageViewData.length,
              itemBuilder: (context, index) {
                PageViewData data = pageViewData[index];

                return PageViewModel(
                  title: data.title,
                  subtitle: data.subtitle,
                  imagePath: data.imagePath,
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 45),
            child: PageViewIndictator(
              pageController: pageController,
              count: pageViewData.length,
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: TextButton(
                onPressed: () {
                  SharedStore.setFirstRun(true);
                  Navigator.pushReplacementNamed(context, routeChooser());
                },
                child: const Text('Skip')),
          ),
          const SizedBox(height: 15),
        ],
      )),
    );
  }

  String routeChooser() {
    if (SharedStore.getUserName().isNotEmpty) {
      return chatPageRoute;
    } else {
      return loginRoute;
    }
  }
}

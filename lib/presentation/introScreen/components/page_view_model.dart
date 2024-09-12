import 'package:flutter/material.dart';

class PageViewModel extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePath;

  const PageViewModel(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
              fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        Image.asset(
          imagePath,
          width: 400,
          height: 400,
        ),
        Text(
          subtitle,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


class BoxItem extends StatelessWidget {
  BoxItem({
    super.key,
    required this.titleBox,
    required this.img,
  });

  late String titleBox;
  late String img;

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> item;
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(height: 30, width: 120, child: Text(titleBox)),
            SizedBox(
              height: 100,
              child: Lottie.asset(img),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

// class untuk menampilka item menu
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
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 50,
              child: Center(
                child: Text(
                  titleBox,
                  maxLines: 4,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
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

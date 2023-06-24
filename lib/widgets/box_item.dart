import 'package:flutter/material.dart';

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
        // color: Colors.blue,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 70,
              child: Center(child: Image.asset(img)),
            ),
            SizedBox(
              height: 40,
              child: Center(
                child: Text(
                  titleBox,
                  // maxLines: 4,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CircleImage extends StatelessWidget {
  const CircleImage({super.key, required this.img});
  final String img;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(radius: 20, child: Image(image: AssetImage(img)));
  }
}

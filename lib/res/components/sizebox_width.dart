import 'package:flutter/material.dart';

class SizeBoxWidth extends StatelessWidget {
  double width;
  SizeBoxWidth({Key? key, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
    );
  }
}

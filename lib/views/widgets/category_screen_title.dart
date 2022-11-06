import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryScreenTitle extends StatelessWidget {
  const CategoryScreenTitle({Key? key}) : super(key: key);
  final TextStyle textStyle = const TextStyle(
    color: Color(0xFF4F5A69),
    fontSize: 22,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Pick Your Category', style: textStyle),
          Text('of interest', style: textStyle)
        ],
      ),
    );
  }
}

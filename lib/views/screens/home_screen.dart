import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/constant/background.dart';
import 'package:news_app/views/widgets/category_item.dart';
import 'package:news_app/views/widgets/category_screen_title.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'Home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: Background.background,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text('News App'),
        ),
        body: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CategoryScreenTitle(),
              Expanded(
                  child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                children: [
                  CategoryItem.right(Color(0xFFC91C22), 'Sports','assets/image/ball.png' ),
                  CategoryItem.left(Color(0xFF003E90), 'Politics','assets/image/Politics.png' ),
                  CategoryItem.right(Color(0xFFED1E79), 'Health','assets/image/health.png' ),
                  CategoryItem.left(Color(0xFFCF7E48), 'Business','assets/image/bussines.png' ),
                  CategoryItem.right(Color(0xFF4882CF), 'Environment','assets/image/environment.png' ),
                  CategoryItem.left(Color(0xFFF2D352), 'Science','assets/image/science.png' ),

                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}

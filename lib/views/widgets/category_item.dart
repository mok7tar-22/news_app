import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/news_api_manager.dart';
//import 'package:news_app/providers/news_provider.dart';
import 'package:news_app/views/screens/news_screens.dart';


class CategoryItem extends StatelessWidget {
  Color color;
  String title, image;
  final double subtractFromLeft, subtractFromRight;

  CategoryItem.right(this.color, this.title, this.image, {Key? key})
      : subtractFromLeft = 0,
        subtractFromRight = 40,
        super(key: key);

  CategoryItem.left(this.color, this.title, this.image, {Key? key})
      : subtractFromLeft = 40,
        subtractFromRight = 0,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          NewsApiManager.search("الاهلي");
          Navigator.of(context).pushNamed(NewsScreen.routeName, arguments: title);
        },

      child: Container(
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(40).subtract(BorderRadius.only(
                bottomRight: Radius.circular(subtractFromRight),
                bottomLeft: Radius.circular(subtractFromLeft)))),
        child: Column(
          children: [
            Expanded(
                flex: 3,
                child: Image(
                  image: AssetImage(image),
                )),
            Expanded(
                child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ))
          ],
        ),
      ),
    );
  }
}

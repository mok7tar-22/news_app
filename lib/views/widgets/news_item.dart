import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/article.dart';
import 'package:news_app/views/screens/article_screen.dart';
import 'package:timeago/timeago.dart' as timeago;
class NewsItem extends StatelessWidget {
  Articles article;
  
  NewsItem({required this.article, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   

    return InkWell(
      onTap: () {
        Navigator.pushNamed(
            context, ArticleScreen.routeName,arguments: article); //arguments: article);
      },
      child: Container(
        margin: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                flex: 3,
                child:article.urlToImage !=null? CachedNetworkImage(
                  fit: BoxFit.fill,
                  width: double.infinity,
                  imageUrl:article.urlToImage!,
                  placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => Center(child: Icon(Icons.error)),
                ):SizedBox(
                    width: double.infinity,
                    child: Image.asset("assets/image/notfound.png",fit: BoxFit.fill,))),
            Text(article.source!.name!),
            Text(
              article.description??"no description",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Align(alignment: Alignment.centerRight, child: Text(
              timeago.format(DateTime.parse(article.publishedAt!)),

            ),),
          ],
        ),
      ),
    );
  }
}

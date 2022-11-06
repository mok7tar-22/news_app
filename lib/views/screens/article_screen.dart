import 'package:flutter/material.dart';
import 'package:news_app/models/article.dart';
import 'package:news_app/models/constant/background.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:timeago/timeago.dart' as timeago;

class ArticleScreen extends StatelessWidget {
  static const String routeName = 'Article';
  late Articles article;

  ArticleScreen({Key? key}) : super(key: key);
  final secondaryTextStyle = const TextStyle(color: Color(0xFF79828B));

  @override
  Widget build(BuildContext context) {
    article = ModalRoute.of(context)!.settings.arguments as Articles;
    return Container(
      decoration: Background.background,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(article.title!),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.3,
                child: article.urlToImage != null
                    ? Image(
                        width: double.infinity,
                        image: NetworkImage(article.urlToImage!),
                        fit: BoxFit.fill,
                      )
                    : Image.asset(
                        "assets/image/notfound.png",
                        fit: BoxFit.fill,
                      ),
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  article.source!.name!,
                  style: secondaryTextStyle,
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  article.title!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                      timeago.format(DateTime.parse(article.publishedAt!)))),
              const SizedBox(height: 30),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        article.description ?? "",
                        maxLines: 5,
                        style: const TextStyle(fontSize: 18),
                      ),
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: TextButton.icon(
                            onPressed: () async {
                              try {
                                await launchUrlString(article.url!);
                              } catch (error) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      'Sorry could not open this article right now.',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              }
                            },
                            icon: const Icon(Icons.arrow_left),
                            label: const Text('View Full Article'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

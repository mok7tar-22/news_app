import 'package:flutter/material.dart';
import 'package:news_app/controllers/news_controllers.dart';
import 'package:news_app/models/article.dart';
import 'package:news_app/models/constant/background.dart';
import 'package:news_app/models/source.dart';
import 'package:news_app/views/screens/search_screen.dart';


import 'package:news_app/views/widgets/news_item.dart';
import 'package:provider/provider.dart';

class NewsScreen extends StatelessWidget {
  static const String routeName = 'News';
  late String title;

  NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    title = ModalRoute.of(context)!.settings.arguments as String;
    return Container(
        decoration: Background.background,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(title),
            actions: [IconButton(onPressed: (){
              Navigator.pushReplacementNamed(
                  context, SearchScreen.routeName);
            }, icon:Icon(Icons.search,size: 25,))],
          ),
          body: Column(
                    children: [
                      Expanded(
                        child: FutureBuilder<List<Articles>?>(
                          future: Provider.of<NewsControllers>(context)
                              .getArticles(title),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                  child: CircularProgressIndicator.adaptive());
                            }
                            if (snapshot.data == null) {
                              return const Center(
                                  child: Text(
                                      'Error has occurred please try again later.'));
                            } else {
                              return ListView.builder(
                                itemExtent:
                                MediaQuery.of(context).size.height * 0.35,
                                itemCount: snapshot.data!.length,
                                itemBuilder: (context, index) {
                                  return NewsItem(article:snapshot.data![index]);
                                },
                              );
                            }
                          },
                        ),
                      )

                    ],
                  )

              )
  );
  }
}

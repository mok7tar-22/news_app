import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controllers/news_controllers.dart';
import '../../models/article.dart';
import '../widgets/news_item.dart';
import 'home_screen.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = 'search';

  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String? text;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(children: [
          Container(
        color: Theme.of(context).primaryColor,
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      size: 25,
                    )),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(8),
                    child: TextField(
                      onChanged: (value) {
                        text = value;
                        setState(() {});
                      },
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        suffixIcon: const Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        hintStyle: const TextStyle(
                          color: Colors.black45,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(20)),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(20)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: text == null
                ? Center(
                    child: Text("Search to news"),
                  )
                : FutureBuilder<List<Articles>?>(
                    future: Provider.of<NewsControllers>(context).search(text!),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                            child: CircularProgressIndicator.adaptive());
                      }
                      if (snapshot.data==null) {
                        return const Center(
                            child: Text(
                                'Error has occurred please try again later.'));
                      } else {
                        return ListView.builder(
                          itemExtent: MediaQuery.of(context).size.height * 0.35,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return NewsItem(article: snapshot.data![index]);
                          },
                        );
                      }
                    },
                  ),
          )
        ]),
      ),
    );
  }
}

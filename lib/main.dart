import 'package:flutter/material.dart';
import 'package:news_app/controllers/news_controllers.dart';
import 'package:news_app/views/screens/article_screen.dart';
import 'package:news_app/views/screens/home_screen.dart';
import 'package:news_app/views/screens/news_screens.dart';
import 'package:news_app/views/screens/search_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (context) => NewsControllers(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25)),
          ),
          backgroundColor: Color(0xff39A552),
        ),
        primaryColor: const Color(0xFF39A552),
      ),
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        NewsScreen.routeName: (context) => NewsScreen(),
        ArticleScreen.routeName:(context)=>ArticleScreen(),
        SearchScreen.routeName:(context)=>SearchScreen(),
      },
      initialRoute: HomeScreen.routeName,
    );
  }
}



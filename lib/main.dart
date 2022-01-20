//============ Packages
import 'package:board_games_scores/controllers/konkan_four_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//============ Providers
import './controllers/domino_provider.dart';
import './controllers/konkan_provider.dart';
//============ Pages
import 'views/home.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => DominoProvider()),
      ChangeNotifierProvider(create: (_) => KonkanFourProvider()),
      ChangeNotifierProvider(create: (_) => KonkanProvider())
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const HomePage(),
    );
  }
}

import 'package:flutter/material.dart';

import 'screens/account_screen.dart';
import 'screens/home_screen.dart';
import 'screens/search_news.dart';

void main() {
  runApp(const Dashboard());
}

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(primarySwatch: Colors.indigo),
      title: "World News",
      routes: {
        '/': (context) => const HomeScreen(),
        '/search': (context) => const SearchNewsScreen(),
        // '/setting': (context) => SettingScreen(),
        '/account': (context) => const AccountScreen()
      },
    );
  }
}

import 'package:flutter/material.dart';

import '../screens/home_screen.dart';
import '../screens/news_screen.dart';
import '../screens/savednews_screen.dart';
import '../screens/signup_screen.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: buildMenuItems(context),
    ));
  }

  List<Widget> buildMenuItems(BuildContext context) {
    List<String> menuTitles = ['Home', 'News', 'Saved', 'Account'];
    List<Widget> menuIcon = [
      const Icon(Icons.home),
      const Icon(Icons.newspaper),
      const Icon(Icons.bookmark_outlined),
      const Icon(Icons.account_box_outlined)
    ];

    List<Widget> menuItems = [];

    menuItems.add(
        const DrawerHeader(decoration: BoxDecoration(), child: Text("data")));
    int counter = 0;
    for (var element in menuTitles) {
      Widget screen = Container();
      menuItems.add(ListTile(
        leading: menuIcon[counter],
        title: Text(
          element,
          style: const TextStyle(fontSize: 20),
        ),
        onTap: () {
          switch (element) {
            case 'Home':
              screen = const HomeScreen();
              break;
            case 'News':
              screen = const NewsScreen();
              break;
            case 'Saved':
              screen = const SavedNewsScreen();
              break;
            case 'Account':
              screen = const SignUpScreen();
              break;
          }
          Navigator.pop(context);
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => screen,
          ));
        },
      ));
      counter++;
    }
    return menuItems;
  }
}

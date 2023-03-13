import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: index,
      selectedItemColor: Colors.lime[900],
      onTap: (value) {
        index = value;

        switch (value) {
          case 0:
            Navigator.pushNamed(context, '/');

            break;

          case 1:
            Navigator.pushNamed(context, '/search');
            break;

          case 2:
            Navigator.pushNamed(context, '/account');
        }
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: '',
        ),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.search_outlined,
            ),
            label: ''),
        BottomNavigationBarItem(
            icon: CircleAvatar(
                radius: 15, backgroundImage: AssetImage("./images/c.png")),
            label: ''),
      ],
    );
  }
}

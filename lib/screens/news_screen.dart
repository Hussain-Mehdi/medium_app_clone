import 'package:flutter/material.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: const [
            Text(
              "Hello World",
              style: TextStyle(
                  fontFamily: 'Helvetica-Neue-UltraLight',
                  fontWeight: FontWeight.w500,
                  fontSize: 25,
                  color: Colors.black),
            ),
            Text(
              "Hello World",
              style: TextStyle(
                fontFamily: 'FF-kievit',
                fontSize: 25,
              ),
            ),
            Text(
              "Hello World",
              style: TextStyle(
                fontFamily: 'Charter-Regular',
                fontSize: 25,
              ),
            ),
            Text(
              "Hello World",
              style: TextStyle(
                fontFamily: 'MYRIADPRO-REGULAR',
                fontSize: 14,
              ),
            ),
            Text(
              "Hello World",
              style: TextStyle(
                fontFamily: 'Roboto-Light',
                fontSize: 14,
              ),
            ),
            Text(
              "Hello World",
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ],
        ));
  }
}

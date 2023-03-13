// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class NewsCardWidget extends StatelessWidget {
  String newsTitle = '';
  String newsImage = '';

  NewsCardWidget(this.newsTitle, this.newsImage, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Material(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            width: 200,
            height: 300,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: const Color.fromARGB(255, 255, 255, 255),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(47, 0, 0, 0),
                    blurRadius: 1,
                    spreadRadius: 1,
                  )
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                              image: NetworkImage(newsImage),
                              fit: BoxFit.cover)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    newsTitle,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w700),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

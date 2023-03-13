import 'package:flutter/material.dart';

import '../cutomized_widgets/newsTile.dart';
import '../data/news.dart';

class SavedNewsScreen extends StatelessWidget {
  const SavedNewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: userSavedNews.isEmpty
            ? const Center(child: Text("No Saved News Found"))
            : ListView.builder(
                itemCount: userSavedNews.length,
                itemBuilder: (context, index) {
                  return NewsTile(
                      userSavedNews[index].newsTitle.toString(),
                      userSavedNews[index].newsImage.toString(),
                      userSavedNews[index].newsDate.toString(),
                      userSavedNews[index].authorName.toString(),
                      userSavedNews[index].newsURL.toString());
                },
              ));
  }
}

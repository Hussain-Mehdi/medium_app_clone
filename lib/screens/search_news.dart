import 'package:flutter/material.dart';

import '../cutomized_widgets/newTile_shimmer.dart';
import '../cutomized_widgets/newsTile.dart';
import '../data/http_helper.dart';
import '../data/news.dart';
import '../shared/menu_button.dart';

class SearchNewsScreen extends StatefulWidget {
  const SearchNewsScreen({super.key});

  @override
  State<SearchNewsScreen> createState() => _SearchNewsScreenState();
}

class _SearchNewsScreenState extends State<SearchNewsScreen> {
  TextEditingController searchTxt = TextEditingController();
  List<News> news = [];

  bool search = false;

  @override
  void initState() {
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: MenuButton(),
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black54, size: 15),
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text("Search",
              style:
                  TextStyle(fontSize: 14, color: Color.fromARGB(255, 0, 0, 0))),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: searchTxt,
                decoration: InputDecoration(
                    focusColor: Colors.black45,
                    focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 113, 113, 113))),
                    hintText: 'Search news',
                    suffixIcon: searchTxt.text.isNotEmpty
                        ? IconButton(
                            onPressed: () {
                              setState(() {
                                searchTxt.clear();
                                search = false;
                              });
                            },
                            icon: const Icon(
                              Icons.close_outlined,
                              color: Color.fromARGB(255, 134, 134, 134),
                              size: 18,
                            ))
                        : IconButton(
                            onPressed: () {
                              if (search) {
                                setState(() {
                                  search = false;
                                });
                              } else {
                                setState(() {
                                  search = true;
                                });
                              }
                              getSearchedNews();
                            },
                            icon: const Icon(
                              Icons.search_outlined,
                              color: Color.fromARGB(255, 134, 134, 134),
                              size: 18,
                            ))),
              ),
            ),
            Expanded(
              child: news.isEmpty
                  ? ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) => const NewsTileShimmer(),
                    )
                  : ListView(
                      shrinkWrap: true,
                      children: searchedNewsList(),
                    ),
            )
          ],
        ));
  }

  Future getSearchedNews() async {
    HttpHelper helper = HttpHelper();
    news = await helper.getNews(searchTxt.text);
    setState(() {});
  }

  List<NewsTile> searchedNewsList() {
    List<NewsTile> searchedNewsTile = [];

    for (var searchednews in news) {
      searchedNewsTile.add(NewsTile(
          searchednews.newsTitle,
          searchednews.newsImage,
          searchednews.newsDate.toString(),
          searchednews.authorName,
          searchednews.newsURL));
    }

    return searchedNewsTile;
  }
}

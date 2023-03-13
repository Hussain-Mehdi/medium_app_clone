import 'package:flutter/material.dart';

import '../cutomized_widgets/newTile_shimmer.dart';
import '../cutomized_widgets/newsTile.dart';
import '../data/http_helper.dart';
import '../data/news.dart';
import '../shared/drawer_screen.dart';
import 'package:intl/intl.dart';

import '../shared/menu_button.dart';

class HomeScreen extends StatefulWidget {
  static List<News> news = [];

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  @override
  void initState() {
    setState(() {
      getData();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final sizeX = MediaQuery.of(context).size.width;
    final sizeY = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const MyDrawer(),
      bottomNavigationBar: MenuButton(),
      body: Padding(
        padding: const EdgeInsets.only(top: 70.0),
        child: Stack(
          children: [
            Positioned(
              top: 140,
              child: SizedBox(
                height: sizeY,
                width: sizeX,
                child: HomeScreen.news.isEmpty
                    ? ListView.builder(
                        itemCount: 20,
                        itemBuilder: (context, index) =>
                            const NewsTileShimmer(),
                      )
                    : ListView.builder(
                        itemCount: HomeScreen.news.length,
                        itemBuilder: (context, index) {
                          String formatedDate =
                              formatter.format(HomeScreen.news[index].newsDate);
                          return NewsTile(
                              HomeScreen.news[index].newsTitle,
                              HomeScreen.news[index].newsImage,
                              formatedDate,
                              HomeScreen.news[index].authorName,
                              HomeScreen.news[index].newsURL);
                        },
                      ),
              ),
            ),
            Positioned(
              top: 20,
              child: SizedBox(
                height: 70,
                width: sizeX,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Home",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.notifications_outlined,
                            size: 20,
                          ))
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 100,
              child: SizedBox(
                height: 40,
                width: sizeY,
                child: createTopicList(),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future getData() async {
    HttpHelper helper = HttpHelper();
    HomeScreen.news = await helper.getNews("Everything");
    setState(() {});
  }

  Widget createTopicList() {
    List<String> listItem = [
      'For you',
      'Following',
      'Books',
      'Politics',
      'Psychology',
      'Culture',
      'Life',
      'Health',
      'Writing',
      'Relationship',
      'Machine learning',
      'Python',
      'Film',
      'Music',
      'Photography',
      'Language',
      'Media',
      'Sports',
      'Family',
      'Java',
      'True Crime',
      'Future'
    ];

    ListView topicList = ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: listItem.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {},
            child: Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8),
                child: Center(
                  child: Text(
                    listItem[index],
                    style: const TextStyle(
                        fontSize: 11,
                        fontFamily: 'Roboto-Light',
                        color: Color.fromARGB(255, 85, 85, 85)),
                  ),
                ),
              ),
            ),
          );
        });

    return topicList;
  }
}

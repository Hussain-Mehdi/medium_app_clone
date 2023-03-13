import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:url_launcher/url_launcher.dart';

import '../data/news.dart';
import '../data/util.dart';
import '../screens/home_screen.dart';

class NewsTile extends StatefulWidget {
  final String newsTitle;
  final String newsImage;
  final String newsDate;
  final String authorName;
  final String newsURL;

  const NewsTile(this.newsTitle, this.newsImage, this.newsDate, this.authorName,
      this.newsURL,
      {super.key});

  @override
  State<NewsTile> createState() => _NewsTileState();
}

class _NewsTileState extends State<NewsTile> {
  bool postSave = false;
  bool imageDataFound = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 1),
      child: InkWell(
        onTap: () {
          _launchUrl(Uri.parse(widget.newsURL));
        },
        child: Container(
          height: 150,
          padding: const EdgeInsets.only(left: 5, right: 5),
          decoration: const BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
              boxShadow: [
                BoxShadow(
                    color: Color.fromARGB(10, 0, 0, 0),
                    blurRadius: 1,
                    spreadRadius: 1),
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 10, bottom: 5),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage:
                          CachedNetworkImageProvider(widget.newsImage),
                      radius: 10,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Text(widget.authorName,
                          style: const TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Roboto-Light',
                          )),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 240,
                        child: Text(
                          "${widget.newsTitle}\n",
                          style: const TextStyle(
                              color: Color.fromARGB(255, 22, 22, 22),
                              fontWeight: FontWeight.w700,
                              fontSize: 13),
                        ),
                      ),
                      Expanded(
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5)),
                            height: 180,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: FadeInImage(
                                placeholder:
                                    const AssetImage("./images/shimmer.gif"),
                                fit: BoxFit.cover,
                                image: NetworkImage(widget.newsImage),
                                imageErrorBuilder:
                                    (context, error, stackTrace) {
                                  return Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        border:
                                            Border.all(color: Colors.black12)),
                                    child: IconButton(
                                        onPressed: () => showDialog(
                                              context: context,
                                              builder: (BuildContext context) =>
                                                  AlertDialog(
                                                content: const Text(
                                                    "No Image Found!"),
                                                actions: [
                                                  TextButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: const Text(
                                                        "Close",
                                                        style: TextStyle(
                                                            color: Colors.blue),
                                                      ))
                                                ],
                                              ),
                                            ),
                                        icon: const Icon(Icons.error_outline)),
                                  );
                                },
                              ),
                            )),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 5, top: 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.newsDate,
                        style: const TextStyle(
                            fontFamily: 'Roboto-Light',
                            fontSize: 11,
                            color: Color.fromARGB(222, 96, 96, 96))),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text("20 min read",
                        style: TextStyle(
                          color: Color.fromARGB(222, 96, 96, 96),
                          fontSize: 11,
                          fontFamily: 'Roboto-Light',
                        )),
                    const Icon(
                      Icons.star,
                      color: Color.fromARGB(255, 255, 235, 52),
                      size: 15,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "selected for you",
                        style: TextStyle(
                            fontFamily: 'Roboto-Light',
                            color: Color.fromARGB(252, 43, 43, 43),
                            fontWeight: FontWeight.w600,
                            fontSize: 10),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  if (postSave) {
                                    postSave = false;
                                    userSavedNews.removeAt(1);
                                  } else {
                                    postSave = true;
                                    userSavedNews.add(News(
                                        newsTitle: widget.newsTitle,
                                        newsImage: widget.newsImage,
                                        newsDate:
                                            DateTime.parse(widget.newsDate),
                                        authorName: widget.authorName,
                                        newsURL: widget.newsURL));
                                  }
                                });
                              },
                              icon: postSave == true
                                  ? const Icon(
                                      Icons.bookmark_added_outlined,
                                      size: 15,
                                    )
                                  : const Icon(
                                      Icons.bookmark_add_outlined,
                                      size: 18,
                                      color: Colors.black87,
                                      weight: 1,
                                    )),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.remove_circle_outline_rounded,
                                size: 20,
                              )),
                          PopupMenuButton(
                              iconSize: 20,
                              itemBuilder: (BuildContext context) {
                                return ArtUtil.menuItem.map((String item) {
                                  return PopupMenuItem<String>(
                                    value: item,
                                    child: Text(item),
                                  );
                                }).toList();
                              },
                              onSelected: (String value) =>
                                  chooseMethod(value)),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _launchUrl(Uri link) async {
    if (await canLaunchUrl(link)) {
      await launchUrl(link, mode: LaunchMode.inAppWebView);
    }
  }

  Widget showPopupMenu() {
    PopupMenuButton popupmenu =
        PopupMenuButton(itemBuilder: (BuildContext context) {
      return ArtUtil.menuItem.map((String item) {
        return PopupMenuItem<String>(
          value: item,
          child: Text(item),
        );
      }).toList();
    });

    return popupmenu;
  }

  void chooseMethod(String value) {
    if (value == 'Hide') {
      HomeScreen.news.removeAt(1);
      setState(() {
        super.initState();
      });
    }
  }
}

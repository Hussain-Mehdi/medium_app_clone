// ignore_for_file: file_names

import 'package:flutter/material.dart';

class NewsTileShimmer extends StatefulWidget {
  const NewsTileShimmer({super.key});

  @override
  State<NewsTileShimmer> createState() => _NewsTileShimmerState();
}

class _NewsTileShimmerState extends State<NewsTileShimmer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 1, right: 1),
      child: Container(
        height: 140,
        decoration: const BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 1, spreadRadius: 1),
        ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
              child: Row(
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage(
                      "./images/shimmer.gif",
                    ),
                    backgroundColor: Color.fromARGB(255, 236, 236, 236),
                    radius: 15,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 10,
                    width: 100,
                    decoration: BoxDecoration(
                        image: const DecorationImage(
                            image: AssetImage("./images/shimmer.gif"),
                            fit: BoxFit.fill),
                        color: const Color.fromARGB(255, 236, 236, 236),
                        borderRadius: BorderRadius.circular(15)),
                  )
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 100,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              width: 180,
                              child: Container(
                                height: 10,
                                decoration: BoxDecoration(
                                    image: const DecorationImage(
                                        image:
                                            AssetImage("./images/shimmer.gif"),
                                        fit: BoxFit.fill),
                                    color: const Color.fromARGB(
                                        255, 236, 236, 236),
                                    borderRadius: BorderRadius.circular(15)),
                              )),
                          const SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                              width: 200,
                              child: Container(
                                height: 10,
                                decoration: BoxDecoration(
                                    image: const DecorationImage(
                                        image:
                                            AssetImage("./images/shimmer.gif"),
                                        fit: BoxFit.fill),
                                    color: const Color.fromARGB(
                                        255, 236, 236, 236),
                                    borderRadius: BorderRadius.circular(15)),
                              )),
                        ],
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("./images/shimmer.gif"),
                            fit: BoxFit.fill),
                      ),
                      width: 50,
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 5, top: 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 10,
                      width: 150,
                      decoration: BoxDecoration(
                          image: const DecorationImage(
                              image: AssetImage("./images/shimmer.gif"),
                              fit: BoxFit.fill),
                          color: const Color.fromARGB(255, 236, 236, 236),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const CircleAvatar(
                      radius: 8,
                      backgroundImage: AssetImage(
                        "./images/shimmer.gif",
                      ),
                      backgroundColor: Color.fromARGB(255, 236, 236, 236),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      color: const Color.fromARGB(255, 236, 236, 236),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(3.0),
                          child: CircleAvatar(
                            backgroundImage: AssetImage(
                              "./images/shimmer.gif",
                            ),
                            radius: 10,
                            backgroundColor: Color.fromARGB(255, 236, 236, 236),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(3.0),
                          child: CircleAvatar(
                            backgroundImage: AssetImage(
                              "./images/shimmer.gif",
                            ),
                            radius: 10,
                            backgroundColor: Color.fromARGB(255, 236, 236, 236),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(3.0),
                          child: CircleAvatar(
                            backgroundImage: AssetImage(
                              "./images/shimmer.gif",
                            ),
                            radius: 10,
                            backgroundColor: Color.fromARGB(255, 236, 236, 236),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

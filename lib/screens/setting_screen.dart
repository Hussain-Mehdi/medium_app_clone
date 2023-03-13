import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  List<String> configurationItem = [
    "Customized your interest",
    'Dark Mode',
    'Push Notification',
    'Email Notification',
    'Downloaded content'
  ];
  List<String> socialItems = ['Twitter', 'Facebook'];
  List<String> aboutNewsApp = [
    'Help',
    'Terms of Service',
    'Privacy Policy',
    'Rate on the Play Store',
    'Signout'
  ];

  SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black45, size: 20),
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            "Setting",
            style: TextStyle(color: Colors.black54, fontSize: 14),
          ),
        ),
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(
              height: 15,
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text("Configure NewsApp",
                  style: TextStyle(color: Colors.black54)),
            ),
            SizedBox(
              height: 260,
              child: ListView.separated(
                  itemCount: configurationItem.length,
                  separatorBuilder: (context, index) {
                    return Container(
                      height: 0.1,
                      color: const Color.fromARGB(255, 0, 0, 0),
                    );
                  },
                  itemBuilder: (context, index) =>
                      createSettingList(index, configurationItem)),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Social", style: TextStyle(color: Colors.black54)),
            ),
            SizedBox(
              height: 100,
              child: ListView.separated(
                  itemCount: socialItems.length,
                  separatorBuilder: (context, index) {
                    return Container(
                      height: 0.1,
                      color: const Color.fromARGB(255, 0, 0, 0),
                    );
                  },
                  itemBuilder: (context, index) =>
                      createSettingList(index, socialItems)),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "About Medium",
                style: TextStyle(color: Colors.black54),
              ),
            ),
            SizedBox(
              height: 250,
              child: ListView.separated(
                  itemCount: aboutNewsApp.length,
                  separatorBuilder: (context, index) {
                    return Container(
                      color: Colors.black,
                      height: 0.1,
                    );
                  },
                  itemBuilder: (context, index) =>
                      createSettingList(index, aboutNewsApp)),
            )
          ]),
        ));
  }

  Widget createSettingList(int index, List<String> settingItem) {
    Container list = Container(
      decoration:
          const BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Text(
          settingItem[index],
          style: const TextStyle(
            fontFamily: 'Roboto-Light',
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: Color.fromARGB(242, 44, 44, 44),
          ),
        ),
      ),
    );
    return list;
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../cutomized_widgets/button_widget.dart';
import 'setting_screen.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(300, 10, 0, 0),
          child: IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingScreen(),
                  ));
            },
            icon: const ImageIcon(AssetImage("./images/setting.png")),
            iconSize: 23,
            color: const Color.fromARGB(192, 77, 77, 77),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage("./images/c.png"),
                radius: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Muhammad Ahmad Mujhtaba",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "10M Followers",
                            style: TextStyle(
                                fontFamily: 'Roboto-Light',
                                fontSize: 12,
                                color: Color.fromARGB(255, 77, 77, 77),
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "5 Following",
                            style: TextStyle(
                                fontFamily: 'Roboto-Light',
                                fontSize: 12,
                                color: Color.fromARGB(255, 77, 77, 77),
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonWidget(
                height: 40,
                width: 130,
                text: "View Stats",
                blackColor: true,
              ),
              const SizedBox(
                width: 10,
              ),
              ButtonWidget(
                height: 40,
                width: 130,
                text: "Edit your Profile",
                blackColor: false,
                onpress: editProfile(),
              ),
            ],
          ),
        ),
        Expanded(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
              child: TextField(
                readOnly: true,
                cursorHeight: 25,
                cursorWidth: 1,
                decoration: InputDecoration(
                  suffixIcon: popup(),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(
                          color: Color.fromARGB(255, 114, 114, 114))),
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text("You don't have public post yet",
                    style: GoogleFonts.spectral(fontSize: 18)))
          ],
        ))
      ],
    ));
  }

  Widget popup() {
    List<String> items = ['Public', 'Unlisted', 'Responses', 'Draft'];
    PopupMenuButton popupmenu =
        PopupMenuButton(itemBuilder: (BuildContext context) {
      return items.map((String item) {
        return PopupMenuItem(
            value: item,
            child: SizedBox(
              width: 150,
              child: Text(item),
            ));
      }).toList();
    });
    return popupmenu;
  }

  Widget editProfile() {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Edit Profile",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
              ),
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Save",
                    style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 12),
                  ))
            ],
          ),
          Row(
            children: [
              const CircleAvatar(
                radius: 30,
              ),
              const SizedBox(
                width: 10,
              ),
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Choose an image",
                    style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 12),
                  )),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 10, bottom: 20),
            child: TextField(
              style: TextStyle(fontSize: 12),
              decoration: InputDecoration(
                  labelStyle: TextStyle(fontSize: 11, color: Colors.black87),
                  contentPadding: EdgeInsets.all(0),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  fillColor: Colors.black,
                  labelText: "First Name"),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 10, bottom: 20),
            child: TextField(
              style: TextStyle(fontSize: 12),
              decoration: InputDecoration(
                  labelStyle: TextStyle(fontSize: 11, color: Colors.black87),
                  contentPadding: EdgeInsets.all(0),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  fillColor: Colors.black,
                  labelText: "Last Name"),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 10, bottom: 20),
            child: TextField(
              style: TextStyle(fontSize: 12),
              decoration: InputDecoration(
                  labelStyle: TextStyle(fontSize: 11, color: Colors.black87),
                  contentPadding: EdgeInsets.all(0),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  fillColor: Colors.black,
                  labelText: "Email"),
            ),
          ),
        ],
      ),
    );
  }
}

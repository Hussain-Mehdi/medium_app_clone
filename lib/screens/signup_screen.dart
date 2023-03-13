import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../cutomized_widgets/button_widget.dart';
import 'signin_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 80,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                width: 50,
                height: 70,
                child: Image(image: AssetImage("./images/world.png")),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                "World News",
                style: GoogleFonts.spectral(
                    fontSize: 25, fontWeight: FontWeight.w600),
              )
            ],
          ),
          const SizedBox(
            height: 80,
          ),
          Text(
            "Join WorldNews.",
            style: GoogleFonts.spectral(
                fontSize: 35,
                fontWeight: FontWeight.w600,
                color: const Color.fromARGB(248, 45, 45, 45)),
          ),
          const SizedBox(
            height: 30,
          ),
          ButtonWidget(
            text: "SignUp with Google",
            height: 45,
            width: 300,
            blackColor: false,
          ),
          const SizedBox(
            height: 10,
          ),
          ButtonWidget(
            text: "SignUp with Email",
            height: 45,
            width: 300,
            blackColor: false,
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 50,
            width: 300,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 1,
                  width: 90,
                  color: const Color.fromARGB(255, 219, 219, 219),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 5, left: 5),
                  child: Text("or, SignUp with"),
                ),
                Container(
                  height: 1,
                  width: 90,
                  color: const Color.fromARGB(255, 219, 219, 219),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          IconButton(
              iconSize: 45,
              onPressed: () {},
              icon: const ImageIcon(AssetImage("./images/facebook.png"))),
          const SizedBox(
            height: 20,
          ),
          Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an Account?",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(252, 61, 61, 61))),
                    TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return const SignInScreen();
                            },
                          ));
                        },
                        child: const Text("SignIn",
                            style: TextStyle(
                                color: Colors.green,
                                fontSize: 14,
                                fontWeight: FontWeight.w600)))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Forget email or trouble sign in?",
                        style: TextStyle(
                            fontSize: 14,
                            color: Color.fromARGB(255, 110, 110, 110))),
                    TextButton(
                        onPressed: () {},
                        child: const Text("Get help",
                            style: TextStyle(
                                color: Colors.green,
                                fontSize: 14,
                                fontWeight: FontWeight.w600)))
                  ],
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text("By signing up, you agree to our",
                            style: TextStyle(
                                fontSize: 14,
                                color: Color.fromARGB(255, 110, 110, 110))),
                        Text(" Terms of services ",
                            style: TextStyle(
                                color: Colors.green,
                                fontSize: 14,
                                fontWeight: FontWeight.w600)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text("and acnowledge that our ",
                            style: TextStyle(
                                fontSize: 14,
                                color: Color.fromARGB(255, 110, 110, 110))),
                        Text("privacy and poilcy ",
                            style: TextStyle(
                                color: Colors.green,
                                fontSize: 14,
                                fontWeight: FontWeight.w600)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text("applies to you",
                            style: TextStyle(
                                fontSize: 14,
                                color: Color.fromARGB(255, 110, 110, 110)))
                      ],
                    )
                  ],
                )
              ])
        ],
      ),
    );
  }
}

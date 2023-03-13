import 'package:flutter/material.dart';

class ButtonWidget extends StatefulWidget {
  String text;
  double height;
  double width;
  bool blackColor;
  Widget? onpress;

  ButtonWidget(
      {super.key,
      required this.text,
      required this.height,
      required this.width,
      required this.blackColor,
      this.onpress});

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: GestureDetector(
        onTap: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(content: widget.onpress, actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Close"))
                ]);
              });
        },
        child: Container(
          height: widget.height,
          width: widget.width,
          decoration: BoxDecoration(
            color: widget.blackColor ? Colors.black : Colors.white,
            border: Border.all(
                color: const Color.fromARGB(255, 69, 69, 69), width: 0.8),
            borderRadius:
                BorderRadius.circular(widget.height + widget.width / 2),
          ),
          child: Center(
              child: widget.blackColor == true
                  ? Text(
                      widget.text,
                      style: const TextStyle(
                          fontFamily: 'Roboto-Light',
                          fontWeight: FontWeight.w800,
                          fontSize: 11,
                          color: Colors.white),
                    )
                  : Text(
                      widget.text,
                      style: const TextStyle(
                          fontFamily: 'Roboto-Light',
                          fontWeight: FontWeight.w800,
                          fontSize: 11,
                          color: Colors.black),
                    )),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String hintText;
  final bool obscuretext;
  final TextEditingController textController;
  const MyTextField(
      {super.key,
      required this.hintText,
      required this.obscuretext,
      required this.textController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
          obscureText: obscuretext,
          controller: textController,
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.cyan
                      )),
                
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)),
              fillColor: Colors.grey[200],
              filled: true,
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.black))),
    );
  }
}

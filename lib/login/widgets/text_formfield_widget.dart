import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String name;
  final bool obscureText;
  TextInputType? keyboardtybe;
  TextFormFieldWidget(
      {Key? key,
      this.keyboardtybe,
      required this.controller,
      required this.name,
      required this.obscureText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: TextFormField(
        obscureText: obscureText,
        controller: controller,
        validator: (val) => val!.isEmpty ? "$name can't be empty " : null,
        decoration: InputDecoration(hintText: name),
        keyboardType: keyboardtybe,
      ),
    );
  }
}

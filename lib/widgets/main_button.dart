import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  const MainButton({Key? key, this.action, this.text = ''}) : super(key: key);
  final String text;
  final VoidCallback? action;

  @override
  Widget build(BuildContext context) {
    return Align(
        child: Container(
      height: 75,
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      decoration: BoxDecoration(
          color: Colors.orange, borderRadius: BorderRadius.circular(25)),
      child: ElevatedButton(
        onPressed: action,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          elevation: MaterialStateProperty.all(0),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 25,
            color: Colors.white,
          ),
        ),
      ),
    ));
  }
}

import 'package:flutter/material.dart';
class SaveButton_widget extends StatelessWidget {
  const SaveButton_widget({
    super.key,
    required this.screenSize,
    required this.textTheme,
    required this.onPressed,
    required this.text
  });

  final Size screenSize;
  final TextTheme textTheme;
  final Function() onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenSize.height * 0.07,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
            ),
          ),
          child: Text(text,style: textTheme.bodyMedium,)),
    );
  }
}
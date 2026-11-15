import 'package:flutter/material.dart';

class AdviceField extends StatelessWidget {
  final String advice;
  const AdviceField({super.key, required this.advice});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Material(
      elevation: 20,
      borderRadius: BorderRadius.all(Radius.circular(15)),
      child: Container(
        decoration: BoxDecoration(
          color: themeData.colorScheme.onPrimary,
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
          child: Text(
            '''"$advice"''', // Replace with actual advice
            style: themeData.textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

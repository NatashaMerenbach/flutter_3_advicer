import 'package:flutter/material.dart';


class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    this.isLoading = false,
  });

  final VoidCallback onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return InkResponse(
      onTap: isLoading ? null : onPressed,
      child: Material(
        elevation: 20,
        borderRadius: BorderRadius.circular(15),
        child: Container(     
          decoration: BoxDecoration(
            color: themeData.colorScheme.secondary,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
            child: Text(
              isLoading ? 'Getting Advice...' : 'Get Advice',
              style: themeData.textTheme.headlineLarge,
            ),
          ),
        ),
      ),
    );
  }
}

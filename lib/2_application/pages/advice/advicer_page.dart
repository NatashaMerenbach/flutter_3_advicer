import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_3_advicer/2_application/core/services/theme_service.dart';
import 'package:flutter_3_advicer/2_application/pages/advice/widgets/custom_button.dart';
import 'package:flutter_3_advicer/2_application/pages/advice/widgets/error_message.dart';
import 'package:flutter_3_advicer/2_application/pages/advice/widgets/advice_feald.dart';

class AdvicerPage extends StatelessWidget {
  const AdvicerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final themeService = Provider.of<ThemeService>(context);
    final themeService2 = Provider.of<ThemeService>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('Advicer', style: themeData.textTheme.headlineLarge),
        centerTitle: true,
        actions: [
          Switch(
            value: themeService.isDarkMode,
            onChanged: (newValue) {
              themeService2
                  .toggleTheme(); // Toggle the theme using ThemeService
              // Handle theme switch
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        child: Column(
          children: [
            // Add your content here
            Expanded(
              child: Center(
                child: ErrorMessage(
                  message: 'Error message!',
                ), // Example error message
                //AdviceField(advice: 'Welcome to Advicer!'), // Example advice field
                // child: CircularProgressIndicator(
                //   color: themeData.colorScheme.secondary,
                // ),
                /*Text(
                  'Welcome to Advicer!',
                  style: themeData.textTheme.headlineLarge,
                  textAlign: TextAlign.center,*/
              ),
            ),
            SizedBox(
              height: 200,
              child: Center(child: CustomButton(onPressed: () {
                debugPrint('Button pressed!');
              })),
            ), // Example button
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_3_advicer/2_application/pages/advice/advicer_page.dart';
import 'package:provider/provider.dart';
import 'package:flutter_3_advicer/2_application/core/services/theme_service.dart';
import 'package:flutter_3_advicer/theme.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeService(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(
      builder: (context, themeService, child) {
        return MaterialApp(
          themeMode: themeService.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          debugShowCheckedModeBanner: false,
          showSemanticsDebugger: false,
          home: const AdvicerPage(),
        );
      },
    );
  }
}

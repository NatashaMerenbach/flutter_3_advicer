import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_3_advicer/main.dart';
import 'package:flutter_3_advicer/2_application/core/services/theme_service.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('shows advice page and toggles theme', (tester) async {
    final themeService = ThemeService();
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => themeService,
        child: const MyApp(),
      ),
    );

    expect(find.text('Tap the button to get advice.'), findsOneWidget);
    expect(find.text('Get Advice'), findsOneWidget);
    final wasDark = themeService.isDarkMode;
    await tester.tap(find.byType(Switch));
    await tester.pumpAndSettle();
    expect(themeService.isDarkMode, !wasDark);
    expect(tester.takeException(), isNull);
  });
}

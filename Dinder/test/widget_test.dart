import 'package:dinder/Screens/HomeScreen.dart';
import 'package:dinder/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  setUpAll(() {
    // Keep tests hermetic: don't fetch fonts over the network.
    GoogleFonts.config.allowRuntimeFetching = false;
  });

  testWidgets('App launches to the home screen', (WidgetTester tester) async {
    // Use a phone-sized surface; the layout is designed for portrait phones.
    tester.view.physicalSize = const Size(1170, 2532);
    tester.view.devicePixelRatio = 3.0;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(MyApp());
    await tester.pump();

    expect(find.byType(HomeScreen), findsOneWidget);
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}

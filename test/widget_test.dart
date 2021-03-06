// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// import 'package:birb/main.dart';
import 'package:birb/no_content.dart';
import 'package:birb/posts_list.dart';

void main() {
  // testWidgets('Counter increments smoke test', (WidgetTester tester) async {
  //   // Build our app and trigger a frame.
  //   await tester.pumpWidget(MyApp());

  //   // Verify that our counter starts at 0.
  //   expect(find.text('0'), findsOneWidget);
  //   expect(find.text('1'), findsNothing);

  //   // Tap the '+' icon and trigger a frame.
  //   await tester.tap(find.byIcon(Icons.add));
  //   await tester.pump();

  //   // Verify that our counter has incremented.
  //   expect(find.text('0'), findsNothing);
  //   expect(find.text('1'), findsOneWidget);
  // });
  Widget buildTestableWidget(Widget widget) {
    return MediaQuery(
      data: const MediaQueryData(),
      child: MaterialApp(home: widget)
    );
  }
  
  testWidgets('No content widget', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(const NoContent()));
    expect(find.text('No birbs a birbing.'), findsOneWidget);

    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: NoContent()
      ),
    ));
    expect(find.text('No birbs a birbing.'), findsOneWidget);
  });

  testWidgets('Renders list of posts', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: PostsList(),
    ));

    expect(find.byType(Card), findsNWidgets(2));
    expect(find.text('Prim Birb'), findsNWidgets(2));
  });
}

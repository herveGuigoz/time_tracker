import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:macos_ui/macos_ui.dart';

import 'app/app.dart';

void main() {
  runApp(
    ProviderScope(
      child: Main(),
    ),
  );
}

class Main extends StatelessWidget {
  const Main({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MacosApp(
      title: 'Time Tracker',
      theme: MacosThemeData.light(),
      darkTheme: MacosThemeData.dark().copyWith(
        primaryColor: Color.fromRGBO(69, 81, 114, 1),
      ),
      debugShowCheckedModeBanner: false,
      home: App(),
    );
  }
}

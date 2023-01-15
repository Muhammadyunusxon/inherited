import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'counter/GeneralPage.dart';

import 'counter/state_widget.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const String title = 'Inherited Widget';

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => StateWidget(
    child: Builder(
      builder: (context) {
        final state = StateInheritedWidget.of(context).state;
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: title,
          theme: ThemeData(
            scaffoldBackgroundColor: state.backgroundColor,
            primaryColor: Colors.white,
          ),
          home: const MainPage(title: title),
        );
      },
    ),
  );
}



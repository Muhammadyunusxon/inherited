import 'package:flutter/material.dart';
import 'package:inherited/counter/state_widget.dart';

import 'button widget.dart';
import 'colorPage.dart';
import 'counter Page.dart';

class MainPage extends StatefulWidget {
  final String title;

  const MainPage({
    required this.title,
  });

  @override
  // ignore: library_private_types_in_public_api
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    final counter = StateInheritedWidget.of(context).state.counter;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$counter',
              style: TextStyle(fontSize: 100),
            ),
            const SizedBox(height: 47),
            ButtonWidget(
              text: 'Change Color',
              onClicked: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => ColorPage(),
                ),
              ),
            ),
            const SizedBox(height: 24),
            ButtonWidget(
              text: 'Change Counter',
              onClicked: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => CounterPage(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
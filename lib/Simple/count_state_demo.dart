import 'package:flutter/material.dart';
import 'package:inherited/Simple/state_widget.dart';

Route generatePage(child) {
  return MaterialPageRoute(builder: (context) => child);
}

class MyNavigation extends StatelessWidget {
  const MyNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyInheritedWidget(
      message: ['Hey, Uzbek'],
      child: Navigator(
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case 'screen1':
              return generatePage(const FirstScreen());
            case 'screen2':
              return generatePage(const SecondScreen());
          }
        },
        pages: [

        ],
        initialRoute: 'screen1',
      ),
    );
  }
}



class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Geeks For Geeks'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: ElevatedButton(
          child: Text(MyInheritedWidget.of(context).message.first),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => const SecondScreen()));
          },
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Geeks For Geeks'),
          backgroundColor: Colors.green,
        ),
        body: Center(
          child: TextButton(
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (_)=>ThreeScreen()));
            },
            child: Text(
              "${MyInheritedWidget.of(context).message}\n This is second screen",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ));
  }
}

class ThreeScreen extends StatelessWidget {
  const ThreeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Geeks For Geeks'),
          backgroundColor: Colors.green,
        ),
        body: Center(
          child: Text(
            "${MyInheritedWidget.of(context).message}\n This is three screen",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ));
  }
}

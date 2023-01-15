import 'package:flutter/material.dart';

class MyInheritedWidget extends InheritedWidget {
  const MyInheritedWidget(
      {Key? key, required this.child, required this.message})
      : super(key: key, child: child);

  @override
  // ignore: overridden_fields
  final Widget child;
  final List<String> message;

  static MyInheritedWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>()!;
  }

  @override
  bool updateShouldNotify(MyInheritedWidget oldWidget) {
    return true;
  }
}

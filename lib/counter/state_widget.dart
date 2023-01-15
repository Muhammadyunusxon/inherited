import 'package:flutter/material.dart';
import 'package:inherited/counter/core_state.dart';

class StateWidget extends StatefulWidget {
  final Widget child;

  const StateWidget({Key? key, required this.child}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _StateWidgetState createState() => _StateWidgetState();
}

class _StateWidgetState extends State<StateWidget> {
  CoreState state = const CoreState();

  void incrementCounter() {
    final counter = state.counter + 1;
    final newState = state.copy(counter: counter);
    setState(() => state = newState);
  }

  void setColor(Color backgroundColor) {
    final newState = state.copy(backgroundColor: backgroundColor);
    setState(() => state = newState);
  }

  void setCounter(int counter) {
    final newState = state.copy(counter: counter);

    setState(() => state = newState);
  }

  @override
  Widget build(BuildContext context) =>
      StateInheritedWidget(
        state: state,
        stateWidget: this,
        child: widget.child,
      );
}

class StateInheritedWidget extends InheritedWidget {
  final CoreState state;

  // ignore: library_private_types_in_public_api
  final _StateWidgetState stateWidget;

  const StateInheritedWidget(
      {Key? key, required Widget child, required this.state, required this.stateWidget}) : super(key: key, child: child);

  // ignore: library_private_types_in_public_api
  static _StateWidgetState of(BuildContext context) => context
      .dependOnInheritedWidgetOfExactType<StateInheritedWidget>()!
      .stateWidget;

  @override
  bool updateShouldNotify(StateInheritedWidget oldWidget) =>
      oldWidget.state != state;
}

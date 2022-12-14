import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_demo/initial_screen.dart';
import 'package:state_demo/provider/logic_state.dart';
// 31 July 2022 - @MovingMelody
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      child: MaterialApp(
        home: const InitialScreen(title: "Initial Screen"),
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
      ),
      create: (_) => LogicState(),
    );
  }
}

// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_demo/provider/logic_state.dart';
import 'package:state_demo/second_screen.dart';

class InitialScreen extends StatefulWidget {
  final String title;
  const InitialScreen({Key? key, required this.title}) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  String dataVar = "Local Variable";
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _fetchDataOnInit();
    });
  }

  _fetchDataOnInit() async {
    try {
      await Provider.of<LogicState>(context, listen: false).fetchData();
    } catch (err) {
      print(err);
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<LogicState>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(dataVar),
            if (state.isFetching) const CircularProgressIndicator(),
            ...state.getData.map(((e) => Text("${e.id} : ${e.title}"))),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SecondScreen()),
                  );
                },
                child: const Text("Navigate"))
          ],
        ),
      ),
    );
  }
}

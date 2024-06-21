import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_test/provider/counter_provider.dart';
import 'package:provider_test/provider/theme_provider.dart';

import '../main.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detial"),
      ),
      body: Column(
        children: [
          Consumer<CounterProvider>(
            builder: (BuildContext context, CounterProvider value, Widget? child) {
              return Text("${value.count}");
            },
          ),
          ElevatedButton(
              onPressed: () {
                Provider.of<ThemeProvider>(context,listen: false).changeTheme();
              },
              child: Text("Change"))
        ],
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: "add",
            onPressed: () {
              // Provider.of<CounterProvider>(context, listen: false).increment();
              Provider.of<CounterProvider>(context, listen: false).changeCounter(true);
            },
            child: Icon(Icons.add),
          ),
          FloatingActionButton(
            heroTag: "remove",
            onPressed: () {
              // Provider.of<CounterProvider>(context, listen: false).decrement();
              Provider.of<CounterProvider>(context, listen: false).changeCounter(false);
            },
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}

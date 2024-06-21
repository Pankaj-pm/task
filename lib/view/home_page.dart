import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_test/provider/counter_provider.dart';
import 'package:provider_test/provider/theme_provider.dart';
import 'package:provider_test/view/detail_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print("build ==>");
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                print("clickk");
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailPage(),
                    ));
              },
              icon: Icon(Icons.send)),
          IconButton(
              onPressed: () {
                Provider.of<ThemeProvider>(context,listen: false).changeTheme();

              },
              icon: Icon(Icons.light_mode))
        ],
      ),
      body: Column(
        children: [
          Consumer<CounterProvider>(
            builder: (BuildContext context, CounterProvider value, Widget? child) {
              return Text(
                "${value.count}",
                style: Theme.of(context).textTheme.headlineLarge,
              );
            },
          ),
          Text("Hello All"),
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

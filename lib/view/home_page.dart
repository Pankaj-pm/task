import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_test/provider/counter_provider.dart';
import 'package:provider_test/provider/theme_provider.dart';
import 'package:provider_test/view/detail_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isDone = false;

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
                Provider.of<ThemeProvider>(context, listen: false).changeTheme();
              },
              icon: Icon(Icons.light_mode))
        ],
      ),
      body: Column(
        children: [
          Row(
            children: [
              Draggable(
                data: "red",
                child: Container(
                  height: 80,
                  width: 80,
                  color: isDone ? Colors.grey : Colors.red,
                  child: Center(
                      child: Text(
                    "Apple",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  )),
                ),
                feedback: Container(
                  color: Colors.red,
                  height: 80,
                  width: 80,
                  child: Center(
                      child: Text(
                        "Apple",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      )),
                ),
                childWhenDragging: Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(border: Border.all(color: Colors.grey, width: 5)),
                ),
              ),
              SizedBox(width: 30,),
              LongPressDraggable(
                data: "red",
                child: Container(
                  height: 80,
                  width: 80,
                  color: isDone ? Colors.grey : Colors.red,
                  child: Center(
                      child: Text(
                    "Apple1",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  )),
                ),
                feedback: Container(
                  color: Colors.red,
                  height: 80,
                  width: 80,
                  child: Center(
                      child: Text(
                        "Apple",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      )),
                ),
                childWhenDragging: Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(border: Border.all(color: Colors.grey, width: 5)),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 200,
          ),
          DragTarget(
            builder: (context, candidateData, rejectedData) {
              return Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  color: isDone ? Colors.red : Colors.transparent,
                  border: Border.all(color: Colors.grey, width: 5),
                ),
              );
            },
            onWillAccept: (data) {
              print("onWillAccept-- $data");
              return true;
            },
            onAccept: (data) {
              isDone = true;
              setState(() {});
              print("onAccept === > $data");
            },
          )
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

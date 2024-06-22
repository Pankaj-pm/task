import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_test/provider/counter_provider.dart';

import '../main.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detial"),
      ),
      body: Consumer<CounterProvider>(
        builder: (BuildContext context, CounterProvider value, Widget? child) {
          return Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: myDragWidget("apple", value.isapple ? "" : "🍎"),
                    ),
                    Expanded(
                      child: myDragWidget("Tomato", value.isTomato ? "" : "🍅"),
                    ),
                    Expanded(
                      child: myDragWidget("kedu", value.iskedu ? "" : "🍌"),
                    ),
                    Expanded(
                      child: myDragWidget("ananas", value.isananas ? "" : "🍍"),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: myDragTargetWidget("kedu", value.iskedu ? "🍌" : "banana"),
                    ),
                    Expanded(
                      child: Center(
                        child: myDragTargetWidget("apple", value.isapple ? "🍎" : "Apple"),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: myDragTargetWidget("ananas", value.isananas ? "🍍" : "pineapple"),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: myDragTargetWidget("Tomato", value.isTomato ? "🍅" : "tomato"),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget myDragWidget(String data, String text) {
    return Draggable(
      data: data,
      feedback: Text(
        text,
        style: TextStyle(fontSize: 100),
      ),
      childWhenDragging: Container(),
      child: Text(
        text,
        style: TextStyle(fontSize: 100),
      ),
    );
  }

  Widget myDragTargetWidget(String tagData, String text) {
    return DragTarget(
      builder: (BuildContext context, List<Object?> candidateData, List<dynamic> rejectedData) {
        bool isAvailable=false;
        if(candidateData.isNotEmpty) {
          isAvailable=true;
          print("candidateData ${candidateData.first}");
        }
        return Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(
              color: isAvailable ? Colors.green:Colors.transparent,
              width: 5,
            ),
          ),
          child: Text(
            text,
            style: TextStyle(fontSize: 30),
          ),
        );
      },
      onWillAccept: (data) {
        print("onWillAccept $data == $tagData");
        return data == tagData;
      },
      onAccept: (data) {
        Provider.of<CounterProvider>(context, listen: false).changeData(data.toString());
        print("onAccept = $data");
      },
    );
  }
}

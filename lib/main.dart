import 'package:flutter/material.dart';
import 'package:taskmanager/widget/addTask.dart';
import 'package:taskmanager/widget/text.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex;

  @override
  Widget build(BuildContext context) {
    print(currentIndex);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: currentIndex == 0 ? TextWidget("the add is called") : AddTask(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add task'),
          BottomNavigationBarItem(icon: Icon(Icons.edit), label: 'Edit task')
        ],
      ),
    );
  }
}

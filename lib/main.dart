import 'package:flutter/material.dart';
import 'package:taskmanager/pages/createTask.dart';
import 'package:taskmanager/pages/readAllTasks.dart';
import 'package:taskmanager/pages/settings.dart';
import 'package:taskmanager/widget/addTask.dart';
import 'package:taskmanager/widget/textFormInput.dart';

// To get done to switch to more pages then 2 with a function or something
// 1 is home, 2 is history, 3 is settings
// and split the used pages up in widgets that can be reused

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
      home: MyHomePage(title: 'My task manager'),
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
  int currentIndex = 1;

  List<Widget> pages = [CreateTask(), ReadAllTasks(), Settings()];

  @override
  Widget build(BuildContext context) {
    print(currentIndex);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add task'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings')
        ],
      ),
    );
  }
}

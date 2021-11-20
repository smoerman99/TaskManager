import 'package:flutter/material.dart';
import 'package:taskmanager/dal/dbConnection.dart';
import 'package:taskmanager/dal/models/task.dart';
import 'package:taskmanager/widget/textFormInput.dart';

////////
/// Hier verder
/// https://www.javatpoint.com/flutter-database-concepts
/// oh yeah
///
/// https://www.youtube.com/watch?v=UpKrhZ0Hppk
/// verder bij 6:05 initDB aanmaken
/// deze kijken
///////

class CreateTask extends StatefulWidget {
  const CreateTask();

  @override
  _CreateTaskState createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  TextEditingController title = TextEditingController();
  TextEditingController category = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        padding: EdgeInsets.all(8.0),
        children: [
          TextFormInput(
            labelText: "Enter your title",
            myTextEditingController: title,
          ),
          TextFormInput(
            labelText: "Enter your category",
            myTextEditingController: category,
          ),
          ElevatedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  Task newTask = Task();
                  newTask.title = title.text;
                  newTask.category = category.text;
                  newTask.done = false;
                  newTask.dateTime = DateTime.now().toString();

                  insertTask(newTask);
                }
              },
              child: Text("Create Task"))
        ],
      ),
    );
  }

  Function insertTask(Task newtask) {
    DbConnection db = DbConnection();
    db.createTask(newtask);
    var result = db.readAllTasks();
    return null;
  }
}

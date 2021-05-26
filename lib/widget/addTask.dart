import 'package:flutter/material.dart';
import 'package:taskmanager/models/task.dart';

class AddTask extends StatefulWidget {
  final List<String> categories;

  const AddTask({Key key, @required this.categories}) : super(key: key);

  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final _formkey = GlobalKey<FormState>();
  final myController = TextEditingController();

  String dropdownValue;
  Task newTask;

  @override
  void initState() {
    super.initState();
    dropdownValue = widget.categories.first;
    newTask = Task();
    newTask.dateTime = DateTime.now().toString();
    newTask.done = false;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              decoration: dec,
              validator: (value) {
                if (value != null && value.isNotEmpty) {
                  newTask.title = value;
                }
                return null;
              },
            ),
            TextFormField(
              decoration: dec,
              validator: (value) {
                if (value != null && value.isNotEmpty) {
                  if (newTask.notes == null) {
                    newTask.notes = List.empty(growable: true);
                  }
                  newTask.notes.add(value);
                }
                return null;
              },
            ),
            widget.categories != null && widget.categories.length > 0
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: dropdownValue,
                          onChanged: (String newValue) {
                            setState(() {
                              dropdownValue = newValue;
                              newTask.category = newValue;
                            });
                          },
                          items: widget.categories
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem(
                              child: Text(
                                value.replaceFirst(
                                    value[0], value[0].toUpperCase()),
                              ),
                              value: value,
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  )
                : Text("it aint a bit empty"),
            ElevatedButton(
                onPressed: () => {if (_formkey.currentState.validate()) {}},
                child: Text("Add Task")),
          ],
        ),
      ),
    );
  }

  get dec => InputDecoration(
        contentPadding: const EdgeInsets.all(8.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      );
}

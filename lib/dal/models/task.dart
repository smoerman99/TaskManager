class Task {
  String title;
  String category;
  String dateTime;
  bool done;
  List subTask;

  Task();

  Task.fill(this.title, this.category, this.dateTime, this.done, this.subTask);

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'category': category,
      'dateTime': dateTime,
      'done': done,
      'subTask': subTask,
    };
  }

  Task.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        category = json['category'],
        dateTime = json['dateTime'],
        done = json['done'],
        subTask = json['subTask'];

  Map<String, dynamic> toJson() => {
        'title': title,
        'category': category,
        'dateTime': dateTime,
        'status': done,
        'subTask': subTask
      };
}

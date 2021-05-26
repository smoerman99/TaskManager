class Task {
  String title;
  String category;
  String dateTime;
  bool done;
  List notes;

  Task();

  Task.fill(this.title, this.category, this.dateTime, this.done, this.notes);

  Task.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        category = json['category'],
        dateTime = json['dateTime'],
        done = json['done'],
        notes = json['notes'];

  Map<String, dynamic> toJson() => {
        'title': title,
        'category': category,
        'dateTime': dateTime,
        'status': done,
        'notes': notes
      };
}

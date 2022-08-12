class Data {
  int? userId;
  int? id;
  String? title;
  bool? completed;
  String? body;
  Data({this.completed, this.id, this.title, this.userId, this.body});
  factory Data.getRequest({required Map json}) {
    return Data(
        completed: json['completed'],
        id: json['id'],
        title: json['title'],
        userId: json['userId']);
  }

  Map toJson() {
    return {
      'title': title,
      'body': body,
      'userId': userId,
    };
  }
}

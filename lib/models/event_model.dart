class EventModel {
  final String id;
  final String title;
  final String location;
  final String date;
  final String time;
  final String? image;
  EventModel({
    required this.id,
    required this.title,
    required this.location,
    required this.date,
    required this.time,
    this.image,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      id: json['_id'],
      title: json['title'],
      location: json['location'],
      date: json['date'],
      time: json['time'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'location': location,
      'date': date,
      'time': time,
    };
  }
}

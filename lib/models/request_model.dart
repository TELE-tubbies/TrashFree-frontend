class RequestModel {
  final String date;
  final String pickupTime;
  final List<String> wasteType;
  final String location;
  RequestModel({
    required this.date,
    required this.pickupTime,
    required this.wasteType,
    required this.location,
  });

  factory RequestModel.fromJson(Map<String, dynamic> json) => RequestModel(
        date: json["date"],
        pickupTime: json["pickup_time"],
        wasteType: List<String>.from(json["waste_type"].map((x) => x)),
        location: json["location"],
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "pickup_time": pickupTime,
        "waste_type": List<dynamic>.from(wasteType.map((x) => x)),
        "location": location,
      };
}

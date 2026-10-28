class EventDM {
  String id;
  String ownerId;
  String category;
  String title;
  String description;
  DateTime date;

  EventDM({
    required this.id,
    required this.ownerId,
    required this.category,
    required this.title,
    required this.description,
    required this.date,
  });

  EventDM.fromJson(Map<String, dynamic> json)
      : id = json["id"] ?? "",
        ownerId = json["ownerId"] ?? "",
        category = json["category"] ?? "",
        title = json["title"] ?? "",
        description = json["description"] ?? "",
        date = json["date"] != null
            ? (json["date"]).toDate()
            : DateTime.now();

  Map<String, dynamic> toJson() => {
    "id": id,
    "ownerId": ownerId,
    "category": category,
    "title": title,
    "description": description,
    "date": date,
  };
}
class UserDM {
  String id;
  String email;
  String name;
  List<String>? favorites;

  UserDM({
    required this.id,
    required this.email,
    required this.name,
    this.favorites,
  });

  UserDM.fromJson(Map<String, dynamic> json)
      : id = json["id"] ?? "",
        email = json["email"] ?? "",
        name = json["name"] ?? "",
        favorites = json["favorites"] != null
            ? List<String>.from(json["favorites"])
            : [];

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "name": name,
    "favorites": favorites,
  };
}
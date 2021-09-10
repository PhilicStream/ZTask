import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    required this.sliders,
    required this.profiles,
    required this.success,
    required this.details,
  });

  List<Slider> sliders;
  List<Profile> profiles;
  String success;
  String details;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        sliders:
            List<Slider>.from(json["sliders"].map((x) => Slider.fromJson(x))),
        profiles: List<Profile>.from(
            json["profiles"].map((x) => Profile.fromJson(x))),
        success: json["success"],
        details: json["details"],
      );

  Map<String, dynamic> toJson() => {
        "sliders": List<dynamic>.from(sliders.map((x) => x.toJson())),
        "profiles": List<dynamic>.from(profiles.map((x) => x.toJson())),
        "success": success,
        "details": details,
      };
}

class Profile {
  Profile({
    required this.id,
    required this.name,
    required this.mail,
  });

  String id;
  String name;
  String mail;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        id: json["id"],
        name: json["name"],
        mail: json["mail"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "mail": mail,
      };
}

class Slider {
  Slider({
    required this.image,
  });

  String image;

  factory Slider.fromJson(Map<String, dynamic> json) => Slider(
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
      };
}

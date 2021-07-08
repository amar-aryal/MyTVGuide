import 'dart:convert';

List<Show> showFromJson(String str) =>
    List<Show>.from(json.decode(str).map((x) => Show.fromJson(x)));

String showToJson(List<Show> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Show {
  Show({
    this.score,
    this.show,
  });

  double score;
  ShowClass show;

  factory Show.fromJson(Map<String, dynamic> json) => Show(
        score: json["score"].toDouble(),
        show: ShowClass.fromJson(json["show"]),
      );

  Map<String, dynamic> toJson() => {
        "score": score,
        "show": show.toJson(),
      };
}

class ShowClass {
  ShowClass({
    this.id,
    this.url,
    this.name,
    this.type,
    this.language,
    this.genres,
    this.runtime,
    this.premiered,
    this.rating,
    this.network,
    this.image,
    this.imageLarge,
    this.summary,
  });

  int id;
  String url;
  String name;
  String type;
  String language;
  List<String> genres;
  dynamic runtime;
  dynamic premiered;
  dynamic rating;
  String network;
  dynamic image;
  dynamic imageLarge;
  String summary;
  bool isFav = false; // for favourites list

  factory ShowClass.fromJson(Map<String, dynamic> json) => ShowClass(
        id: json["id"],
        url: json["url"],
        name: json["name"],
        type: json["type"],
        language: json["language"] == null ? 'N/A' : json["language"],
        genres: json["genres"] == null
            ? []
            : List<String>.from(json["genres"].map((x) => x)),
        runtime: json["runtime"] == null ? 'N/A' : json["runtime"],
        premiered: json["premiered"] == null ? 'N/A' : json["premiered"],
        rating: json["rating"]["average"] == null
            ? 'N/A'
            : json["rating"]["average"],
        network: json["network"] == null ? 'N/A' : json["network"]["name"],
        image: json["image"] == null
            // ? 'https://thumbs.dreamstime.com/b/transparent-designer-must-have-fake-background-39672616.jpg'
            ? 'https://freepikpsd.com/media/2019/10/no-image-available-icon-png-8-Transparent-Images.png'
            : json["image"]["medium"],
        imageLarge: json["image"] == null
            ? 'https://freepikpsd.com/media/2019/10/no-image-available-icon-png-8-Transparent-Images.png'
            : json["image"]["original"],
        summary: json["summary"] == null ? 'N/A' : json["summary"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "name": name,
        "type": type,
        "language": language,
        "genres": List<dynamic>.from(genres.map((x) => x)),
        "runtime": runtime,
        "premiered": premiered,
        "rating": rating,
        "network": network,
        "image": image,
        "summary": summary,
      };
}

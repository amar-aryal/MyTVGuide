import 'dart:convert';

List<Episode> episodeFromJson(String str) =>
    List<Episode>.from(json.decode(str).map((x) => Episode.fromJson(x)));

// String episodeToJson(List<Episode> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Episode {
  Episode({
    this.id,
    this.url,
    this.name,
    this.season,
    this.number,
    this.type,
    this.airdate,
    this.airtime,
    this.airstamp,
    this.runtime,
    this.image,
    this.imageLarge,
    this.summary,
  });

  int id;
  String url;
  String name;
  int season;
  int number;
  String type;
  String airdate;
  String airtime;
  String airstamp;
  int runtime;
  String image;
  String imageLarge;
  String summary;

  factory Episode.fromJson(Map<String, dynamic> json) => Episode(
        id: json["id"],
        url: json["url"],
        name: json["name"],
        season: json["season"],
        number: json["number"],
        type: json["type"] == null ? 'N/A' : json["type"],
        airdate: json["airdate"].toString() == null
            ? 'N/A'
            : json["airdate"].toString(),
        airtime: json["airtime"] == null ? 'N/A' : json["airtime"],
        airstamp: json["airstamp"].toString() == null
            ? 'N/A'
            : json["airstamp"].toString(),
        runtime: json["runtime"] == null ? 'N/A' : json["runtime"],
        image: json["image"] == null
            ? 'https://freepikpsd.com/media/2019/10/no-image-available-icon-png-8-Transparent-Images.png'
            : json["image"]["medium"],
        imageLarge: json["image"] == null
            ? 'https://freepikpsd.com/media/2019/10/no-image-available-icon-png-8-Transparent-Images.png'
            : json["image"]["original"],
        summary: json["summary"] == null ? 'N/A' : json["summary"],
      );

  // Map<String, dynamic> toJson() => {
  //       "id": id,
  //       "url": url,
  //       "name": name,
  //       "season": season,
  //       "number": number,
  //       "type": type,
  //       "airdate":
  //           "${airdate.year.toString().padLeft(4, '0')}-${airdate.month.toString().padLeft(2, '0')}-${airdate.day.toString().padLeft(2, '0')}",
  //       "airtime": airtime,
  //       "airstamp": airstamp.toIso8601String(),
  //       "runtime": runtime,
  //       "image": image.toJson(),
  //       "summary": summary,
  //     };
}

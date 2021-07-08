import 'package:MyTVGuide/models/episode.dart';
import 'package:flutter/material.dart';

class EpisodeDetailWidget extends StatelessWidget {
  const EpisodeDetailWidget({
    @required this.episode,
  });

  final Episode episode;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(
      fontSize: MediaQuery.of(context).size.height * 0.02,
    );
    return Container(
      width: double.infinity,
      transform: Matrix4.translationValues(
          0.0, -MediaQuery.of(context).size.height * 0.03, 0.0),
      padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.024),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35), topRight: Radius.circular(35)),
      ),
      child: Column(
        children: [
          Column(
            children: [
              Text(
                episode.name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.025,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Divider(color: Colors.grey),
              textData(
                textStyle,
                "Season ${episode.season} episode ${episode.number}",
              ),
              textData(textStyle, "Type: ${episode.type}"),
              textData(textStyle, "Runtime: ${episode.runtime}"),
              textData(textStyle, "Air date: ${episode.airdate}"),
              textData(textStyle, "Airtime: ${episode.airtime}"),
            ],
          ),
          Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Text(
                'Synopsis',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.025,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Text(
                episode.summary.replaceAll(RegExp(r'<[^>]*>|&[^;]+;'), ' '),
                textAlign: TextAlign.justify,
                style: TextStyle(height: 1.5),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            ],
          ),
        ],
      ),
    );
  }
}

Padding textData(TextStyle textStyle, String data) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 10),
    child: Text(
      data,
      style: textStyle,
    ),
  );
}

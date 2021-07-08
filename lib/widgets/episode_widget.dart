import 'package:MyTVGuide/models/episode.dart';
import 'package:MyTVGuide/views/episode_detail.dart';
import 'package:flutter/material.dart';

class EpisodeWidget extends StatelessWidget {
  final List<Episode> episodes;
  final int index;

  EpisodeWidget({Key key, this.episodes, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(
      fontSize: MediaQuery.of(context).size.height * 0.02,
    );
    return Container(
      padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.024),
      margin: EdgeInsets.all(MediaQuery.of(context).size.height * 0.024),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Image.network(
            episodes[index].image,
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.04),
          Column(
            children: [
              Text(
                episodes[index].name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.025,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Divider(color: Colors.grey),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Text(
                "Season ${episodes[index].season} Episode ${episodes[index].number}",
                style: textStyle,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MaterialButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              EpisodeDetail(episode: episodes[index]),
                        ),
                      );
                    },
                    color: Colors.red[800],
                    child: Text(
                      "More info",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

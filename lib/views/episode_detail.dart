import 'package:MyTVGuide/models/episode.dart';
import 'package:MyTVGuide/widgets/episode_detail_widget.dart';
import 'package:flutter/material.dart';

class EpisodeDetail extends StatelessWidget {
  final Episode episode;

  EpisodeDetail({this.episode});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    child: Image.network(episode.imageLarge),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * 0.03,
                    ),
                    child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
              EpisodeDetailWidget(episode: episode),
            ],
          ),
        ),
      ),
    );
  }
}

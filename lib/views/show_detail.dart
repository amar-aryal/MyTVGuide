import 'package:MyTVGuide/models/series.dart';
import 'package:MyTVGuide/widgets/show_detail_widget.dart';
import 'package:flutter/material.dart';

class ShowDetail extends StatelessWidget {
  final ShowClass show;

  ShowDetail({this.show});
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
                    child: Image.network(show.imageLarge),
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
              ShowDetailWidget(show: show),
            ],
          ),
        ),
      ),
    );
  }
}

import 'dart:ui' as ui;
import 'package:devfest_18_kolkata/model/organisers.dart';
import 'package:devfest_18_kolkata/helper/widgets/colorful_bottom_border_provider.dart';
import 'package:devfest_18_kolkata/screens/organisers_details_screen/social_media_icons_row_provider.dart';
import 'package:flutter/material.dart';

class OrganiserDescriptionDialog extends StatelessWidget {
  final Organiser organiser;
  final int index;

  const OrganiserDescriptionDialog({
    Key key,
    this.organiser,
    this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Center(
      child: Stack(
        children: <Widget>[
          BackdropFilter(
            filter: ui.ImageFilter.blur(sigmaX: 2.5, sigmaY: 2.5),
            child: Container(
              color: Colors.white.withOpacity(0.0),
            ),
          ),
          Center(
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              child: Container(
                width: width / 1.1,
                height: height / 1.2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SizedBox(height: 80.0),
                    Text(
                      organiser.title,
                      style: TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 20.0),
                    ),
                    SizedBox(height: 5.0),
                    Expanded(
                      flex: 1,
                      child: Container(
                        width: 250.0,
                        height: 300.0,
                        child: ListView(
                          physics: BouncingScrollPhysics(),
                          children: <Widget>[
                            Text(
                              organiser.genericDescription,
                            ),
                            SizedBox(height: 10.0),
                            Text(
                              organiser.specialDescription,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    greyScaleSocialMediaIconsRow(organiser),
                    bottomBorder(width: width),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 20.0,
            left: MediaQuery.of(context).size.width / 2.8,
            right: MediaQuery.of(context).size.width / 2.8,
            child: Container(
              child: Hero(
                tag: organiser.logoURI,
                child: CircleAvatar(
                  radius: 50.0,
                  backgroundColor: Colors.transparent,
                  child: Image.asset(
                    organiser.logoURI,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

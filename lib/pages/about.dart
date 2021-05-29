import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:universe/models/fadeAnimation.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:fluttericon/font_awesome_icons.dart';

const _lurl = 'https://www.linkedin.com/in/Rohitranjan2020';
const _turl = 'https://www.twitter.com/Rohitra2020';
const _iurl = 'https://www.instagram.com/rohitranjan2';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: RadialGradient(
            radius: 1.5,
            colors: [
              Colors.deepPurple,
              Colors.redAccent,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: FadeAnimation(
                  fadeDirection: FadeDirection.right,
                  delay: 1,
                  child: Text(
                    'About',
                    style: GoogleFonts.pacifico(
                      fontSize: 50,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  IconButton(
                    icon: Icon(FontAwesome.linkedin, size: 30),
                    onPressed: () => {launch(_lurl)},
                  ),
                  IconButton(
                    icon: Icon(FontAwesome.twitter,size: 30),
                    onPressed: () => {launch(_turl)},
                  ),
                  IconButton(
                    icon: Icon(FontAwesome.instagram,size: 30),
                    onPressed: () => {launch(_iurl)},
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

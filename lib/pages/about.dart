import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:universe/models/fade_animation.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:fluttericon/font_awesome_icons.dart';

const _lurl = 'https://www.linkedin.com/in/Rohitranjan2020';
const _turl = 'https://www.twitter.com/Rohitra2020';
const _iurl = 'https://www.instagram.com/rohitranjan2';
const _furl = 'https://flutter.dev/';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            radius: 1.5,
            colors: [
              Colors.deepPurple,
              Colors.redAccent,
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
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
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
                FadeAnimation(
                  fadeDirection: FadeDirection.right,
                  delay: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Made with ❤️ using ',
                          style: GoogleFonts.rancho(
                              fontSize: 35, color: Colors.blue[900]),
                        ),
                        InkWell(
                          onTap: () => {
                            launchUrl(Uri.parse(_furl)),
                          },
                          child: const FlutterLogo(size: 50),
                        ),
                      ],
                    ),
                  ),
                ),
                const FadeAnimation(
                  fadeDirection: FadeDirection.right,
                  delay: 1,
                  child: SizedBox(
                    height: 300,
                    width: 300,
                    child: FlareActor(
                      'assets/flare_files/galaxy.flr',
                      animation: 'play',
                    ),
                  ),
                ),
                FadeAnimation(
                  fadeDirection: FadeDirection.top,
                  delay: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10.0, top: 10.0),
                    child: Text(
                      'Connect with me on',
                      style: GoogleFonts.rancho(fontSize: 30),
                    ),
                  ),
                ),
                FadeAnimation(
                  fadeDirection: FadeDirection.top,
                  delay: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      IconButton(
                        icon: const Icon(FontAwesome.linkedin, size: 30),
                        onPressed: () => {launchUrl(Uri.parse(_lurl))},
                      ),
                      IconButton(
                        icon: const Icon(FontAwesome.twitter, size: 30),
                        onPressed: () => {launchUrl(Uri.parse(_turl))},
                      ),
                      IconButton(
                        icon: const Icon(FontAwesome.instagram, size: 30),
                        onPressed: () => {launchUrl(Uri.parse(_iurl))},
                      )
                    ],
                  ),
                ),
                FadeAnimation(
                  fadeDirection: FadeDirection.bottom,
                  delay: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width / 2,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15))),
                      child: TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Go Back',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

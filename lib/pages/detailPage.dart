import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:universe/models/fadeAnimation.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({
    Key key,
    @required this.desc,
    @required this.name,
    @required this.img,
  }) : super(key: key);

  final String desc;
  final String name;
  final String img;

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  _DetailPageState();
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.deepPurple,
                  Colors.redAccent,
                ],
              ),
            ),
          ),
          FadeAnimation(
            fadeDirection: FadeDirection.left,
            delay: 1,
            child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: 130,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.horizontal(left: Radius.circular(30)),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.red,
                      Colors.blue,
                    ],
                  ),
                ),
              ),
            ),
          ),
          SafeArea(
              child: Container(
            width: 245,
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Container(),
                ),
                FadeAnimation(
                  fadeDirection: FadeDirection.top,
                  delay: 1.6,
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 5,
                        height: 5,
                        decoration: BoxDecoration(
                            color: Color(0xFFFDCD00), shape: BoxShape.circle),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        widget.name,
                        style: GoogleFonts.permanentMarker(
                          fontSize: 40,
                          color: Colors.pink.shade100,
                        ),
                      )
                    ],
                  ),
                ),
                FadeAnimation(
                  fadeDirection: FadeDirection.top,
                  delay: 1.4,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 24),
                    child: Text(
                      widget.desc,
                      style: GoogleFonts.caveat(
                        color: Colors.yellowAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                      maxLines: 20,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                    ),
                  ),
                ),
                FadeAnimation(
                  fadeDirection: FadeDirection.top,
                  delay: 1.2,
                  child: Container(
                    margin: EdgeInsets.only(
                      bottom: 29,
                    ),
                    height: 60,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
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
              ],
            ),
          )),
          Positioned(
            right: -250,
            left: 140,
            height: 812,
            child: Hero(
              tag: widget.name,
              child: FlareActor(
                widget.img,
                animation: "Preview2",
                alignment: Alignment.centerRight,
                fit: BoxFit.contain,
              ),
            ),
          )
        ],
      ),
    );
  }
}

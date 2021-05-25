import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:universe/pages/detailPage.dart';

class CelestialCard extends StatefulWidget {
  final String heroTag;
  final String name;
  final String img;
  final String map;
  final String tagline;
  final String desc;

  const CelestialCard({
    Key key,
    this.heroTag,
    this.name,
    this.img,
    this.map,
    this.tagline,
    this.desc,
  }) : super(key: key);

  @override
  _CelestialCardState createState() =>
      _CelestialCardState(name, img, map, tagline, desc);
}

class _CelestialCardState extends State<CelestialCard> {
  final String name;
  final String img;
  final String map;
  final String tagline;
  final String desc;

  _CelestialCardState(this.name, this.img, this.map, this.tagline, this.desc);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailPage(
                desc: desc,
                name: name,
                img: img,
              ),
            ),
          );
        },
        child: Container(
          height: 210,
          width: 327,
          margin: EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
              color: Color(0xFF525145),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  offset: Offset(5, 5),
                  blurRadius: 7,
                )
              ],
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 210,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Color(0xFF525145),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Stack(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        child: Image.asset(
                          map,
                          height: 210,
                          width: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: 16,
                            right: 16,
                            bottom: 18,
                          ),
                          child: Text(
                            tagline,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 150,
                child: Image.asset(
                  img,
                  alignment: Alignment.center,
                  fit: BoxFit.fitHeight,
                  height: 180,
                  width: 180,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

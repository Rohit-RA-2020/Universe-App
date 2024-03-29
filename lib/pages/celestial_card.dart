import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:universe/pages/detail_page.dart';

class CelestialCard extends StatefulWidget {
  final String? name;
  final String? img;
  final String? map;
  final String? tagline;
  final String? desc;

  const CelestialCard({
    Key? key,
    this.name,
    this.img,
    this.map,
    this.tagline,
    this.desc,
  }) : super(key: key);

  @override
  _CelestialCardState createState() => _CelestialCardState();
}

class _CelestialCardState extends State<CelestialCard> {
  _CelestialCardState();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailPage(
                desc: widget.desc,
                name: widget.name,
                img: widget.img,
              ),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.only(right: 10.0, left: 10.0),
          child: Container(
            height: 210,
            width: 356,
            margin: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
                color: Colors.pink,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    offset: const Offset(5, 5),
                    blurRadius: 7,
                  )
                ],
                borderRadius: const BorderRadius.all(Radius.circular(20))),
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    height: 210,
                    width: 140,
                    decoration: BoxDecoration(
                      color: Colors.pink[100],
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Stack(
                      children: <Widget>[
                        ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          child: FlareActor(
                            widget.map,
                            animation: "solar_run",
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 35,
                              right: 3,
                              bottom: 3,
                            ),
                            child: Text(
                              widget.tagline!,
                              style: GoogleFonts.montserratAlternates(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Hero(
                  tag: widget.name!,
                  child: FlareActor(
                    widget.img,
                    animation: "Preview2",
                    alignment: Alignment.centerRight,
                    fit: BoxFit.scaleDown,
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

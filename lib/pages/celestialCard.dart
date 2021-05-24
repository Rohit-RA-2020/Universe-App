import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CelestialCard extends StatefulWidget {
  final String heroTag;

  const CelestialCard({Key key, this.heroTag}) : super(key: key);

  @override
  _CelestialCardState createState() => _CelestialCardState();
}

class _CelestialCardState extends State<CelestialCard> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {},
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
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:universe/fadeAnimation.dart';

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
  _DetailPageState createState() => _DetailPageState(desc, name, img);
}

class _DetailPageState extends State<DetailPage> {
  final String desc;
  final String name;
  final String img;

  _DetailPageState(this.desc, this.name, this.img);
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
                  Color(0xff4A423F),
                  Color(0xff9D8B8B),
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
                      Color(0xFF3D3730),
                      Color(0xFF837576),
                    ],
                  ),
                ),
                child: SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(
                          top: 29,
                        ),
                        height: 31,
                        width: 100,
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(25))),
                        child: TextButton(
                          child: Text(
                            'Go Back',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                            ),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
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
                        name,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
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
                      desc,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.white,
                      ),
                      maxLines: 10,
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
                    child: Text(
                      'Donate',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
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
              tag: 'Earth',
              child: Image.asset(
                img,
              ),
            ),
          )
        ],
      ),
    );
  }
}

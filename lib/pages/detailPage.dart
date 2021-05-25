import 'package:flutter/material.dart';
import 'package:universe/fadeAnimation.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({
    Key key,
    @required this.desc,
  }) : super(key: key);

  final String desc;

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: <Widget>[
          
        ],
      ),
    );
  }
}

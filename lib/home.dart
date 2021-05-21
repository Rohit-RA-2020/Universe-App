import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> listCategory = ["All", "Solar System", "Dark Energy"];
  int activeClassIndex = 0;

  @override
  Widget build(BuildContext context) {
    double paddingLeft = ScreenUtil().setWidth(24);

    return Material(
      child: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            radius: 1.0,
            colors: [
              Colors.orange,
              Colors.deepPurple,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: paddingLeft),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

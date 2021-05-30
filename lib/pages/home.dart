import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:universe/models/fadeAnimation.dart';
import 'dart:convert';
import 'package:universe/models/itemsModel.dart';
import 'package:universe/pages/about.dart';
import 'package:universe/pages/celestialCard.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> listCategory = ["All", "Solar System", "Dark Energy"];
  int activeClassIndex = 0;
  int itemCount = 0;

  List<Item> _data = <Item>[];
  List<Item> _dataForDisplay = <Item>[];
  bool _folded = true;

  Future<String> loadNoteAsset() async {
    return await rootBundle.loadString('assets/files/cosmos.json');
  }

  Future<List<Item>> parsePost() async {
    var data = <Item>[];
    String source = await loadNoteAsset();
    final parsed = jsonDecode(source);
    for (var item in parsed) {
      data.add(Item.fromJson(item));
    }
    return data;
  }

  @override
  void initState() {
    parsePost().then((value) {
      setState(() {
        _data.addAll(value);
        _dataForDisplay = _data;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 29,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Icon(
                            Icons.subject,
                            size: 35,
                            color: Colors.white,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => About(),
                                ),
                              );
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Container(
                                height: 50,
                                width: 100,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.red,
                                    width: 3,
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    'About',
                                    style: GoogleFonts.pacifico(
                                      fontSize: 30,
                                      color: Colors.white70,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    FadeAnimation(
                      fadeDirection: FadeDirection.left,
                      delay: 2,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 24,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Welcome',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 6),
                          ],
                        ),
                      ),
                    ),
                    FadeAnimation(
                      fadeDirection: FadeDirection.top,
                      delay: 2,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 24,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Discover the world outside you',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white.withOpacity(0.4),
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 6),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: FadeAnimation(
                        child: _animatedSearchBox(),
                        delay: 1,
                        fadeDirection: FadeDirection.top,
                      ),
                    ),
                    SizedBox(height: 20),
                    _dataForDisplay != null && _dataForDisplay.isNotEmpty
                        ? ListView.builder(
                            itemCount: _dataForDisplay.length,
                            physics: ClampingScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return FadeAnimation(
                                fadeDirection: FadeDirection.right,
                                delay: 2 + index / 5,
                                child: CelestialCard(
                                  name: _dataForDisplay[index].name,
                                  img: _dataForDisplay[index].imag,
                                  tagline: _dataForDisplay[index].tagline,
                                  map: _dataForDisplay[index].map,
                                  desc: _dataForDisplay[index].desc,
                                ),
                              );
                            },
                          )
                        : Center(
                            child:
                                Text('Adding this data soon 🤗 Stay Tunned')),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _animatedSearchBox() {
    return AnimatedContainer(
      duration: Duration(milliseconds: 400),
      width: _folded ? 100 : 56,
      height: 56,
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(32),
        color: Colors.purple[200],
        boxShadow: kElevationToShadow[6],
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 16.0),
              child: !_folded
                  ? TextField(
                      onChanged: (text) {
                        text = text.toLowerCase();
                        setState(() {
                          _dataForDisplay = _data.where((data) {
                            var dataTitle = data.name.toLowerCase();
                            return dataTitle.contains(text);
                          }).toList();
                        });
                      },
                      decoration: InputDecoration(
                        hintText:
                            _folded ? 'Press the Icon to Search' : 'Search',
                        hintStyle: TextStyle(
                          color: Colors.blue[900],
                        ),
                        border: InputBorder.none,
                      ),
                    )
                  : Text('Press the icon to Search'),
            ),
          ),
          AnimatedContainer(
            duration: Duration(microseconds: 400),
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(_folded ? 32 : 0),
                  topRight: Radius.circular(32),
                  bottomLeft: Radius.circular(_folded ? 32 : 0),
                  bottomRight: Radius.circular(32),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Icon(
                    _folded ? Icons.search : Icons.close,
                    color: Colors.blue[900],
                  ),
                ),
                onTap: () {
                  setState(() {
                    _folded = !_folded;
                  });
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

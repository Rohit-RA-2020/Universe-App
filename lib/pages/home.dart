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

  List<Item> _data = List<Item>();
  List<Item> _dataForDisplay = List<Item>();

  Future<String> loadNoteAsset() async {
    return await rootBundle.loadString('assets/files/cosmos.json');
  }

  Future<List<Item>> parsePost() async {
    var data = List<Item>();
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
                    FadeAnimation(
                      fadeDirection: FadeDirection.right,
                      delay: 1.5,
                      child: Container(
                        height: 108,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: listCategory.length,
                          itemBuilder: (context, index) {
                            return Center(
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    activeClassIndex = index;
                                    itemCount =
                                        listCategory[activeClassIndex].length;
                                  });
                                },
                                child: AnimatedContainer(
                                  duration: Duration(milliseconds: 500),
                                  margin: EdgeInsets.only(
                                      left: index == 0 ? 24 : 0),
                                  height: 31,
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: index == activeClassIndex
                                          ? Colors.black
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(25))),
                                  child: Text(
                                    listCategory[index],
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.yellow,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    _searchBar(),
                    ListView.builder(
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
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _searchBar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search.....',
        ),
        onChanged: (text) {
          text = text.toLowerCase();
          setState(() {
            _dataForDisplay = _data.where((data) {
              var dataTitle = data.name.toLowerCase();
              return dataTitle.contains(text);
            }).toList();
          });
        },
      ),
    );
  }
}

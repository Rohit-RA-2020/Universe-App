import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:universe/fadeAnimation.dart';
import 'dart:convert';
import 'package:universe/models/itemsModel.dart';
import 'package:universe/pages/celestialCard.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> listCategory = ["All", "Solar System", "Dark Energy"];
  int activeClassIndex = 0;
  int itemCount;

  @override
  void initState() {
    super.initState();

    loadData();
  }

  loadData() async {
    final cosmosJson = await rootBundle.loadString("assets/files/cosmos.json");
    final decodedData = jsonDecode(cosmosJson);
    var celestialData = decodedData["celestial"];
    CelestialModel.items = List.from(celestialData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();

    setState(() {});
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
                              print('About me Button Presses');
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Container(
                                height: 50,
                                width: 100,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.red),
                                ),
                                child: Center(
                                  child: Text(
                                    'About',
                                    style: TextStyle(
                                        fontSize: 25, color: Colors.amber),
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
                    ListView.builder(
                      itemCount: CelestialModel.items.length,
                      physics: ClampingScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final celestial = CelestialModel.items[index];
                        String heroTag = "humingbird" + index.toString();
                        return FadeAnimation(
                          fadeDirection: FadeDirection.right,
                          delay: 2 + index / 5,
                          child: CelestialCard(
                            heroTag: heroTag,
                            name: celestial.name,
                            img: celestial.imag,
                            tagline: celestial.tagline,
                            map: celestial.map,
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
}

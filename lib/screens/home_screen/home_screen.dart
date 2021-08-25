import 'dart:convert';

import 'package:disney_plus/screens/widgets/card_logos_widget.dart';
import 'package:disney_plus/screens/widgets/card_movie_widget.dart';
import 'package:disney_plus/screens/widgets/carousel_widget.dart';
import 'package:disney_plus/screens/widgets/text_title_widget.dart';
import 'package:disney_plus/widgets/app_icons.dart';
import 'package:disney_plus/widgets/divider_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  Future<List<dynamic>> loadJson() async {
    String data = await rootBundle.loadString('assets/data/data.json');
    final jsonResponse = jsonDecode(data);
    return jsonResponse;
  }

  Future<List<dynamic>> loadNewVideos() async {
    String data = await rootBundle.loadString('assets/data/newVideos.json');
    final jsonResponse = jsonDecode(data);
    return jsonResponse;
  }

  Future<List<dynamic>> loadContinue() async {
    String data = await rootBundle.loadString('assets/data/continue.json');
    final jsonResponse = jsonDecode(data);
    return jsonResponse;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          //mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/logo1.png',
              height: MediaQuery.of(context).size.height * .08,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AppBarIcons(
                  iconData: Icons.home,
                  title: 'HOME',
                ),
                SizedBox(
                  width: 20,
                ),
                AppBarIcons(
                  iconData: Icons.search,
                  title: 'SEARCH',
                ),
                SizedBox(
                  width: 20,
                ),
                AppBarIcons(
                  iconData: Icons.add,
                  title: 'WATCHLIST',
                ),
                SizedBox(
                  width: 20,
                ),
                AppBarIcons(
                  iconData: Icons.star,
                  title: 'ORIGINALS',
                ),
                SizedBox(
                  width: 15,
                ),
                AppBarIcons(
                  iconData: Icons.movie,
                  title: 'MOVIES',
                ),
                SizedBox(
                  width: 20,
                ),
                AppBarIcons(
                  iconData: Icons.tv,
                  title: 'SERIES',
                ),
              ],
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CircleAvatar(
                    child: Icon(
                      Icons.person,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        //centerTitle: true,
        backgroundColor: Color(0xFF0B0D15),
        elevation: 0,
      ),
      backgroundColor: Color(0xFF0B0D15),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 24),
        child: ListView(
          //shrinkWrap: true,
          children: [
            CarouselWidget(),
            DividerWidget(),
            CardRowLogo(),
            DividerWidget(),
            TextTitleWidget(
              title: 'Recommended For You',
            ),
            DividerWidget(),
            SizedBox(
              height: 150,
              width: 300,
              child: FutureBuilder<List<dynamic>>(
                future: loadJson(),
                builder: (context, snapshot) {
                  List<dynamic> recommendeVideos = snapshot.data!;
                  return snapshot.hasData
                      ? ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: recommendeVideos.length,
                          itemBuilder: (BuildContext context, int index) {
                            return CardMovieWidget(
                              images: recommendeVideos[index]['image'],
                            );
                          },
                        )
                      : Center(
                          child: CircularProgressIndicator(),
                        );
                },
              ),
            ),
            DividerWidget(),
            TextTitleWidget(
              title: 'New To Disney+',
            ),
            DividerWidget(),
            SizedBox(
              height: 150,
              width: 300,
              child: FutureBuilder<List<dynamic>>(
                future: loadNewVideos(),
                builder: (context, snapshot) {
                  List<dynamic> newVideos = snapshot.data!;
                  return snapshot.hasData
                      ? ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: newVideos.length,
                          itemBuilder: (BuildContext context, int index) {
                            return CardMovieWidget(
                              images: newVideos[index]['imgNew'],
                            );
                          },
                        )
                      : Center(
                          child: CircularProgressIndicator(),
                        );
                },
              ),
            ),
            DividerWidget(),
            TextTitleWidget(
              title: 'Continue Watching',
            ),
            DividerWidget(),
            SizedBox(
              height: 150,
              width: 300,
              child: FutureBuilder<List<dynamic>>(
                future: loadContinue(),
                builder: (context, snapshot) {
                  List<dynamic> continueWhatching = snapshot.data!;
                  return snapshot.hasData
                      ? ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: continueWhatching.length,
                          itemBuilder: (BuildContext context, int index) {
                            return CardMovieWidget(
                              images: continueWhatching[index]['continue'],
                            );
                          },
                        )
                      : Center(
                          child: CircularProgressIndicator(),
                        );
                },
              ),
            ),
            DividerWidget(),
          ],
        ),
      ),
    );
  }
}

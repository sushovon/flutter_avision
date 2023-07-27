import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_avision/subdesign/drawersub.dart';
import 'package:flutter_avision/subdesign/examinfo.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../common/apiclient.dart';
import '../res/colored.dart';
import '../res/strings.dart';
import '../response/homeone/homeoneresponse.dart';
import '../response/homeone/newsanalysis.dart';
import '../response/hometwo/Hometworesponse.dart';
import '../response/hometwo/newsanalysis2.dart';
import '../subdesign/dashboardfolder/dailydose.dart';
import '../subdesign/dashboardfolder/popularcourse.dart';
import '../subdesign/dashboardfolder/studentzone.dart';
import '../subdesign/dashboardfolder/youtubevideo.dart';
import '../subdesign/horizontal_list.dart';
import 'package:http/http.dart' as http;

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  //List<int> text = [1, 2, 3, 4];
  //late YoutubePlayerController _controller;
  @override
  void initState() {
    super.initState();
    /* _controller = YoutubePlayerController(
      initialVideoId: 'abAEevLvKMc',
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: true,
      ),
    ); */
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Avision"),
        backgroundColor: HexColor(Colored.buttonbluebg),
      ),
      drawer: DrawerSubPage(),
      backgroundColor: HexColor(Colored.grey),
      body: SingleChildScrollView(
        child: SizedBox(
          //width: MediaQuery.of(context).size.width,
          //height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              HorizontalListPage(),
              SizedBox(
                child: SizedBox(
                  child: FutureBuilder<HomeOneResponse>(
                    future: homeone(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        HomeOneResponse? data = snapshot.data;
                        NewsAnalysis? newsanalysis = data?.newsAnalysis;
                        return _newsView(newsanalysis!);
                      } else if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      }
                      return Container();
                    },
                  ),
                ),
              ),
              //for (var i in text) Text(i.toString()) running for loop inside widget
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      Strings.jobalert,
                      style: TextStyle(
                          color: HexColor(Colored.bluebg2),
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      Strings.viewall,
                      style: TextStyle(
                          color: HexColor(Colored.bluebg2),
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: FutureBuilder<HomeTwoResponse>(
                  future: hometwo(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      HomeTwoResponse? data = snapshot.data;
                      NewsAnalysis2? newsanalysis = data?.newsAnalysis;
                      return _hometwoview(newsanalysis!);
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }
                    return Container(
                        alignment: Alignment.center,
                        child: CircularProgressIndicator());
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<HomeOneResponse> homeone() async {
    final nowdate = DateFormat('yyyy/dd/MM').format(DateTime.now());
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? userid = prefs.getString('user_id');

    var map = <String, dynamic>{};
    map['posted_date'] = nowdate;
    map['user_id'] = userid;
    map['student_id'] = userid;
    final client = ApiClient();
    http.Response response = await client.homeapione(map);

    //data = jsonDecode(response.body);
    String jsonsDataString = response.body.toString().replaceAll("\n", "");
    HomeOneResponse res = HomeOneResponse.fromJson(jsonDecode(jsonsDataString));
    //print(res.newsAnalysis?.trendingTest?.length);
    return res;
  }

  Future<HomeTwoResponse> hometwo() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? userid = prefs.getString('user_id');

    var map = <String, dynamic>{};
    map['user_id'] = userid;
    map['student_id'] = userid;
    final client = ApiClient();
    http.Response response = await client.homeapitwo(map);
    String jsonsDataString = response.body.toString().replaceAll("\n", "");
    HomeTwoResponse res = HomeTwoResponse.fromJson(jsonDecode(jsonsDataString));

    return res;
  }

  Container _newsView(NewsAnalysis newsanalysis) {
    return Container(
      child: Column(
        children: [
          SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 200,
              child: CarouselSlider.builder(
                  itemCount: newsanalysis.bannerFetch?.length,
                  itemBuilder: (BuildContext context, int itemIndex,
                          int pageViewIndex) =>
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 200,
                        margin: EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            image: NetworkImage(newsanalysis.bannerFetch!
                                .elementAt(itemIndex)
                                .bannerImage
                                .toString()),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                  options: CarouselOptions(
                    height: 200.0,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    aspectRatio: 16 / 9,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    scrollDirection: Axis.horizontal,
                    enlargeFactor: 0.4,
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    viewportFraction:
                        1, //to set image full screen width and height
                  ))),
          ExamInfoDesign(),
          SizedBox(height: 10),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                Strings.trendinstest,
                style: TextStyle(
                    color: HexColor(Colored.bluebg2),
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
          ),
          SizedBox(height: 10),
          SizedBox(
            height: 160,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: newsanalysis.trendingTest?.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 150,
                      width: 160,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.black.withOpacity(0.5)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 100,
                            width: 100,
                            child: Stack(
                              children: [
                                Image.asset(
                                  "assets/image/changes_circle.png",
                                  height: 100,
                                  width: 100,
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Image.network(
                                    newsanalysis.trendingTest!
                                        .elementAt(index)
                                        .subCategoryImage
                                        .toString(),
                                    height: 55,
                                    width: 55,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 4, right: 4),
                            child: Text(
                              newsanalysis.trendingTest!
                                  .elementAt(index)
                                  .subCategoryName
                                  .toString(),
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Image.asset(
                  "assets/image/infoblue.png",
                  width: 20,
                  height: 20,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      Strings.currentaffairs,
                      style: TextStyle(
                          color: HexColor(Colored.bluebg2),
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    newsanalysis.currentAffairs!
                        .elementAt(0)
                        .postTitle
                        .toString(),
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  newsanalysis.currentAffairs!
                      .elementAt(0)
                      .metaValue!
                      .elementAt(0)
                      .toString(),
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
                SizedBox(height: 10),
                Text(
                  newsanalysis.currentAffairs!
                      .elementAt(0)
                      .metaValue!
                      .elementAt(1)
                      .toString(),
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(HexColor(Colored.bluebg2)),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      padding: MaterialStateProperty.all(
                          const EdgeInsets.only(left: 50, right: 50))),
                  child: Text(Strings.latestcurrentaffairs),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 150,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          '${newsanalysis.planBanner?.elementAt(0).bannerImage}'),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(10)),
            ),
          )
        ],
      ),
    );
  }

  /* homeone() async {
    final nowdate = DateFormat('yyyy/dd/MM').format(DateTime.now());
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? userid = prefs.getString('user_id');

    var map = <String, dynamic>{};
    map['posted_date'] = nowdate;
    map['user_id'] = userid;
    map['student_id'] = userid;
    final client = ApiClient();
    http.Response response = await client.homeapione(map);

    //data = jsonDecode(response.body);
    String jsonsDataString = response.body.toString().replaceAll("\n", "");
    HomeOneResponse res = HomeOneResponse.fromJson(jsonDecode(jsonsDataString));

    setState(() {});
  } */
  Container _hometwoview(NewsAnalysis2 newsanalysis) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 250,
            child: ListView.builder(
                primary: false,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                //itemCount: newsanalysis.jobAlert?.length,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '${newsanalysis.jobAlert!.elementAt(index).jobTitle}${"-Apply"}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: SizedBox(
                              width: 100,
                              height: 30,
                              child: Row(children: [
                                Image.asset(
                                  "assets/image/share.png",
                                  width: 20,
                                  height: 20,
                                ),
                                SizedBox(width: 5),
                                Text(Strings.share)
                              ]),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: SizedBox(
                              width: 100,
                              height: 30,
                              child: Row(children: [
                                Image.asset(
                                  "assets/image/bookmark.png",
                                  width: 20,
                                  height: 20,
                                ),
                                SizedBox(width: 5),
                                Text(Strings.bookmark)
                              ]),
                            ),
                          )
                        ],
                      )
                    ],
                  );
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                      image: NetworkImage('${newsanalysis.salesApi?.image}'),
                      fit: BoxFit.cover)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '${newsanalysis.salesApi?.title1}',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                    SizedBox(height: 10),
                    Text('${newsanalysis.salesApi?.title2}',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15)),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Image.asset(
                          "assets/image/whatsappwhite.png",
                          width: 20,
                          height: 20,
                        ),
                        SizedBox(width: 5),
                        Text(
                          '${newsanalysis.salesApi?.whatsapp}',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                        SizedBox(width: 10),
                        Image.asset(
                          "assets/image/whatsapp.png",
                          width: 20,
                          height: 20,
                        ),
                        SizedBox(width: 5),
                        Text(
                          '${newsanalysis.salesApi?.call}',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Image.asset(
                  "assets/image/calendar.png",
                  width: 20,
                  height: 20,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      Strings.dailydose,
                      style: TextStyle(
                          color: HexColor(Colored.bluebg2),
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                )
              ],
            ),
          ),
          DailyDose(newsanalysis: newsanalysis),
          SizedBox(
            height: 10,
          ),
          PopularCourse(newsanalysis: newsanalysis),
          SizedBox(
            height: 10,
          ),
          StudentZone(),
          Youtubevideo(newsanalysis: newsanalysis),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      Strings.allposts,
                      style: TextStyle(
                          color: HexColor(Colored.bluebg2),
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      Strings.viewall,
                      style: TextStyle(
                          color: HexColor(Colored.bluebg2),
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    primary: false,
                    itemCount: newsanalysis.dailyPost?.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/image/placeholder.png",
                                    width: 30,
                                    height: 30,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Avision Admin",
                                          style: TextStyle(fontSize: 15),
                                        ),
                                        Text(
                                          '${newsanalysis.dailyPost?.elementAt(index).postCategory} Daily post from avision',
                                          style: TextStyle(fontSize: 15),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                '${newsanalysis.dailyPost?.elementAt(index).postTitle}',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                              Image.network(
                                  '${newsanalysis.dailyPost?.elementAt(index).postImage}'),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.asset(
                                    "assets/image/like.png",
                                    width: 25,
                                    height: 25,
                                  ),
                                  Image.asset(
                                    "assets/image/comment.png",
                                    width: 25,
                                    height: 25,
                                  ),
                                  Image.asset(
                                    "assets/image/share.png",
                                    width: 25,
                                    height: 25,
                                  ),
                                  Text(
                                      '${newsanalysis.dailyPost?.elementAt(index).likeCount} Like'),
                                  Text(
                                      '${newsanalysis.dailyPost?.elementAt(index).commentCount} Comment')
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    })
              ],
            ),
          ),
        ],
      ),
    );
  }
}

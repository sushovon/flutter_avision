import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../common/apiclient.dart';
import '../res/colored.dart';
import '../response/topicquiz/questionlist.dart';
import '../response/topicquiz/topicquizresponse.dart';
import 'package:http/http.dart' as http;

class TopicWiseQuizPage extends StatefulWidget {
  const TopicWiseQuizPage({super.key});

  @override
  State<TopicWiseQuizPage> createState() => _TopicWiseQuizPageState();
}

class _TopicWiseQuizPageState extends State<TopicWiseQuizPage> {
  dynamic typeid;
  dynamic childtypeid;
  @override
  Widget build(BuildContext context) {
    Map data = {};
    data = ModalRoute.of(context)?.settings.arguments as Map;
    typeid = data['typeid'];
    childtypeid = data['child_type_id'];

    return Scaffold(
        appBar: AppBar(
          title: Text("Topic wise quiz"),
          backgroundColor: HexColor(Colored.buttonbluebg),
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hi \n Practice everyday to keep improving!',
                  style: TextStyle(fontSize: 15),
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: const [Text('TOPIC OF THE DAY \n Constitution')],
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  child: FutureBuilder<TopicQuizResponse>(
                    future: fetchquiz(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        TopicQuizResponse? data = snapshot.data;
                        List<QuestionList>? questionList = data?.questionList;
                        return _quizListView(questionList!);
                      } else if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      }
                      return SizedBox(
                          height: MediaQuery.of(context).size.height / 1.3,
                          child: Center(child: CircularProgressIndicator()));
                      /* return Center(
                        heightFactor: 12,
                        child: CircularProgressIndicator(),
                      ); */
                    },
                  ),
                )
              ],
            ),
          ),
        ));
  }

  Future<TopicQuizResponse> fetchquiz() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? userid = prefs.getString('user_id');

    var map = <String, dynamic>{};
    map['student_id'] = userid;
    map['child_type_id'] = childtypeid;
    map['type_id'] = typeid;
    final client = ApiClient();
    http.Response response = await client.topicwisequizdetails(map);

    String jsonsDataString = response.body.toString().replaceAll("\n", "");
    TopicQuizResponse res =
        TopicQuizResponse.fromJson(jsonDecode(jsonsDataString));

    return res;
  }

  _quizListView(List<QuestionList> scheduleList) {
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemExtent: 120.0,
        itemCount: scheduleList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: _tile(
              scheduleList.elementAt(index).quizName.toString(),
              scheduleList.elementAt(index).totQus.toString(),
              scheduleList.elementAt(index).totTime.toString(),
              index,
            ),
          );
        });
  }

  Container _tile(
          String? name, String? totalques, String? totaltime, int index) =>
      Container(
        color: getColor(index),
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    color: getColor1(index),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Center(
                  child: Text(
                    name.toString().substring(0, 1),
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /* Text(
                    name.toString().length > 36
                        ? '${name.toString().substring(0, 36)}...'
                        : name.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                  ), */
                  Text(
                    name.toString().length > 35
                        ? '${name.toString().substring(0, 35)}\n ${name.toString().substring(35, name.toString().length)}'
                        : name.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      '${totalques.toString()} Ques | ${totaltime.toString()} mins')
                ],
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 5),
              child: RichText(
                text: TextSpan(
                  children: const [
                    /* TextSpan(
                        text: "Attempt",
                        style: TextStyle(color: Colors.black)), */
                    WidgetSpan(
                      child: Icon(Icons.arrow_forward, size: 14),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      );
  Color getColor(int selector) {
    if (selector % 5 == 1) {
      return HexColor('#F8E0E6');
    } else if (selector % 5 == 2) {
      return HexColor('#E0F2F7');
    } else if (selector % 5 == 3) {
      return HexColor('#F2E0F7');
    } else if (selector % 5 == 4) {
      return HexColor('#ECF8E0');
    } else if (selector % 5 == 0) {
      return HexColor('#F8ECE0');
    } else {
      return Colors.blueGrey;
    }
  }

  Color getColor1(int selector) {
    if (selector % 5 == 1) {
      return Color.fromRGBO(168, 50, 80, 100);
    } else if (selector % 5 == 2) {
      return Color.fromRGBO(71, 133, 166, 100);
    } else if (selector % 5 == 3) {
      return Color.fromRGBO(116, 56, 130, 100);
    } else if (selector % 5 == 4) {
      return Color.fromRGBO(179, 176, 37, 100);
    } else if (selector % 5 == 0) {
      return Color.fromRGBO(194, 91, 79, 100);
    } else {
      return Color.fromRGBO(168, 50, 80, 100);
    }
  }
}

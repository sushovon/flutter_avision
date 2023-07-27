import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_avision/res/strings.dart';
import 'package:flutter_avision/utils/routes.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../common/apiclient.dart';
import '../res/colored.dart';
import '../response/quiz/ScheduleList.dart';
import '../response/quiz/quizresponse.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz page"),
        backgroundColor: HexColor(Colored.buttonbluebg),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: FutureBuilder<QuizResponse>(
          future: fetchquiz(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              QuizResponse? data = snapshot.data;
              List<ScheduleList>? scheduleList = data?.scheduleList;
              return _quizListView(scheduleList!);
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return Container(
                alignment: Alignment.center,
                child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  Future<QuizResponse> fetchquiz() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? userid = prefs.getString('user_id');

    var map = <String, dynamic>{};
    map['student_id'] = userid;
    final client = ApiClient();
    http.Response response = await client.quiztopic(map);

    String jsonsDataString = response.body.toString().replaceAll("\n", "");
    QuizResponse res = QuizResponse.fromJson(jsonDecode(jsonsDataString));

    return res;
  }

  _quizListView(List<ScheduleList> scheduleList) {
    return Expanded(
      child: ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemExtent: 60.0,
          itemCount: scheduleList.length,
          itemBuilder: (context, index) {
            return _tile(
              scheduleList.elementAt(index).name.toString(),
              scheduleList.elementAt(index).noQuiz.toString(),
              scheduleList.elementAt(index).typeId.toString(),
              scheduleList.elementAt(index).childTypeId.toString(),
            );
          }),
    );
  }

  ListTile _tile(String? name, String? nofoquiz, String? typeid,
          String? child_type_id) =>
      ListTile(
        dense: true,
        contentPadding: EdgeInsets.only(left: 15, right: 15),
        title: Text(
          name.toString().toUpperCase(),
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        subtitle: Text(
          Strings.totaltest + nofoquiz.toString(),
          style: TextStyle(fontSize: 15),
        ),
        trailing: Icon(Icons.arrow_right),
        onTap: () {
          Navigator.pushNamed(context, MyRoute.topicwisequizRoute,
              arguments: {'typeid': typeid, 'child_type_id': child_type_id});
        },
      );
}

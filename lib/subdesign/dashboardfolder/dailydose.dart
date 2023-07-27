import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../res/colored.dart';
import '../../response/hometwo/newsanalysis2.dart';

// ignore: must_be_immutable
class DailyDose extends StatefulWidget {
  //const DailyDose({super.key});
  NewsAnalysis2 newsanalysis;
  DailyDose({super.key, required this.newsanalysis});
  @override
  State<DailyDose> createState() => _DailyDoseState();
}

class _DailyDoseState extends State<DailyDose> {
  late NewsAnalysis2 newsanalysis;

  @override
  void initState() {
    super.initState();
    setState(() {
      newsanalysis = widget.newsanalysis;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: newsanalysis.randamFetchQuiz?.quizArr?.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  width: 300,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: (Column(
                      children: [
                        Text(
                          '${newsanalysis.randamFetchQuiz?.quizArr?.elementAt(index).quizName}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'State Exams Daily Dose',
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(height: 10),
                        Spacer(),
                        Row(
                          children: [
                            Flexible(
                                flex: 2,
                                fit: FlexFit.tight,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '10 Minutes/${newsanalysis.randamFetchQuiz?.quizArr?.elementAt(index).totalQuestion} Marks',
                                      style: TextStyle(
                                          color: HexColor(Colored.bluebg2),
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      'English /bengali /Hindi',
                                      style: TextStyle(
                                          color: HexColor(Colored.bluebg2),
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                )),
                            Flexible(
                                flex: 1,
                                fit: FlexFit.tight,
                                child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0)),
                                        backgroundColor:
                                            HexColor(Colored.bluebg2)),
                                    child: Text(
                                      "Start Quiz",
                                      style: TextStyle(fontSize: 13),
                                      textAlign: TextAlign.center,
                                    )))
                          ],
                        )
                      ],
                    )),
                  ),
                ),
              );
            }),
      ),
    );
  }
}

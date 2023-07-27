import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../res/colored.dart';

class ExamInfoDesign extends StatelessWidget {
  const ExamInfoDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
            fit: FlexFit.tight,
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(left: 8, right: 4),
              child: Container(
                decoration: BoxDecoration(
                  color: HexColor(Colored.yellow),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Image.asset("assets/image/info.png",
                          width: 50, height: 50),
                      Text(
                        "Exam info",
                        style: TextStyle(color: HexColor(Colored.bluebg2)),
                      )
                    ],
                  ),
                ),
              ),
            )),
        Flexible(
            fit: FlexFit.tight,
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(left: 4, right: 4),
              child: Container(
                decoration: BoxDecoration(
                  color: HexColor(Colored.yellow),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Image.asset("assets/image/book.png",
                          width: 50, height: 50),
                      Text(
                        "Study",
                        style: TextStyle(color: HexColor(Colored.bluebg2)),
                      )
                    ],
                  ),
                ),
              ),
            )),
        Flexible(
            fit: FlexFit.tight,
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(left: 4, right: 8),
              child: Container(
                decoration: BoxDecoration(
                  color: HexColor(Colored.yellow),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Image.asset("assets/image/changes_practice.png",
                          width: 50, height: 50),
                      Text(
                        "Practice",
                        style: TextStyle(color: HexColor(Colored.bluebg2)),
                      )
                    ],
                  ),
                ),
              ),
            ))
      ],
    );
  }
}

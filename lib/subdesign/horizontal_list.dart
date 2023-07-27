import 'package:flutter/material.dart';
import 'package:flutter_avision/utils/routes.dart';
import 'package:hexcolor/hexcolor.dart';

import '../res/colored.dart';
import '../res/strings.dart';

class HorizontalListPage extends StatelessWidget {
  const HorizontalListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 95,
      color: HexColor(Colored.buttonbluebg),
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: 1,
          itemBuilder: (context, index) {
            return Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment:
                        MainAxisAlignment.center, //center horizontal
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: HexColor(Colored.white)),
                        child: Center(
                          child: Image.asset(
                            "assets/image/free_test.png",
                            height: 45,
                            width: 45,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Text(
                        Strings.freetest,
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, MyRoute.quizRoute);
                    },
                    child: Column(
                      mainAxisAlignment:
                          MainAxisAlignment.center, //center horizontal
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: HexColor(Colored.white)),
                          child: Center(
                            child: Image.asset(
                              "assets/image/topic_test.png",
                              height: 45,
                              width: 45,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Text(
                          Strings.quiz,
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment:
                        MainAxisAlignment.center, //center horizontal
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: HexColor(Colored.white)),
                        child: Center(
                          child: Image.asset(
                            "assets/image/gk_ca.png",
                            height: 45,
                            width: 45,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Text(
                        Strings.gkca,
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment:
                        MainAxisAlignment.center, //center horizontal
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: HexColor(Colored.white)),
                        child: Center(
                          child: Image.asset(
                            "assets/image/videos.png",
                            height: 45,
                            width: 45,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Text(
                        Strings.video,
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment:
                        MainAxisAlignment.center, //center horizontal
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: HexColor(Colored.white)),
                        child: Center(
                          child: Image.asset(
                            "assets/image/news.png",
                            height: 35,
                            width: 35,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Text(
                        Strings.newsarticle,
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment:
                        MainAxisAlignment.center, //center horizontal
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: HexColor(Colored.white)),
                        child: Center(
                          child: Image.asset(
                            "assets/image/group.png",
                            height: 35,
                            width: 35,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Text(
                        Strings.doubts,
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
              ],
            );
          }),
    );
  }
}

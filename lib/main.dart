import 'package:flutter/material.dart';
import 'package:flutter_avision/pages/dashboard.dart';
import 'package:flutter_avision/pages/login.dart';
import 'package:flutter_avision/pages/quiz.dart';
import 'package:flutter_avision/pages/splash.dart';
import 'package:flutter_avision/pages/topicwisequiz.dart';
import 'package:flutter_avision/utils/routes.dart';

void main() {
  runApp(MaterialApp(
    title: "AVISION",
    debugShowCheckedModeBanner: false,
    initialRoute: "/splash",
    routes: {
      "/": (context) => SplashPage(),
      MyRoute.splashRoute: (context) => SplashPage(),
      MyRoute.loginRoute: (context) => LoginPage(),
      MyRoute.dashboardRoute: (context) => DashboardPage(),
      MyRoute.quizRoute: (context) => QuizPage(),
      MyRoute.topicwisequizRoute: (context) => TopicWiseQuizPage()
    },
  ));
}

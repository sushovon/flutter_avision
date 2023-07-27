import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_avision/common/apiclient.dart';
import 'package:flutter_avision/res/inter.dart';
import 'package:flutter_avision/res/strings.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';

import '../res/colored.dart';
import '../response/loginres.dart';
import '../response/loginresponse.dart';
import '../restclient.dart';
import '../utils/routes.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  late ProgressDialog pd;
  //Map<String, dynamic> data = <String, dynamic>{};
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    pd = ProgressDialog(context: context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Image.asset("assets/image/avision.png",
                        fit: BoxFit.fill, width: 150, height: 89),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      Strings.haveanaccount,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Form(
                      key: _formkey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: emailcontroller,
                            decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: HexColor(Colored.bluebg2))),
                                fillColor: Colors.white,
                                filled: true,
                                hintText: Strings.loginemailhint),
                            validator: (value) {
                              if (value != null && value.isEmpty) {
                                return "email/phone cannot be blank";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            obscureText: true,
                            controller: passwordcontroller,
                            decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: HexColor(Colored.bluebg2))),
                                fillColor: Colors.white,
                                filled: true,
                                hintText: Strings.password),
                            validator: (value) {
                              if (value != null && value.isEmpty) {
                                return "password cannot be blank";
                              }
                              if (value != null && value.length < 6) {
                                return "password length cannot be less than 6";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 10),
                          Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              Strings.forgotpassword,
                              style: TextStyle(
                                color: HexColor(Colored.bluebg2),
                                fontSize: 15,
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          InkWell(
                            onTap: () {
                              var useremail = emailcontroller.text;
                              var password = passwordcontroller.text;

                              if (_formkey.currentState!.validate()) {
                                pd.show(max: 100, msg: 'Please wait...');
                                login(useremail, password);
                              }
                            },
                            child: Container(
                              width: 150,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: HexColor(Colored.buttonbluebg)),
                              child: Center(
                                child: Text(
                                  Strings.login,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              Strings.newuserregisternow,
                              style: TextStyle(
                                  color: HexColor(Colored.bluebg2),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(height: 50),
                          Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 1,
                                  color: HexColor(Colored.bluebg2),
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  color: Colors.white,
                                  width: 220,
                                  child: Center(
                                    child: Text(
                                      Strings.useothermethods,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 50),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset("assets/image/facebook.png",
                                  fit: BoxFit.fill, width: 50, height: 50),
                              SizedBox(width: 15),
                              Image.asset("assets/image/google_plus.png",
                                  fit: BoxFit.fill, width: 50, height: 50)
                            ],
                          ),
                        ],
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  login(var email, var password) async {
    var map = <String, dynamic>{};
    map['user_email'] = email;
    map['user_password'] = password;
    final client = ApiClient();
    http.Response response = await client.createUser(map);

    //data = jsonDecode(response.body);
    String jsonsDataString = response.body.toString().replaceAll("\n", "");
    LoginRes res = LoginRes.fromJson(jsonDecode(jsonsDataString));

    if (res.statusCode == "200") {
      pd.close();

      await Future.delayed(Duration(seconds: 0)); //navigate after 1 seconds
      if (context.mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(res.message!)));

        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setInt('login', 1);
        await prefs.setString('user_id', res.userId!);
        await prefs.setString('username', res.userName!);
        await prefs.setString('user_mobile', res.userPhone!);
        await prefs.setString('user_email', res.userEmail!);
        await prefs.setString('user_pic', res.userImg!);
        await prefs.setString('user_role', res.userRole!);

        if (context.mounted) {
          Navigator.of(context).pushNamedAndRemoveUntil(
              MyRoute.dashboardRoute, (Route<dynamic> route) => false);
        }
      }
    } else {
      pd.close();
      if (context.mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Request failed')));
      }
    }
    setState(() {});
  }

  /* Future<LoginResponse> login(var email, var password) async {
    Dio dio = Dio();
    dio.interceptors.add(AppInterceptors());
    final client = RestClient(Dio());
    var map = <String, dynamic>{};
    map['user_email'] = email;
    map['user_password'] = password;
    /* try {} catch (e) {
      print(e);
    } */

    var data = await client.getLogin(map);
    print("here");
    if (data.statusCode == "200") {
      pd.close();

      await Future.delayed(Duration(seconds: 0)); //navigate after 1 seconds
      if (context.mounted) {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setInt('login', 1);
        await prefs.setString('user_id', data.userId!);
        await prefs.setString('username', data.userName!);
        await prefs.setString('user_mobile', data.userPhone!);
        await prefs.setString('user_email', data.userEmail!);
        await prefs.setString('user_pic', data.userImg!);
        await prefs.setString('user_role', data.userRole!);

        if (context.mounted) {
          Navigator.of(context).pushNamedAndRemoveUntil(
              MyRoute.dashboardRoute, (Route<dynamic> route) => false);
        }
        //Navigator.pushNamed(context, MyRoute.dashboardRoute);
      }
      //Navigator.pushNamed(context, "/dashboard");
    } else {
      pd.close();
      if (context.mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Request failed')));
      }
    }
    return data;
  } */
}

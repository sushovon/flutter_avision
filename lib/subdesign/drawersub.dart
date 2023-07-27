import 'package:flutter/material.dart';
import 'package:flutter_avision/res/colored.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerSubPage extends StatefulWidget {
  const DrawerSubPage({super.key});

  @override
  State<DrawerSubPage> createState() => _DrawerSubPageState();
}

class _DrawerSubPageState extends State<DrawerSubPage> {
  String _name = "";
  String _email = "";
  String _image = "";
  bool isimage = false;

  _DrawerSubPageState() {
    getNameFromFile().then((val) => setState(() {
          _name = val;
        }));

    getEmailFrom().then((val) => setState(() {
          _email = val;
        }));

    getImageFrom().then((val) => setState(() {
          _image = val;
          if (_image.isEmpty) {
            isimage = false;
          } else {
            isimage = true;
          }
        }));
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(_name),
            accountEmail: Text(_email),
            //currentAccountPicture:Image.network("https://unsplash.com/photos/WNoLnJo7tS8"),getting error
            currentAccountPicture: CircleAvatar(
                backgroundImage: isimage == true
                    ? NetworkImage(
                        "http://www.rd.com/wp-content/uploads/2017/09/01-shutterstock_476340928-Irina-Bg-1024x683.jpg",
                      )
                    : NetworkImage(
                        "http://www.rd.com/wp-content/uploads/2017/09/01-shutterstock_476340928-Irina-Bg-1024x683.jpg")),
            decoration: BoxDecoration(color: HexColor(Colored.buttonbluebg)),
          ),
          ListTile(
              leading: Image.asset(
                "assets/image/notes.png",
                height: 30,
                width: 30,
              ),
              title: Text("Change Exam"),
              onTap: () {
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Your are on the dashboard page")));
                }
              }),
          ListTile(
              leading: Image.asset(
                "assets/image/language.png",
                height: 30,
                width: 30,
              ),
              title: Text("Change Language"),
              onTap: () {}),
          ListTile(
              leading: Image.asset(
                "assets/image/buynow.png",
                height: 30,
                width: 30,
              ),
              title: Text("Buy Plan"),
              onTap: () {}),
          ListTile(
              leading: Image.asset(
                "assets/image/shoppingbag.png",
                height: 30,
                width: 30,
              ),
              title: Text("My Purchases"),
              onTap: () {}),
          ListTile(
              leading: Image.asset(
                "assets/image/books.png",
                height: 30,
                width: 30,
              ),
              title: Text("Buy Study Materials"),
              onTap: () {}),
          ListTile(
              leading: Image.asset(
                "assets/image/corporate.png",
                height: 30,
                width: 30,
              ),
              title: Text("Center"),
              onTap: () {}),
          ListTile(
              leading: Image.asset(
                "assets/image/update.png",
                height: 30,
                width: 30,
              ),
              title: Text("Center"),
              onTap: () {}),
          ListTile(
              leading: Image.asset(
                "assets/image/lightbulb.png",
                height: 30,
                width: 30,
              ),
              title: Text("About Us"),
              onTap: () {}),
          ListTile(
              leading: Image.asset(
                "assets/image/week.png",
                height: 30,
                width: 30,
              ),
              title: Text("Weekly Updates"),
              onTap: () {}),
          ListTile(
              leading: Image.asset(
                "assets/image/clock.png",
                height: 30,
                width: 30,
              ),
              title: Text("Class Schedule"),
              onTap: () {}),
          ListTile(
              leading: Image.asset(
                "assets/image/star.png",
                height: 30,
                width: 30,
              ),
              title: Text("Rate Us"),
              onTap: () {}),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Connect With Us"),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 8),
            child: Row(
              children: [
                Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Image.asset(
                      "assets/image/facebook.png",
                      width: 30,
                      height: 30,
                    )),
                Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Image.asset(
                      "assets/image/youtube.png",
                      width: 30,
                      height: 30,
                    )),
                Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Image.asset(
                      "assets/image/instagram.png",
                      width: 30,
                      height: 30,
                    )),
                Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Image.asset(
                      "assets/image/twitter.png",
                      width: 30,
                      height: 30,
                    )),
                Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Image.asset(
                      "assets/image/linkedin.png",
                      width: 30,
                      height: 30,
                    )),
              ],
            ),
          ),
          ListTile(
              leading: Image.asset(
                "assets/image/logout.png",
                height: 30,
                width: 30,
              ),
              title: Text("Logout"),
              onTap: () {}),
        ],
      ),
    );
  }

  Future<String> getNameData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? stringValue = prefs.getString("username");
    return stringValue.toString();
  }

  Future<String> getNameFromFile() async {
    return await getNameData();
  }

  Future<String> getEmailData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? stringValue = prefs.getString("user_email");
    return stringValue.toString();
  }

  Future<String> getEmailFrom() async {
    return await getEmailData();
  }

  Future<String> getImageData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? stringValue = prefs.getString("user_pic");
    return stringValue.toString();
  }

  Future<String> getImageFrom() async {
    return await getImageData();
  }
}

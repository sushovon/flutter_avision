import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../res/colored.dart';
import '../../res/strings.dart';

class StudentZone extends StatelessWidget {
  const StudentZone({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 500,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              Strings.studentzone,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 450,
              child: GridView.builder(
                  primary: false,
                  itemCount: 9,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 0,
                      mainAxisSpacing: 0,
                      mainAxisExtent: 150),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: HexColor(Colored.colors.elementAt(index))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              Strings.imagelist.elementAt(index),
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              Strings.textlist.elementAt(index),
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}

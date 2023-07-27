import 'package:flutter/material.dart';

import '../../res/strings.dart';
import '../../response/hometwo/newsanalysis2.dart';

// ignore: must_be_immutable
class PopularCourse extends StatefulWidget {
  NewsAnalysis2 newsanalysis;
  PopularCourse({super.key, required this.newsanalysis});

  @override
  State<PopularCourse> createState() => _PopularCourseState();
}

class _PopularCourseState extends State<PopularCourse> {
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 220,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              Strings.popularcourses,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 180,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: newsanalysis.popularCourseApi?.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 8, right: 4),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          '${newsanalysis.popularCourseApi!.elementAt(index).productImage}',
                          fit: BoxFit.cover,
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

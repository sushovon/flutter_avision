import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../response/hometwo/newsanalysis2.dart';

class Youtubevideo extends StatefulWidget {
  NewsAnalysis2 newsanalysis;
  Youtubevideo({super.key, required this.newsanalysis});

  @override
  State<Youtubevideo> createState() => _YoutubevideoState();
}

class _YoutubevideoState extends State<Youtubevideo> {
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
    return Container(
      height: 200,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            physics: AlwaysScrollableScrollPhysics(),
            itemCount: newsanalysis.youtubeVideo?.length,
            itemBuilder: ((context, index) {
              YoutubePlayerController _controller = YoutubePlayerController(
                  initialVideoId:
                      '${newsanalysis.youtubeVideo?.elementAt(index).viewCode}',
                  flags: YoutubePlayerFlags(
                      autoPlay: false, mute: true, disableDragSeek: true));
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: YoutubePlayerBuilder(
                  player: YoutubePlayer(
                    controller: _controller,
                    showVideoProgressIndicator: true,
                    progressIndicatorColor: Colors.amber,
                    progressColors: ProgressBarColors(
                      playedColor: Colors.amber,
                      handleColor: Colors.amberAccent,
                    ),
                    onReady: () {
                      _controller.addListener(() {});
                      _controller.load(
                          '${newsanalysis.youtubeVideo?.elementAt(index).viewCode}');
                    },
                  ),
                  builder: (context, player) => player,
                ),
              );
            })),
      ),
    );
  }
}

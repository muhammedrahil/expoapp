import 'package:expo/Screen/post_details.dart';
import 'package:expo/model/post.dart';
import 'package:expo/widgets/post_cell.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatefulWidget {
  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  final data = [
    Post(
      image:
          'https://cdn.pixabay.com/photo/2013/04/07/21/29/arc-de-triomphe-101633_960_720.jpg',
      title: 'Finding your ikigai in your middle age',
      author: 'John Johny',
      date: '25 Mar 2020',
    ),
    Post(
      image:
          'https://cdn.pixabay.com/photo/2013/04/07/21/29/arc-de-triomphe-101633_960_720.jpg',
      title: 'How to Lead Before You Are in Charge',
      author: 'John Johny',
      date: '24 Mar 2020',
    ),
    Post(
      image:
          'https://cdn.pixabay.com/photo/2013/04/07/21/29/arc-de-triomphe-101633_960_720.jpg',
      title: 'How Minimalism Brought Me',
      author: 'John Johny',
      date: '15 Mar 2020',
    ),
    Post(
      image:
          'https://cdn.pixabay.com/photo/2013/04/07/21/29/arc-de-triomphe-101633_960_720.jpg',
      title: 'The Most Important Color In UI Design',
      author: 'John Johny',
      date: '11 Mar 2020',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            videoContainer(),
            title,
            subTitle,
            suggetionHead,
            suggestionList(),
          ],
        ),
      ),
      floatingActionButton: flottingActionButton(),
    );
  }

  Widget videoContainer() => AspectRatio(
        aspectRatio: _controller.value.aspectRatio,
        child: Container(
          margin: EdgeInsets.all(0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            clipBehavior: Clip.hardEdge,
            child: VideoPlayer(_controller),
            decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(100)),
                gradient: LinearGradient(begin: Alignment.bottomRight, stops: [
                  0.1,
                  0.9
                ], colors: [
                  Colors.black.withOpacity(.8),
                  Colors.black.withOpacity(.1)
                ])),
          ),
        ),
      );

  var title = Text('Video Title Here');
  var subTitle = Text('this is a sample description of this video');
  Widget videoSuggestions() => Expanded(
          child: Container(
        color: Colors.cyan,
      ));

  Widget flottingActionButton() => Align(
        alignment: Alignment.bottomCenter,
        child: FloatingActionButton(
          onPressed: () {
            setState(() {
              _controller.value.isPlaying
                  ? _controller.pause()
                  : _controller.play();
            });
          },
          child: Icon(
            _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
          ),
        ),
      );

  Widget suggetionHead = Text(
    'Your daily read',
    style: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 18,
    ),
    textAlign: TextAlign.left,
  );

  Widget suggestionList() => ListView.separated(
        shrinkWrap: true,
        itemCount: data.length,
        itemBuilder: (context, index) {
          final post = data[index];
          return PostCell(
              title: post.title,
              image: post.image,
              author: post.author,
              date: post.date,
              onClick: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => PostDetailsPage(
                      title: post.title,
                      image: post.image,
                      author: post.author,
                      date: post.date,
                    ),
                  ),
                );
              });
        },
        separatorBuilder: (context, index) => Divider(),
      );

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}

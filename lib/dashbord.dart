import 'package:expo/drower.dart';
import 'package:flutter/material.dart';
import './drower.dart';

Widget lists(
    {required String imagepath,
    required String titletext,
    required String subtitleText,
    required void Function() listPressed}) {
  return ListTile(
    onTap: listPressed,
    leading: CircleAvatar(
      radius: 30,
      backgroundImage: AssetImage(imagepath),
    ),
    title: Text(titletext),
    subtitle: Text(subtitleText),
  );
}

Widget divider() {
  return Divider(
    thickness: 1,
    color: Colors.blueGrey.shade200,
  );
}

class Dash extends StatelessWidget {
  const Dash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drower(),
      appBar: AppBar(
        title: Text('Content Part'),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            lists(
                imagepath: "assets/b.jpg",
                titletext: 'hello',
                subtitleText: 'bbbb',
                listPressed: () {
                  print('gfgdf');
                }),
            divider(),
             lists(
                imagepath: "assets/b.jpg",
                titletext: 'hello',
                subtitleText: 'bbbb',
                listPressed: () {
                  print('gfgdf');
                }),
            divider(),
             lists(
                imagepath: "assets/b.jpg",
                titletext: 'hello',
                subtitleText: 'bbbb',
                listPressed: () {
                  print('gfgdf');
                }),
            divider(),
             lists(
                imagepath: "assets/b.jpg",
                titletext: 'hello',
                subtitleText: 'bbbb',
                listPressed: () {
                  print('gfgdf');
                }),
            divider(),
          ],
        ),
      ),
    );
  }
}

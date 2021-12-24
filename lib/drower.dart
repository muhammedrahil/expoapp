import 'package:flutter/material.dart';
import './dashbord.dart';

class drower extends StatelessWidget {
  const drower({Key? key}) : super(key: key);

  Widget buildManuItem(
      {required String text,
      required iconData,
      required void Function() drowertouch}) {
    final color = Colors.white;

    return ListTile(
      leading: Icon(
        iconData,
        color: color,
      ),
      title: Text(
        text,
        style: TextStyle(color: color),
      ),
      hoverColor: Colors.white,
      onTap: drowertouch,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
      color: Colors.blue,
      child: ListView(
        children: [
          SizedBox(height: 48),
          divider(),
          buildManuItem(
              text: 'hello',
              iconData: Icons.home,
              drowertouch: () {
                print('bbbb');
              }),
          divider(),
        ],
      ),
    ));
  }
}

import 'package:expo/Screen/costemTab.dart';
import 'package:flutter/material.dart';
import './bookStaggedGridView.dart';


class homee extends StatefulWidget {
  @override
  State<homee> createState() => _homeeState();
}

class _homeeState extends State<homee> {
  var tabindex = 0;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: _appBar(),
        body: Column(
          children: [
            custemTab(
              select: tabindex,
              callback: (int index) {
                setState(() {
                  tabindex=index;
                });
                if(PageController().hasClients){
                  PageController().jumpToPage(index);
                }
                
              },
            ),
            Expanded(child: bookStaggedGridView(
              tabindex,
              PageController(),
              (int index) =>setState((){
                tabindex =index;
              }),
            ))
          ],
        ));
  }
}

AppBar _appBar() {
  return AppBar(
    backgroundColor: Colors.blue,
    elevation: 0,
    leading: IconButton(
      onPressed: () {},
      icon: Icon(
        Icons.menu_rounded,
        color: Colors.blue.shade900,
      ),
    ),
    title: Text(
      '1921',
      style: TextStyle(fontSize: 18, color: Colors.blue.shade900),
    ),
    centerTitle: true,
  );
}

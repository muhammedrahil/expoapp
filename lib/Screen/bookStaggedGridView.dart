import 'package:flutter/material.dart';
import '../model/book.dart';

class bookStaggedGridView extends StatelessWidget {
  final int selected;
  final PageController pageController;
  final Function callback;
  bookStaggedGridView(this.selected, this.pageController, this.callback,
      {Key? key})
      : super(key: key);
  final bookList = book.generateBooks();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child:PageView(
        controller:pageController ,
        onPageChanged: (index)=>callback(index),
        children: [
          Text('Ebook'),
          Text('aoudiobook'), 
        ],
      ));
  }
}

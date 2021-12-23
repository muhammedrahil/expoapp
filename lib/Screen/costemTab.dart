import 'package:flutter/material.dart';

class custemTab extends StatelessWidget {
  final int select;
  final Function  callback;
   custemTab({ Key? key, required this.select, required this.callback }) : super(key: key);
final Tabs=['EBook','AuioBooks'];
  @override
  Widget build(BuildContext context) {
    final width=MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(5)  
      ),
      width: width,
      height: 56,
      child: ListView.separated(
        padding : const  EdgeInsets.symmetric(horizontal: 5),
        scrollDirection: Axis.horizontal ,
        itemBuilder: (con,index)=>GestureDetector(
        onTap: ()=>callback(index),
        child: Container(
          decoration: BoxDecoration(
            color: select == index ? Colors.white: Colors.grey[200],
          ),
         margin: const EdgeInsets.symmetric(vertical: 5),
         width : (width - 40) / 2 - 10,
         alignment: Alignment.center,
         child : Text(Tabs[index],
         style: const TextStyle(
         color: Colors.black,
         fontWeight: FontWeight.w500),
         ),
         
        )

      ),
      separatorBuilder: (_,index) => const SizedBox(width : 10), 
      itemCount: Tabs.length),
    );
  }
}
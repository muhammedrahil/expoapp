import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 230,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(50),
              ),
              color: Colors.blue.shade900,
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 80,
                  left: 0,
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 90),
                      child: Center(
                          child: Text(
                        'MALABAR',
                        style: TextStyle(
                            color: Colors.blue.shade900,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic),
                      )),
                    ),
                    height: 100,
                    width: 300,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(50),
                          bottomRight: Radius.circular(50),
                        )),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: height*0.05,
            
          ),
          Container(
            child: Stack(children: [
              Positioned(child: Material(child: Container(
                height: 180.0,
                
                width: width*0.9,
                decoration: BoxDecoration(
                  color: Colors.white
                  ,borderRadius: BorderRadius.circular(0.0),
                  
                ),
              ),))
            ],),
          )
        ],
      ),
    );
  }
}

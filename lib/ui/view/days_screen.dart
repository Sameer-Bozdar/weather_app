import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/utils/routes/routes_name.dart';

class DaysScreen extends StatefulWidget {
  const DaysScreen({super.key});

  @override
  State<DaysScreen> createState() => _DaysScreenState();
}

class _DaysScreenState extends State<DaysScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.only(left: 22,right: 22,),
          color: Color(0xfff6edff),
          child: Column(
            children: [
              Container(height: 220,),
              Expanded(
                flex: 3,
                  child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Card(
                          color: Color(0xffebdeff),
                            child: Row(
                              children: [
                                Container(
                                  padding : EdgeInsets.only(top:12,bottom: 12,left: 10,right: 10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Today',
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 10,),
                                      Text('Cloud and Sunny'),
                                      ]),
                                ),
          SizedBox(width: 80,),
          Container(
            padding: EdgeInsets.only(top: 5),
            width: 40,
           height: 50,
           child: Stack(children: [
              Column(
                children: [
                  Text('3'),
                  SizedBox(height: 8,),
                  Text('2'),
                ],
              ),

              Positioned(
                top: -1,
                  left: 9,

                  child: Icon(Icons.circle_outlined,size: 8,)),
             Positioned(
                 left: 9,
                 top :23,
                 child: Icon(Icons.circle_outlined,size: 8,))
            ],),


          ),

                                Container(
                                  // Vertical Divider as a Separator
                                  width: 1, // Adjust the width as needed
                                  color: Colors.black54, // Color of the separator
                                  height: 40, // Adjust the height to match the card's height
                                ),
                                SizedBox(width: 7,),
                                Row(children: [
                                  Column(children: [
                                    SvgPicture.asset('assets/cloud.svg',height: 32,)
                                  ],),
                                  Column(children: [
                                    CircleAvatar( backgroundColor:Colors.white, radius:9, child: Center(child: Icon(Icons.arrow_drop_down,color: Colors.black87,size: 15,),),),
                                    Container(height: 29,)
                                  ],)
                                ],)

                              ],
                            ));
                      }))
            ],
          ),
        ),

        // Upper Container
        Container(
            width: double.infinity,
            height: 245,
            decoration: const BoxDecoration(
              color: Color(0xffe1d3fa),
              // borderRadius: BorderRadius.only(
              //     bottomLeft: Radius.circular(20),
              //     bottomRight: Radius.circular(20))),
            ),
            child: Column(children: [
              Container(
                padding: EdgeInsets.only(
                  left: 22,
                  right: 22,
                  top: 57,
                ),
                child: Row(children: [
                  Text('Country',
                      style: TextStyle(
                          color: Colors.black87,
                          decoration: TextDecoration.none,
                          fontSize: 28)),
                  SizedBox(width: 170),
                  GestureDetector(
                      onTap: () {},
                      child: Icon(Icons.search, color: Colors.black87))
                ]),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 22, vertical: 20),
                child: Row(children: [
                  Container(
                    width: 150,
                    child: Stack(children: [
                      Text('3',
                          style: TextStyle(
                              color: Colors.black87,
                              decoration: TextDecoration.none,
                              fontSize: 48)),
                      Positioned(
                        left: 43,
                        top: 3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.circle_outlined, color: Colors.black87),
                            SizedBox(height: 10),
                            Text('Feels like -2',
                                style: TextStyle(
                                    color: Colors.black87,
                                    decoration: TextDecoration.none,
                                    fontSize: 12))
                          ],
                        ),
                      )
                    ]),
                  ),
                  Container(
                      padding: EdgeInsets.only(top: 40, left: 80),
                      child: Text('Cloudy',
                          style: TextStyle(
                              color: Colors.black87,
                              decoration: TextDecoration.none,
                              fontSize: 18)))
                ]),
              ),
              Container(
                padding: EdgeInsets.only(left: 23, right: 23, top: 7),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, RoutesName.todayscreen);
                        print('today');
                      },
                      child: Container(
                          height: 35,
                          width: 90,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.white,
                          ),
                          child: const Center(
                            child: Text('Today',
                                style: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontSize: 17,
                                  color: Colors.black87,
                                )),
                          )),
                    ),
                    GestureDetector(
                      onTap: () {
                        print('tommorow');
                      },
                      child: Container(
                          height: 35,
                          width: 90,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.white,
                          ),
                          child: const Center(
                            child: Text('Tomorrow',
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.black87,
                                  decoration: TextDecoration.none,
                                )),
                          )),
                    ),
                    GestureDetector(
                      onTap: () {
                        print('10 days');
                      },
                      child: Container(
                          height: 35,
                          width: 90,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.white,
                          ),
                          child: const Center(
                            child: Text('10 days',
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.black87,
                                  decoration: TextDecoration.none,
                                )),
                          )),
                    ),
                  ],
                ),
              )
            ])),
      ],
    );
  }
}

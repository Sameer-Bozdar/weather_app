import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../core/utils/routes/routes_name.dart';

class TodayScreen extends StatefulWidget {
  const TodayScreen({super.key});

  @override
  State<TodayScreen> createState() => _TodayScreenState();
}

class _TodayScreenState extends State<TodayScreen> {
  List<_ChartData> BarChardata = [
    _ChartData('10 PM', 0),
    _ChartData('9 PM', 10),
    _ChartData('8 PM', 20),
    _ChartData('7 PM', 30),
  ];
  TooltipBehavior? _tooltip;

  List<_SalesData> data = [
    _SalesData('Mon', 35),
    _SalesData('Tue', 28),
    _SalesData('Thu', 34),
    _SalesData('Fri', 32),
    _SalesData('Sat', 40),
    _SalesData('Sun', 40)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(
              left: 19,
              right: 19,
            ),
            color: Color(0xfff6edff),
            child: Column(
              children: [
                Container(
                  height: 152,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3),
                  child: Container(
                    padding: const EdgeInsets.only(top: 80, left: 10, right: 10),
                    height: 150,
                    decoration: BoxDecoration(
                        color: Color(0xffebdeff),
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                            top: 15,
                          ),
                          child: Column(
                            children: [
                              Icon(
                                Icons.cloud,
                                size: 20,
                                color: Colors.lightBlue,
                              ),
                              Text('a',
                                  style: TextStyle(
                                      fontSize: 24,
                                      decoration: TextDecoration.none)),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 15),
                          child: Column(
                            children: [
                              Icon(
                                Icons.cloud,
                                size: 20,
                                color: Colors.lightBlue,
                              ),
                              Text('a',
                                  style: TextStyle(
                                      fontSize: 24,
                                      decoration: TextDecoration.none)),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 15),
                          child: Column(
                            children: [
                              Icon(
                                Icons.cloud,
                                size: 20,
                                color: Colors.lightBlue,
                              ),
                              Text('a',
                                  style: TextStyle(
                                      fontSize: 24,
                                      decoration: TextDecoration.none)),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 15),
                          child: Column(
                            children: [
                              Icon(
                                Icons.cloud,
                                size: 20,
                                color: Colors.lightBlue,
                              ),
                              Text('a',
                                  style: TextStyle(
                                      fontSize: 24,
                                      decoration: TextDecoration.none)),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 15),
                          child: Column(
                            children: [
                              Icon(
                                Icons.cloud,
                                size: 20,
                                color: Colors.lightBlue,
                              ),
                              Text('a',
                                  style: TextStyle(
                                      fontSize: 24,
                                      decoration: TextDecoration.none)),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 15),
                          child: Column(
                            children: [
                              Icon(
                                Icons.cloud,
                                size: 20,
                                color: Colors.lightBlue,
                              ),
                              Text('a',
                                  style: TextStyle(
                                      fontSize: 24,
                                      decoration: TextDecoration.none)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Card(
                    color: Color(0xffebdeff),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.date_range_outlined),
                            SizedBox(
                              width: 5,
                            ),
                            Text('Day forecast')
                          ],
                        ),
                        Container(
                          height: 145,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(34))),
                          child: SfCartesianChart(
                              primaryXAxis: CategoryAxis(),
                              // Enable legend
                              legend: Legend(isVisible: false),
                              // Enable tooltip
                              // tooltipBehavior: TooltipBehavior(enable: true),
                              series: <ChartSeries<_SalesData, String>>[
                                LineSeries<_SalesData, String>(
                                    dataSource: data,
                                    xValueMapper: (_SalesData sales, _) =>
                                        sales.year,
                                    yValueMapper: (_SalesData sales, _) =>
                                        sales.sales,
                                    // Enable data label
                                    dataLabelSettings:
                                        DataLabelSettings(isVisible: false))
                              ]),
                        )
                      ],
                    )),
                SizedBox(
                  height: 10,
                ),
                Card(
                  color: Color(0xffebdeff),
                  child: Container(
                    height: 145,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(34))),
                    child: SfCartesianChart(
                        primaryXAxis: CategoryAxis(),
                        primaryYAxis:
                            NumericAxis(minimum: 0, maximum: 40, interval: 10),
                        tooltipBehavior: _tooltip,
                        series: <ChartSeries<_ChartData, String>>[
                          BarSeries<_ChartData, String>(
                              dataSource: BarChardata,
                              xValueMapper: (_ChartData data, _) => data.x,
                              yValueMapper: (_ChartData data, _) => data.y,
                              name: 'Gold',
                              color: Color.fromRGBO(8, 142, 255, 1))
                        ]),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.only(left: 1, right: 1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 60,
                        width: 142,
                        decoration: BoxDecoration(
                            color: Color(0xffebdeff),
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                        child: Row(
                          children: [
                            Container(
                              child: Center(
                                  child: Icon(
                                    Icons.sunny,
                                    color: Colors.orange,
                                  )),
                            ),
                            Container(
                              padding: EdgeInsets.all(12),

                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'sunrise',
                                    style: TextStyle(
                                        color: Colors.black,
                                        decoration: TextDecoration.none,
                                        fontSize: 10),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    '12 pm',
                                    style: TextStyle(
                                        color: Colors.black,
                                        decoration: TextDecoration.none,
                                        fontSize: 10),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              child: Column(
                                children: [
                                  Container(
                                    height: 40,
                                  ),
                                  Container(
                                    child: Text(
                                      '1 hr ago',
                                      style: TextStyle(
                                          color: Colors.black,
                                          decoration: TextDecoration.none,
                                          fontSize: 10),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 60,
                        width: 142,
                        decoration: BoxDecoration(
                            color: Color(0xffebdeff),
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                        child: Row(
                          children: [
                            Container(
                              child: Center(
                                  child: Icon(
                                Icons.sunny,
                                color: Colors.orange,
                              )),
                            ),
                            Container(
                              padding: EdgeInsets.all(12),

                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'sunrise',
                                    style: TextStyle(
                                        color: Colors.black,
                                        decoration: TextDecoration.none,
                                        fontSize: 10),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    '12 pm',
                                    style: TextStyle(
                                        color: Colors.black,
                                        decoration: TextDecoration.none,
                                        fontSize: 10),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              child: Column(
                                children: [
                                  Container(
                                    height: 40,
                                  ),
                                  Container(
                                    child: Text(
                                      '1 hr ago',
                                      style: TextStyle(
                                          color: Colors.black,
                                          decoration: TextDecoration.none,
                                          fontSize: 10),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
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
                          Navigator.pushNamed(context, RoutesName.days_screen);
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
      ),
    );
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}

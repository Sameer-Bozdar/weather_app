import '../../core/data/response/api_response.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import '../../core/data/response/status.dart';
import '../../core/utils/routes/routes_name.dart';
import '../viewModel/weather_viewmodel.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherViewModel>(builder: (context, modal, _) {
      switch (modal.apiResponse.status) {
        case Status.LOADING:
          return const Center(child: CircularProgressIndicator());
        case Status.ERROR:
          return Center(child: Text(modal.apiResponse.message.toString()));
        case Status.COMPLETED:
          return Stack(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                color: Colors.grey[200],
                child: Column(
                  children: [
                    Expanded(flex: 2, child: Container()),
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, RoutesName.todayscreen);
                                    print('today');
                                  },
                                  child: Container(
                                      height: 35,
                                      width: 90,
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
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
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
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
                                    Navigator.pushNamed(
                                        context, RoutesName.days_screen);
                                    print('10 days');
                                  },
                                  child: Container(
                                      height: 35,
                                      width: 90,
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
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
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: 80,
                                padding:
                                    const EdgeInsets.only(left: 10, top: 12),
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(25.0),
                                      child: Card(
                                        color: Color(0xffebdeff),
                                        child: Column(
                                          children: [
                                            Row(children: [
                                              Container(
                                                padding: EdgeInsets.only(
                                                    left: 5, top: 8, right: 4),
                                                child: CircleAvatar(
                                                    backgroundColor:
                                                        Colors.white,
                                                    radius: 12,
                                                    child: const Icon(
                                                        Icons.wind_power)),
                                              ),
                                              Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  vertical: 9,
                                                ),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                        '${modal.apiResponse.data!.current!.windKph!.toString()}/hr'),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                        '${modal.apiResponse.data!.current!.windKph!.toString()}/hr'),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                child: Column(children: [
                                                  SizedBox(
                                                    height: 25,
                                                  ),
                                                  Container(
                                                    child: const Row(
                                                      children: [
                                                        Icon(
                                                          Icons
                                                              .arrow_drop_down_sharp,
                                                          color: Colors.red,
                                                          size: 15,
                                                        ),
                                                        Text(
                                                          '2 km/hr',
                                                          style: TextStyle(
                                                              fontSize: 9),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ]),
                                              )
                                            ]),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const Card(),
                                  ],
                                ),
                              ),
                              Container(
                                height: 80,
                                padding:
                                    const EdgeInsets.only(left: 10, top: 12),
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(25.0),
                                      child: Card(
                                        color: Color(0xffebdeff),
                                        child: Column(
                                          children: [
                                            Row(children: [
                                              Container(
                                                padding: EdgeInsets.only(
                                                    left: 5, top: 8, right: 4),
                                                child: CircleAvatar(
                                                    backgroundColor:
                                                        Colors.white,
                                                    radius: 12,
                                                    child: CircleAvatar(
                                                        backgroundColor:
                                                            Colors.white,
                                                        radius: 12,
                                                        child: const Icon(
                                                            Icons.wind_power))),
                                              ),
                                              Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  vertical: 9,
                                                ),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                        '${modal.apiResponse.data!.current!.windKph!.toString()}/hr'),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text('12km/hr'),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                child: Column(children: [
                                                  SizedBox(
                                                    height: 25,
                                                  ),
                                                  Container(
                                                    child: const Row(
                                                      children: [
                                                        Icon(
                                                          Icons
                                                              .arrow_drop_down_sharp,
                                                          color: Colors.red,
                                                          size: 15,
                                                        ),
                                                        Text(
                                                          '2 km/hr',
                                                          style: TextStyle(
                                                              fontSize: 9),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ]),
                                              )
                                            ]),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const Card(),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Flexible(
                                child: Container(
                                  height: 80,
                                  padding:
                                      const EdgeInsets.only(left: 10, top: 12),
                                  child: Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                        child: Card(
                                          color: Color(0xffebdeff),
                                          child: Column(
                                            children: [
                                              Row(children: [
                                                Container(
                                                  padding: EdgeInsets.only(
                                                      left: 5,
                                                      top: 8,
                                                      right: 4),
                                                  child: CircleAvatar(
                                                      backgroundColor:
                                                          Colors.white,
                                                      radius: 12,
                                                      child: const Icon(
                                                          Icons.wind_power)),
                                                ),
                                                Container(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                    vertical: 9,
                                                  ),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                          '${modal.apiResponse.data!.current!.windKph!.toString()}/hr'),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text('12km/hr'),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  child: Column(children: [
                                                    SizedBox(
                                                      height: 25,
                                                    ),
                                                    Container(
                                                      child: const Row(
                                                        children: [
                                                          Icon(
                                                            Icons
                                                                .arrow_drop_down_sharp,
                                                            color: Colors.red,
                                                            size: 15,
                                                          ),
                                                          Text(
                                                            '2 km/hr',
                                                            style: TextStyle(
                                                                fontSize: 9),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ]),
                                                )
                                              ]),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const Card(),
                                    ],
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Container(
                                  height: 80,
                                  padding: const EdgeInsets.only(
                                    left: 10,
                                    top: 12,
                                  ),
                                  child: Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                        child: Card(
                                          color: Color(0xffebdeff),
                                          child: Column(
                                            children: [
                                              Row(children: [
                                                Container(
                                                  padding: EdgeInsets.only(
                                                      left: 5,
                                                      top: 8,
                                                      right: 4),
                                                  child: CircleAvatar(
                                                      backgroundColor:
                                                          Colors.white,
                                                      radius: 12,
                                                      child: const Icon(
                                                          Icons.wind_power)),
                                                ),
                                                Container(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                    vertical: 9,
                                                  ),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                          '${modal.apiResponse.data!.current!.windKph!.toString()}/hr'),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text('12km/hr'),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  child: Column(children: [
                                                    SizedBox(
                                                      height: 25,
                                                    ),
                                                    Container(
                                                      child: const Row(
                                                        children: [
                                                          Icon(
                                                            Icons
                                                                .arrow_drop_down_sharp,
                                                            color: Colors.red,
                                                            size: 15,
                                                          ),
                                                          Text(
                                                            '2 km/hr',
                                                            style: TextStyle(
                                                                fontSize: 9),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ]),
                                                )
                                              ]),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const Card(),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Card(
                                  color: Color(0xffebdeff),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 80,
                                        child: Row(
                                          children: [
                                            Flexible(
                                                child: Icon(Icons
                                                    .watch_later_outlined)),
                                            SizedBox(
                                              width: 30,
                                            ),
                                            Flexible(
                                                child: Text(
                                                    'humidity ${modal.apiResponse.data!.forecast!.forecastday![0].hour![0].humidity}'))
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Card(
                                  color: Color(0xffebdeff),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 80,
                                        child: Row(
                                          children: [
                                            Flexible(
                                                child: Icon(Icons
                                                    .watch_later_outlined)),
                                            SizedBox(
                                              width: 30,
                                            ),
                                            Flexible(
                                                child: Text(
                                                    'Chance of Rain ${modal.apiResponse.data!.forecast!.forecastday![0].hour![0].chanceOfRain}%'))
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  width: double.infinity,
                  height: 360,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://images.unsplash.com/photo-1561484930-998b6a7b22e8?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80'),
                          fit: BoxFit.cover),
                      color: Colors.purple,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20))),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 22,
                            vertical: 50,
                          ),
                          child: Row(
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(modal.apiResponse.data!.location!.name!,
                                    style: TextStyle(
                                        color: Colors.white,
                                        decoration: TextDecoration.none,
                                        fontSize: 28)),
                                Flexible(child: Container(width: 200)),
                                GestureDetector(
                                    onTap: () {},
                                    child:
                                        Icon(Icons.search, color: Colors.white))
                              ]),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 22, vertical: 13),
                          child: Row(children: [
                            Flexible(
                              child: Container(
                                width: 280,
                                height: 90,
                                child: Stack(children: [
                                  Text(
                                      modal.apiResponse.data!.current!.tempC
                                          .toString(),
                                      style: TextStyle(
                                          color: Colors.white,
                                          decoration: TextDecoration.none,
                                          fontSize: 48)),
                                  SizedBox(height: 5),
                                  Positioned(
                                    left: 60,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Icon(Icons.circle_outlined,
                                            color: Colors.white, size: 18),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    left: 38,
                                    top: 60,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            'feels like ${modal.apiResponse.data!.current!.feelslikeC.toString()}',
                                            style: TextStyle(
                                                color: Colors.white,
                                                decoration: TextDecoration.none,
                                                fontSize: 12))
                                      ],
                                    ),
                                  )
                                ]),
                              ),
                            ),
                            Flexible(
                              child: Padding(
                                padding: EdgeInsets.only(left: 20),
                                child: Container(
                                    height: 80,
                                    width: 130,
                                    padding: EdgeInsets.only(top: 30, left: 60),
                                    child: Text(
                                        modal.apiResponse.data!.current!
                                            .condition!.text!,
                                        style: TextStyle(
                                            color: Colors.white,
                                            decoration: TextDecoration.none,
                                            fontSize: 18))),
                              ),
                            )
                          ]),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                            left: 10,
                            top: 40,
                          ),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Flexible(
                                  child: Text(
                                      modal.apiResponse.data!.current!
                                          .lastUpdated!,
                                      style: TextStyle(
                                          color: Colors.white,
                                          decoration: TextDecoration.none,
                                          fontSize: 18)),
                                ),
                                SizedBox(width: 100),
                                Flexible(
                                  child: Column(children: [
                                    Text(
                                        'Day ${modal.apiResponse.data!.current!.isDay.toString()}',
                                        style: TextStyle(
                                            color: Colors.white,
                                            decoration: TextDecoration.none,
                                            fontSize: 12)),
                                    SizedBox(height: 5),
                                  ]),
                                )
                              ]),
                        )
                      ]))
            ],
          );
        // provider == null ? Center(child: CircularProgressIndicator()) :
        default:
          const Text('');
      }
      return Container(
        child: Text('no data '),
      );
    });
  }
}

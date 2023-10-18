import '../../core/data/response/api_response.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import '../../core/utils/routes/routes_name.dart';
import '../viewModel/weather_viewmodel.dart';

class HomeScreen extends StatefulWidget {

  String currentaddress;
  Position? position;
   HomeScreen({super.key, required this.currentaddress, required this.position});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {
  String? countryname ;


  WeatherViewModel _weatherViewModel = WeatherViewModel();



  @override
  void initState() {

    print("${widget.currentaddress} ${widget.position} + Init State calling");
    print("${countryname }  ${_weatherViewModel.apiResponse.data?.location!.name.toString()}    i am printing city name");

    _weatherViewModel.postTodoApi(widget.currentaddress);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    var provider = Provider.of<WeatherViewModel>(context);
    final data = provider.apiResponse.data;
    if (data != null) {
      final location = data.location;
      if (location != null) {
        final cityname = location.name;
        setState(() async{
           countryname = await cityname;
        });

      } else {
        // Handle the case where location is null
      }
    } else {
      // Handle the case where postDataApiResponse is null
    }

  }

  @override
  Widget build(BuildContext context) {


 return
   // provider == null ? Center(child: CircularProgressIndicator()) :

 Stack(
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
                              Navigator.pushNamed(context, RoutesName.todayscreen);
                              print('today');
                            },
                            child: Container(
                                height: 35,
                                width: 90,
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
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
                          padding: const EdgeInsets.only(left: 10, top: 12),
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
                                              backgroundColor: Colors.white,
                                              radius: 12,
                                              child:
                                                  const Icon(Icons.wind_power)),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 9,
                                          ),
                                          child: const Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text('Wind speed'),
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
                                                    Icons.arrow_drop_down_sharp,
                                                    color: Colors.red,
                                                    size: 15,
                                                  ),
                                                  Text(
                                                    '2 km/hr',
                                                    style:
                                                        TextStyle(fontSize: 9),
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
                          padding: const EdgeInsets.only(left: 10, top: 12),
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
                                              backgroundColor: Colors.white,
                                              radius: 12,
                                              child: CircleAvatar(
                                                  backgroundColor: Colors.white,
                                                  radius: 12,
                                                  child: const Icon(
                                                      Icons.wind_power))),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 9,
                                          ),
                                          child: const Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text('Wind speed'),
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
                                                    Icons.arrow_drop_down_sharp,
                                                    color: Colors.red,
                                                    size: 15,
                                                  ),
                                                  Text(
                                                    '2 km/hr',
                                                    style:
                                                        TextStyle(fontSize: 9),
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
                            padding: const EdgeInsets.only(left: 10, top: 12),
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
                                                backgroundColor: Colors.white,
                                                radius: 12,
                                                child: const Icon(
                                                    Icons.wind_power)),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 9,
                                            ),
                                            child: const Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text('Wind speed'),
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
                                                backgroundColor: Colors.white,
                                                radius: 12,
                                                child: const Icon(
                                                    Icons.wind_power)),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 9,
                                            ),
                                            child: const Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text('Wind speed'),
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
                    Expanded(
                      child: ListView.builder(
                        itemCount: 2,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Card(
                              color: Color(0xffebdeff),
                              child: Column(
                                children: [
                                  Container(
                                    height: 80,
                                    child: Row(
                                      children: [
                                        Icon(Icons.watch_later_outlined),
                                        SizedBox(width: 10),
                                        Text('Hourly forecast')
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
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
            child: Column(children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 22,
                  vertical: 50,
                ),
                child: Row(children: [
                  Text(countryname.toString(),
                      style: TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.none,
                          fontSize: 28)),
                  SizedBox(width: 170),
                  GestureDetector(
                      onTap: () {},
                      child: Icon(Icons.search, color: Colors.white))
                ]),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 22,
                  vertical:13
                ),
                child: Row(children: [
                  Container(
                    width: 150,
                    child: Stack(children: [
                      Text('3',
                          style: TextStyle(
                              color: Colors.white,
                              decoration: TextDecoration.none,
                              fontSize: 68)),
                      Positioned(
                        left: 43,
                        top:3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.circle_outlined, color: Colors.white),
                            SizedBox(height:25),
                            Text('Feels like -2',
                                style: TextStyle(
                                    color: Colors.white,
                                    decoration: TextDecoration.none,
                                    fontSize: 12))
                          ],
                        ),
                      )
                    ]),
                  ),
                  Container(
                      padding: EdgeInsets.only(top: 40,left:80),
                      child: Text('Cloudy',
                          style: TextStyle(
                              color: Colors.white,
                              decoration: TextDecoration.none,
                              fontSize: 18)))
                ]),
              ),
              Container(
                padding: EdgeInsets.only(
                  left: 20,right:20,
                  top:70,

                ),
                child: Row(children: [
                  Text('$day-',
                      style: TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.none,
                          fontSize: 18)),
                  Text(month,
                      style: TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.none,
                          fontSize: 18)),
SizedBox(width:200),
                  Column(children:[
                    Text('Day $day',
                        style: TextStyle(
                            color: Colors.white,
                            decoration: TextDecoration.none,
                            fontSize: 12)),
                    SizedBox(height:5),
                    Text('Night -1',
                        style: TextStyle(
                            color: Colors.white,
                            decoration: TextDecoration.none,
                            fontSize: 12)),
                  ])

                ]),
              )
            ]))
      ],
    );
  }
  String day = DateTime.now().day.toString();
  String month = DateTime.now().month.toString();
}


import 'package:courier_management_system/core/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../../ui/view/days_screen.dart';
import '../../../ui/view/splashView.dart';
import '../../../ui/view/today_screen.dart';





class Routes {



  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.days_screen:
        return MaterialPageRoute(
            builder: (BuildContext context) => DaysScreen());
      // case RoutesName.home:
      //   return MaterialPageRoute(
      //       builder: (BuildContext context) => HomeScreen(currentaddress: ,));
      case RoutesName.todayscreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => TodayScreen());
      case RoutesName.splash:
        return MaterialPageRoute(
            builder: (BuildContext context) => SplashView());
      default:
       return MaterialPageRoute(builder: (_) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: Text('No Route Found'),
            ),
          );
        });
    }
  }


}
import 'dart:async';

import 'package:courier_management_system/core/model/weather_model.dart';
import 'package:courier_management_system/ui/view/Home_screen.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

@override
  void initState() {

  Timer(Duration(seconds: 5), (){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomeScreen(
        ),
      ),
    );
  }

  );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text('LAT: ${_currentPosition?.latitude ?? ""}'),
            // Text('LNG: ${_currentPosition?.longitude ?? ""}'),
            // Text('ADDRESS: ${_currentAddress ?? ""}'),
            const SizedBox(height: 32),
            // ElevatedButton(
            //   onPressed: () async {


          ],
        ),
      ),
    );
  }
}

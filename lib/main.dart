import 'package:flutter/material.dart';

import 'package:hello_world/screen/home_screen.dart';
import 'package:hello_world/screen/route/route_one_screen.dart';
import 'package:hello_world/screen/route/route_three_screen.dart';
import 'package:hello_world/screen/route/route_two_screen.dart';

const HOME_ROUTE = '/';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    // home: HomeScreen(),
    initialRoute: '/',
    routes: {
      HOME_ROUTE: (context) => HomeScreen(),
      '/one': (context) => RouteOneScreen(),
      '/two': (context) => RouteTwoScreen(),
      '/three': (context) => RouteThreeScreen(),
    },
  ));
}

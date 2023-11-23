import 'package:flutter/material.dart';
import 'package:hello_world/screen/tabbar/appbar_using_controller.dart';
import 'package:hello_world/screen/tabbar/basic_appbar_tabbar_screen.dart';
import 'package:hello_world/screen/tabbar/bottom_navigation_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => BasicAppbarTabbarScreen()),
                );
              },
              child: Text('BasicAppbarTabbarScreen'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => AppbarUsingController()),
                );
              },
              child: Text('AppbarUsingController'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (_) => BottomNavigationBarScreen()),
                );
              },
              child: Text('BottomNavigationBarScreen'),
            ),
          ],
        ),
      ),
    );
  }
}

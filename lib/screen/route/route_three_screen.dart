import 'package:flutter/material.dart';
import 'package:hello_world/layout/main_layout.dart';

class RouteThreeScreen extends StatelessWidget {
  const RouteThreeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final argument = ModalRoute.of(context)!.settings.arguments;

    return MainLayout(title: 'RouteThree', children: [
      Text(
        'arguments: ${argument}',
        textAlign: TextAlign.center,
      ),
      ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            'BackToScreen',
          ))
    ]);
  }
}

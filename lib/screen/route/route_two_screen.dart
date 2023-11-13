import 'package:flutter/material.dart';
import 'package:hello_world/layout/main_layout.dart';
import 'package:hello_world/screen/route/route_three_screen.dart';

class RouteTwoScreen extends StatelessWidget {
  const RouteTwoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments;

    return MainLayout(
      title: 'RouteTwo',
      children: [
        Text(
          'arguments: ${arguments}',
        ),
        // url을 지정하여 해당 스크린으로(/three) 이동
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed(
              '/three',
              arguments: 999,
            );
          },
          child: Text(
            'Push Named',
          ),
        ),
        // Route Stack에서 현재 스크린을(RouteTwoScreen) 대체한 뒤 이동(RouteThreeScreen)
        ElevatedButton(
          onPressed: () {
            // pushReplacementNamed를 통해 URL 지정가능
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (_) => RouteThreeScreen(),
              ),
            );
          },
          child: Text(
            'Push Replaced',
          ),
        ),
        // Route Stack을 보존하거나(true), 지우거나(false), 조건 여하에 보존한 뒤 이동(RouteThreeScreen)
        ElevatedButton(
          onPressed: () {
            // pushNamedAndRemoveUntil 통해 URL 지정가능
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (_) => RouteThreeScreen(),
              ),
              (route) => route.settings.name == '/',
            );
          },
          child: Text(
            'Push And Remove Until',
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            'BackToScreen',
          ),
        ),
      ],
    );
  }
}

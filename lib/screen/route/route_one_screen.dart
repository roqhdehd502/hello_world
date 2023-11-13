import 'package:flutter/material.dart';
import 'package:hello_world/layout/main_layout.dart';
import 'package:hello_world/screen/route/route_two_screen.dart';

class RouteOneScreen extends StatelessWidget {
  final int? number;

  const RouteOneScreen({this.number, super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'RouteOne',
      children: [
        Text(
          'arguments: ${number.toString()}',
          textAlign: TextAlign.center,
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => RouteTwoScreen(),
                settings: RouteSettings(
                  arguments: 789,
                ),
              ),
            );
          },
          child: Text(
            'Push',
          ),
        ),
        // pop 기능을 통해 최근 스크린으로 돌아가기
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop(456);
          },
          child: Text(
            'Back To Screen',
          ),
        ),
        // Route Stack에 스크린이 있을 때에만 작동(Pop)
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).maybePop();
          },
          child: Text(
            'Maybe POP',
          ),
        ),
        // Pop 여부를 return
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).canPop();
          },
          child: Text(
            'Maybe POP',
          ),
        ),
      ],
    );
  }
}

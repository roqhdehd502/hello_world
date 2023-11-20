import 'package:flutter/material.dart';
import 'package:hello_world/layout/main_layout_list.dart';
import 'package:hello_world/screen/route/route_one_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // WillPopScope: 시스템에서의 뒤로가기(Pop) 기능 제어
    return WillPopScope(
      onWillPop: () async {
        // true: 뒤로가기 누르면 앱 종료
        // false: 뒤로가기 눌러도 앱이 종료되지 않음
        final canPop = Navigator.of(context).canPop();

        return canPop;
      },
      child: MainLayoutList(
        title: 'Home Screen',
        children: [
          ElevatedButton(
            // number라는 인자값을 전달하여 해당 스크린으로(RouteOneScreen) 이동
            onPressed: () async {
              final result = await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => RouteOneScreen(
                    number: 123,
                  ),
                ),
              );
            },
            child: Text(
              'Push 1',
            ),
          ),
        ],
      ),
    );
  }
}

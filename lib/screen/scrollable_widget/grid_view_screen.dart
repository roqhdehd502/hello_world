import 'package:flutter/material.dart';
import 'package:hello_world/component/render_container.dart';
import 'package:hello_world/const/colors.dart';
import 'package:hello_world/layout/main_layout.dart';

class GridViewScreen extends StatelessWidget {
  final List<int> numbers = List.generate(
    100,
    (index) => index,
  );

  GridViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'GridViewScreen',
      body: renderGridViewCaseTwo(),
    );
  }

  // count를 이용하여 한 번에 GridView를 렌더링
  GridView renderGridViewCaseOne() {
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 12.0,
      crossAxisSpacing: 12.0,
      children: numbers
          .map(
            (e) => RenderContainer(
              color: rainbowColors[e % rainbowColors.length],
              index: e,
            ),
          )
          .toList(),
    );
  }

  // builder를 이용하여 필요한 만큼만 화면에 GridView를 렌더링 (최적화)
  GridView renderGridViewCaseTwo() {
    return GridView.builder(
      // SliverGridDelegateWithFixedCrossAxisCount: Row당 Widget들의 최대 갯수 설정
      // SliverGridDelegateWithMaxCrossAxisExtent: Row 내 Widget 당 최대 width 설정
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
      ),
      itemBuilder: (context, index) {
        return RenderContainer(
          color: rainbowColors[index % rainbowColors.length],
          index: index,
        );
      },
    );
  }
}

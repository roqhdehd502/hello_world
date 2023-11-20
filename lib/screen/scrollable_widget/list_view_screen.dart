import 'package:flutter/material.dart';
import 'package:hello_world/const/colors.dart';
import 'package:hello_world/layout/main_layout.dart';

class ListViewScreen extends StatelessWidget {
  final List<int> numbers = List.generate(
    100,
    (index) => index,
  );

  ListViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'ListViewScreen',
      body: renderListViewCaseThree(),
    );
  }

  // 기본적인 ListView 렌더링
  Widget renderListViewCaseOne() {
    return ListView(
      children: numbers
          .map(
            (e) => renderContainer(
              color: rainbowColors[e % rainbowColors.length],
              index: e,
            ),
          )
          .toList(),
    );
  }

  // builder를 이용하여 보여지는 화면에만 ListView 렌더링 (최적화)
  Widget renderListViewCaseTwo() {
    return ListView.builder(
      itemCount: 100,
      itemBuilder: (context, index) {
        return renderContainer(
          color: rainbowColors[index % rainbowColors.length],
          index: index,
        );
      },
    );
  }

  // separated를 이용하여 Widget 사이에 분리하는 Widget을 추가하여 ListView 렌더링
  Widget renderListViewCaseThree() {
    return ListView.separated(
      separatorBuilder: (context, index) {
        index += 1;
        if (index % 5 == 0) {
          return renderContainer(
            color: Colors.black,
            index: index,
            height: 100.0,
          );
        }
        return Container();
      },
      itemCount: 100,
      itemBuilder: (context, index) {
        return renderContainer(
          color: rainbowColors[index % rainbowColors.length],
          index: index,
        );
      },
    );
  }

  Widget renderContainer({
    required Color color,
    required int index,
    double? height,
  }) {
    print(index);
    return Container(
      height: height ?? 300,
      color: color,
      child: Center(
        child: Text(
          index.toString(),
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 30.0,
          ),
        ),
      ),
    );
  }
}

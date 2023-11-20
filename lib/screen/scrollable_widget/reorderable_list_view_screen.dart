import 'package:flutter/material.dart';
import 'package:hello_world/const/colors.dart';
import 'package:hello_world/layout/main_layout.dart';

class ReorderableListViewScreen extends StatefulWidget {
  const ReorderableListViewScreen({super.key});

  @override
  State<ReorderableListViewScreen> createState() =>
      _ReorderableListViewScreenState();
}

class _ReorderableListViewScreenState extends State<ReorderableListViewScreen> {
  List<int> numbers = List.generate(100, (index) => index);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'ReorderableListViewScreen',
      body: ReorderableListView.builder(
        itemBuilder: (context, index) {
          // 기본적인 builder의 경우, index를 그대로 받으면 지정한 index 그대로 지정이 되어 렌더링을 한다.
          // 따라서, Reorder를 하여 n번째 인덱스의 Widget을 m번째로 옮겨도 그대로 렌더링이 되길 원하면 가져오고자 하는 배열 데이터의 index를 참조한다.
          return renderContainer(
            color: rainbowColors[numbers[index] % rainbowColors.length],
            index: numbers[index],
          );
        },
        itemCount: 100,
        onReorder: (int oldIndex, int newIndex) {
          setState(() {
            if (oldIndex < newIndex) newIndex -= 1;

            final item = numbers.removeAt(oldIndex);
            numbers.insert(newIndex, item);
          });
        },
      ),
    );
  }

  // 기본적인 ReorderableListView
  Widget renderReorderableListViewCaseOne() {
    return ReorderableListView(
      children: numbers
          .map(
            (e) => renderContainer(
              color: rainbowColors[e % rainbowColors.length],
              index: e,
            ),
          )
          .toList(),
      onReorder: (int oldIndex, int newIndex) {
        setState(() {
          // NOTE: oldIndex와 newIndex의 산정 방식은 값을 옮기기 전을 둔다.
          //
          // ex1)
          // [red, orange, yellow] 배열의 인덱스는 [0, 1, 2] 일 때, red를 yellow 다음으로 옮기고 싶다.
          // => red : (0: oldIndex) -> (3: newIndex)
          // => [orange, yellow, red]
          //
          // ex2)
          // [red, orange, yellow] 배열의 인덱스는 [0, 1, 2] 일 때, yellow를 맨 앞으로 옮기고 싶다.
          // => yellow : (2: oldIndex) -> (0: newIndex)
          // => [yellow, red, orange]
          if (oldIndex < newIndex) newIndex -= 1;

          final item = numbers.removeAt(oldIndex);
          numbers.insert(newIndex, item);
        });
      },
    );
  }

  // builder를 이용한 ReorderableListView (최적화)

  Widget renderContainer({
    required Color color,
    required int index,
    double? height,
  }) {
    print(index);
    return Container(
      key: Key(index.toString()),
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

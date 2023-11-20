import 'package:flutter/material.dart';
import 'package:hello_world/const/colors.dart';

class CustomScrollViewScreen extends StatelessWidget {
  final List<int> numbers = List.generate(100, (index) => index);

  CustomScrollViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          renderSliverAppbar(),
          // SliverList
          //renderSliverChildBuilderDelegate(),
          // SliverGrid
          renderSliverGridSliverChildBuilderDelegate(),
        ],
      ),
    );
  }

  // SliverAppbar
  SliverAppBar renderSliverAppbar() {
    return SliverAppBar(
      pinned: false, // Appbar 완전 고정
      floating: true, // 스크롤 할 때 Appbar 표시
      snap: true, // Appbar 자석 효과 (floating이 true일 때만 가능)
      stretch: true, // 한계 지점이상 스크롤을 핧 때, Appbar의 사이즈가 늘어져서 표시
      expandedHeight: 200, // 스크롤 할 때 표시되는 Appbar의 높이
      collapsedHeight: 150, // 스크롤 할 숨겨지는 Appbar의 높이
      flexibleSpace: FlexibleSpaceBar(
        // 스크롤 할 때만 표시되는 AppBar 공간
        title: Text('Flex'),
      ),
      title: Text('CustomScrollViewScreen'),
    );
  }

  // SliverChildListDelegate를 이용한 기본적인 SliverList
  SliverList renderSliverListSliverChildListDelegate() {
    return SliverList(
      delegate: SliverChildListDelegate(
        numbers
            .map(
              (e) => renderContainer(
                color: rainbowColors[e % rainbowColors.length],
                index: e,
              ),
            )
            .toList(),
      ),
    );
  }

  // SliverChildBuilderDelegate를 이용한 SliverList 최적화
  SliverList renderSliverListSliverChildBuilderDelegate() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return renderContainer(
            color: rainbowColors[index % rainbowColors.length],
            index: index,
          );
        },
        childCount: numbers.length,
      ),
    );
  }

  // SliverChildListDelegate를 이용한 기본적인 SliverGrid
  SliverGrid renderSliverGridSliverChildListDelegate() {
    return SliverGrid(
      delegate: SliverChildListDelegate(
        numbers
            .map(
              (e) => renderContainer(
                color: rainbowColors[e % rainbowColors.length],
                index: e,
              ),
            )
            .toList(),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
    );
  }

  // SliverChildBuilderDelegate를 이용한 SliverGrid 최적화
  SliverGrid renderSliverGridSliverChildBuilderDelegate() {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return renderContainer(
            color: rainbowColors[index % rainbowColors.length],
            index: index,
          );
        },
        childCount: numbers.length,
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
    );
  }

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

import 'package:flutter/material.dart';
import 'package:hello_world/const/colors.dart';
import 'package:hello_world/layout/main_layout.dart';

class SingleChildScrollViewScreen extends StatelessWidget {
  final List<int> numbers = List.generate(
    100,
    (index) => index,
  );

  SingleChildScrollViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'SingleChildScrollViewScreen',
      body: renderSingleScrollViewCaseOne(),
    );
  }

  // 기본 SingleScrollView 렌더링
  Widget renderSingleScrollViewCaseOne() {
    return renderSingleScrollViewCaseFour();
  }

  // physics의 옵션을 이용하여 스크롤 유무 설정 가능한 SingleScrollView 렌더링
  Widget renderSingleScrollViewCaseTwo() {
    return SingleChildScrollView(
      // NeverScrollableScrollPhysics: 스크롤 불가
      // AlwaysScrollableScrollPhysics: 항상 스크롤 가능하게
      // BouncingScrollPhysics: 바운스 되는 애니메이션을 적용한 스크롤 적용 (IOS 스타일)
      // ClampingScrollPhysics: 걸치는 듯한 애니메이션을 적용한 스크롤 적용 (Android 스타일)
      physics: AlwaysScrollableScrollPhysics(),
      child: Column(
        children: [
          renderContainer(color: Colors.black),
        ],
      ),
    );
  }

  // clipBehavior 옵션을 이용하여 스크롤을 해도 위젯 잘림 유무 설정
  Widget renderSingleScrollViewCaseThree() {
    return SingleChildScrollView(
      clipBehavior: Clip.none,
      physics: AlwaysScrollableScrollPhysics(),
      child: Column(
        children: [
          renderContainer(color: Colors.black),
        ],
      ),
    );
  }

  // 주의! 다량의 데이터를 렌더링 할 때에는 퍼포먼스를 이유로 ListView를 이용한다
  Widget renderSingleScrollViewCaseFour() {
    return SingleChildScrollView(
      child: Column(
        children: numbers
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

  Widget renderContainer({
    required Color color,
    int? index,
  }) {
    if (index != null) print(index);
    return Container(
      height: 300,
      color: color,
    );
  }
}

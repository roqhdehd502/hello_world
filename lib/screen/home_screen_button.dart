import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('버튼'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                // 메인 컬러
                backgroundColor: Colors.red,
                // 글자 및 애니메이션 컬러
                foregroundColor: Colors.black,
                // 그림자 컬러
                shadowColor: Colors.green,
                // 입체감의 높이
                elevation: 10.0,
                // 텍스트 스타일 설정
                textStyle: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20.0,
                ),
                // 버튼 내부 Padding 설정
                padding: EdgeInsets.all(32.0),
                // 버튼 경계 설정
                side: BorderSide(
                  color: Colors.black,
                  width: 4.0,
                ),
              ),
              onPressed: () {},
              child: Text('ElevatedButton'),
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Colors.black,
                ),
                // MaterialStateProperty.resolveWith 기능에 의해 버튼의 동작에 따라 스타일 지정
                foregroundColor: MaterialStateProperty.resolveWith(
                    (Set<MaterialState> states) {
                  // 버튼이 눌렸을때
                  if (states.contains(MaterialState.pressed)) {
                    return Colors.white;
                  }

                  return Colors.red;
                }),
                padding: MaterialStateProperty.resolveWith(
                    (Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed)) {
                    return EdgeInsets.all(40.0);
                  }

                  return EdgeInsets.all(20.0);
                }),
              ),
              onPressed: () {},
              child: Text('DynamicStyledButton'),
            ),
            OutlinedButton(
              style: OutlinedButton.styleFrom(),
              onPressed: () {},
              child: Text('OutlinedButton'),
            ),
            TextButton(
              style: TextButton.styleFrom(),
              onPressed: () {},
              child: Text('TextButton'),
            )
          ],
        ),
      ),
    );
  }
}

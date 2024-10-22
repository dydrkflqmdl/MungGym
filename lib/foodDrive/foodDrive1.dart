import 'package:flutter/material.dart';
import 'package:mung_gym/foodDrive/foodDrive2.dart';

class Fooddrive1 extends StatelessWidget {
  final String name;

  const Fooddrive1({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF4E7EFF),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 110),
            const SizedBox(
              width: 342,
              child: Text(
                "Food Drive란?",
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Color(0xFFFFFFFF),
                  fontSize: 22,
                  fontFamily: 'Pretendard-SemiBold',
                ),
              ),
            ),
            const SizedBox(height: 20),
            const SizedBox(
              width: 342,
              child: Text(
                "반려견의 높은 식욕은 곧\n열린 호기심이자 배움의 의지!\n평소 높은 식욕을 유지할 수 있게\n식습관 관리가 중요해요!",
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Color(0xFFFFFFFF),
                  fontSize: 22,
                  fontFamily: 'Pretendard-SemiBold',
                ),
              ),
            ),
            const SizedBox(height: 20),
            const SizedBox(
              width: 342,
              child: Text(
                "그럼 체크하러 가볼까요?",
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Color(0xFFFFFFFF),
                  fontSize: 22,
                  fontFamily: 'Pretendard-SemiBold',
                ),
              ),
            ),
            // 공간을 확보하여 버튼들이 아래에 위치하게
            const Spacer(),
            // 버튼을 하단에 배치
            _buildBottomButtons(context),
            const SizedBox(height: 56),
          ],
        ),
      ),
    );
  }

  // 하단 버튼 생성 함수
  Widget _buildBottomButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context); // 이전 화면으로 돌아가기
          },
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: const Color(0xFFFFFFFF),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Center(
              child: Text(
                '<',
                style: TextStyle(
                  fontSize: 28,
                  color: Color(0xFFAAAAB6),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 8), // 버튼 사이 간격
        GestureDetector(
          onTap: () {
            // 다음 페이지로 넘어가는 로직
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Fooddrive2(name: name),
              ),
            );
          },
          child: Container(
            width: 273,
            height: 58,
            decoration: BoxDecoration(
              color: const Color(0xFFFFFFFF),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Center(
              child: Text(
                '체크하러 가기',
                style: TextStyle(
                  color: Color(0xFF4E7EFF),
                  fontSize: 20,
                  fontFamily: 'Pretendard-SemiBold',
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

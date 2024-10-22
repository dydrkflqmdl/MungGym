import 'package:flutter/material.dart';
import 'package:mung_gym/homeFitness/homeFitnessCheckStep2.dart';

class Homefitnesscheckstep1 extends StatefulWidget {
  final String name;

  const Homefitnesscheckstep1({
    super.key,
    required this.name,
  });

  @override
  State<Homefitnesscheckstep1> createState() => _Homefitnesscheckstep1State();
}

class _Homefitnesscheckstep1State extends State<Homefitnesscheckstep1> {
  // 선택된 기구를 저장할 리스트
  List<String> selectedEquipment = [];

  void toggleSelection(String name) {
    setState(() {
      if (selectedEquipment.contains(name)) {
        selectedEquipment.remove(name); // 이미 선택된 경우 해제
      } else {
        selectedEquipment.add(name); // 선택되지 않은 경우 추가
      }
    });
  }

  bool _isNextButtonEnabled() {
    return selectedEquipment.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 100),
            Container(
              width: 342,
              height: 10,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xFFDAE4FF),
              ),
              clipBehavior: Clip.hardEdge,
              child: CustomPaint(
                painter: CurvedProgressPainter(percentage: 0.5),
              ),
            ),
            const SizedBox(height: 30),
            const SizedBox(
              width: 342,
              child: Text(
                "집에 준비된 피트니스 기구는\n어떤 것인가요? (중복선택 가능)",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 22,
                  fontFamily: 'Pretendard-SemiBold',
                ),
              ),
            ),
            const SizedBox(height: 20),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildEquipmentCard(
                      imagePath: 'assets/images/hurdle.png',
                      name: '허들',
                      description: '(대체품 : 우산, 구두주걱 등)',
                      imageWidth: 155,
                      imageHeight: 51,
                      topPadding: 47,
                      imageToNameSpacing: 32,
                    ),
                    buildEquipmentCard(
                      imagePath: 'assets/images/cone.png',
                      name: '콘',
                      description:
                          '(대체품 : 쉽게 쓰러지지 않는\n중량의 반려견 체구 높이의 물건,\n2L 페트병 등)',
                      imageWidth: 99,
                      imageHeight: 87,
                      topPadding: 17,
                      imageToNameSpacing: 3,
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildEquipmentCard(
                      imagePath: 'assets/images/balance_disc.png',
                      name: '밸런스 디스크',
                      imageWidth: 110,
                      imageHeight: 99,
                      topPadding: 29,
                      imageToNameSpacing: 8,
                    ),
                    buildEquipmentCard(
                      imagePath: 'assets/images/balance_pad.png',
                      name: '밸런스 패드',
                      imageWidth: 177,
                      imageHeight: 112,
                      topPadding: 24,
                      imageToNameSpacing: 0,
                    ),
                  ],
                ),
              ],
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

  Widget buildEquipmentCard({
    required String imagePath,
    required String name,
    String? description,
    required double imageWidth,
    required double imageHeight,
    required double topPadding,
    required double imageToNameSpacing, // 이미지와 이름 사이의 간격
  }) {
    final isSelected = selectedEquipment.contains(name); // 선택 여부 체크

    return GestureDetector(
      onTap: () => toggleSelection(name),
      child: Card(
        color: isSelected ? Colors.blue[100] : Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(
            color: isSelected ? Colors.blue : Colors.grey,
            width: 2,
          ),
        ),
        child: SizedBox(
          width: 168, // 고정된 카드의 너비
          height: 186, // 고정된 카드의 높이
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center, // 중앙 정렬
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center, // 수직 중앙 정렬
                  crossAxisAlignment: CrossAxisAlignment.center, // 수평 중앙 정렬
                  children: [
                    SizedBox(height: topPadding), // 이미지와 이름 사이의 간격 조절
                    SizedBox(
                      width: imageWidth,
                      height: imageHeight,
                      child: Image.asset(
                        imagePath,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: imageToNameSpacing), // 이미지와 이름 사이의 간격 조절
                    Text(
                      name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (description != null && description.isNotEmpty)
                      Text(
                        description,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.grey[600],
                        ),
                      ),
                  ],
                ),
              ),
              // 선택 상태에 따라 체크 이미지나 선택되지 않은 이미지를 오른쪽 위에 표시
              Positioned(
                top: 13,
                right: 10,
                child: Image.asset(
                  isSelected
                      ? 'assets/images/check.png'
                      : 'assets/images/uncheck.png',
                  width: 20,
                  height: 20,
                ),
              ),
            ],
          ),
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
            Navigator.pop(context);
          },
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(78, 126, 255, 0.2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Center(
              child: Text(
                '<', // < 모양의 화살표
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.white,
                  fontWeight: FontWeight.bold, // 좀 더 두꺼운 글꼴로 설정
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 8), // 버튼 사이 간격을 8로 설정
        GestureDetector(
          onTap: _isNextButtonEnabled()
              ? () {
                  // 다음 페이지로 넘어가는 로직
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          Homefitnesscheckstep2(name: widget.name),
                    ),
                  );
                }
              : null, // 비활성화 상태에서는 아무 동작도 하지 않음
          child: Container(
            width: 273,
            height: 58,
            decoration: BoxDecoration(
              color: _isNextButtonEnabled()
                  ? const Color(0xFF4E7EFF)
                  : const Color.fromRGBO(
                      78, 126, 255, 0.2), // 버튼 색상을 선택 여부에 따라 변경
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Center(
              child: Text(
                '다음',
                style: TextStyle(
                  color: Colors.white,
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

// CustomPainter 클래스를 활용한 굴곡 있는 Progress Bar
class CurvedProgressPainter extends CustomPainter {
  final double percentage;

  CurvedProgressPainter({required this.percentage});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color.fromRGBO(78, 126, 255, 1.0)
      ..style = PaintingStyle.fill;

    final backgroundPaint = Paint()
      ..color = const Color(0xFFDAE4FF)
      ..style = PaintingStyle.fill;

    // 전체 배경 그리기
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(0, 0, size.width, size.height),
        const Radius.circular(10),
      ),
      backgroundPaint,
    );

    // 굴곡 있는 진행상태 그리기
    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width * percentage, 0)
      ..quadraticBezierTo(size.width * percentage + 10, size.height / 2,
          size.width * percentage, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

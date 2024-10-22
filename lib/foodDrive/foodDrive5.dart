import 'package:flutter/material.dart';

class Fooddrive5 extends StatefulWidget {
  final String name;

  const Fooddrive5({
    super.key,
    required this.name,
  });

  @override
  State<Fooddrive5> createState() => _Fooddrive4State();
}

class _Fooddrive4State extends State<Fooddrive5> {
  // 선택 가능한 항목들
  final List<String> foodDrive1Options = ['잘 먹습니다.', '잘 먹을때도 있고, 아닐 때도 있습니다.'];

  // 선택 상태를 저장할 리스트
  List<bool> foodDrive1Selections = [false, false];

  // 선택된 푸드드라이브를 저장할 변수
  String selectedFoodDrive1 = '';

  bool _isNextButtonEnabled() {
    // 푸드드라이브가 선택되면 다음 버튼 활성화
    return foodDrive1Selections.contains(true);
  }

  void showCustomDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(
            clipBehavior: Clip.none, // 팝업 외부로 나가는 요소를 허용
            alignment: Alignment.topCenter, // 이미지가 팝업 위에 위치하도록 설정
            children: [
              Container(
                width: 347,
                height: 349,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 40), // 이미지와 텍스트 사이의 간격
                    const Text(
                      'Perfect!',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4E7EFF),
                        fontFamily: 'Pretendard-Medium',
                      ),
                    ),
                    const SizedBox(height: 22),
                    const Text(
                      '계속 지금과 같은 식욕을 유지해주세요!\n\n분명 홈피트니스를 빠르게\n배워나가며 즐거워할거예요!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF000000),
                        fontFamily: 'Pretendard-SemiBold',
                      ),
                    ),
                    const SizedBox(height: 61),
                    SizedBox(
                      width: 290,
                      height: 52,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // 팝업 닫기
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF4E7EFF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          '확인했어요',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFFFFFFF),
                            fontFamily: 'Pretendard-SemiBold',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: -25, // 팝업창 위로 튀어나오는 위치 설정
                child: Image.asset(
                  'assets/images/1st.png', // 프로젝트 내 이미지 경로 설정
                  width: 68, // 이미지 크기 설정
                  height: 68,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
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
                painter: CurvedProgressPainter(percentage: 0.2),
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: 342,
              child: Text(
                "우리 ${widget.name}(은)는\n(중복선택 가능)",
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontSize: 22,
                  fontFamily: 'Pretendard-SemiBold',
                ),
              ),
            ),
            const SizedBox(height: 16),
            ..._buildFooddriveCheckboxes(),
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

  // 푸드드라이브 선택 여부 버튼을 만드는 함수
  List<Widget> _buildFooddriveCheckboxes() {
    return List.generate(foodDrive1Options.length, (index) {
      return GestureDetector(
        onTap: () {
          setState(() {
            foodDrive1Selections[index] = !foodDrive1Selections[index];
            // 선택된 푸드드라이브 업데이트
            selectedFoodDrive1 = foodDrive1Options
                .asMap()
                .entries
                .where((entry) => foodDrive1Selections[entry.key])
                .map((entry) => entry.value)
                .join(', ');
          });
        },
        child: Container(
          width: 342,
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(
              color: foodDrive1Selections[index]
                  ? const Color(0xFF4E7EFF) // 선택된 항목의 테두리 색상을 진하게
                  : const Color(0xFFDAE4FF), // 선택되지 않은 항목의 테두리 색상
              width: foodDrive1Selections[index]
                  ? 2.5
                  : 1.5, // 선택된 항목의 테두리 두께를 진하게
            ),
            borderRadius: BorderRadius.circular(10),
            color: foodDrive1Selections[index]
                ? const Color.fromRGBO(76, 126, 255, 0.2) // 선택된 항목의 배경색
                : Colors.transparent, // 선택되지 않은 항목의 배경색
          ),
          margin: const EdgeInsets.symmetric(vertical: 4.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  foodDrive1Options[index],
                  style: const TextStyle(
                    fontSize: 18,
                    fontFamily: 'Pretendard-Medium',
                  ),
                ),
                _customCheckbox(foodDrive1Selections[index]),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget _customCheckbox(bool isSelected) {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? const Color(0xFF4E7EFF) : const Color(0xFFDAE4FF),
          width: 2,
        ),
      ),
      child: isSelected
          ? const Icon(
              Icons.check, // 체크 아이콘
              size: 16,
              color: Color(0xFF4E7EFF), // 체크 아이콘 색상
            )
          : const Icon(
              Icons.check, // 체크 아이콘
              size: 16,
              color: Color.fromRGBO(78, 126, 255, 0.2), // 체크가 안되었을 때 아이콘 색상
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
                  showCustomDialog(context); // 팝업 창 띄우기
                }
              : null,
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

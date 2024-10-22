import 'package:flutter/material.dart';
import 'package:mung_gym/startPage/secondPage.dart';

class Firstpage extends StatefulWidget {
  const Firstpage({super.key});

  @override
  _FirstpageState createState() => _FirstpageState();
}

class _FirstpageState extends State<Firstpage> {
  final TextEditingController _controller = TextEditingController();
  bool _isButtonEnabled = false;

  void _onTextChanged(String text) {
    setState(() {
      _isButtonEnabled = text.isNotEmpty; // 입력 필드가 비어있지 않으면 버튼 활성화
    });
  }

  void _clearText() {
    _controller.clear(); // 텍스트 필드 내용 지우기
    _onTextChanged(''); // 버튼 상태 업데이트
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, // 키보드에 의한 화면 리사이징 허용
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
                painter: CurvedProgressPainter(percentage: 0.1),
              ),
            ),
            const SizedBox(height: 39),
            const SizedBox(
              width: 342,
              child: Text(
                '운동을 시작하는\n멍멍이의 이름을 알려주세요.',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.left,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 342,
              child: TextField(
                controller: _controller,
                maxLength: 10, // 최대 10글자 제한
                decoration: InputDecoration(
                  hintText: '이름을 입력해주세요. (최대10글자)',
                  border: InputBorder.none, // 기본 테두리 제거
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFDAE4FF), // 비활성 상태에서의 아래쪽 테두리 색상
                    ),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF4E7EFF), // 활성 상태에서의 아래쪽 테두리 색상
                    ),
                  ),
                  // X 버튼을 조건부로 보여줍니다.
                  suffixIcon: _controller.text.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.clear), // X 버튼 아이콘
                          onPressed: _clearText, // X 버튼 눌렀을 때 텍스트 지우기
                        )
                      : null,
                ),
                onChanged: _onTextChanged,
              ),
            ),
            const SizedBox(height: 20),
            const Spacer(), // 공간을 확보하여 버튼들이 아래에 위치하게
            ElevatedButton(
              onPressed: _isButtonEnabled
                  ? () {
                      // 입력한 이름을 다음 페이지로 전달
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Secondpage(
                            name: _controller.text, // 입력된 이름을 전달
                          ),
                        ),
                      );
                    }
                  : null, // 버튼 비활성화 상태
              style: ElevatedButton.styleFrom(
                backgroundColor: _isButtonEnabled
                    ? const Color(0xFF4E7EFF) // 활성화
                    : const Color(0xFFDAE4FF), // 비활성화 색상
                foregroundColor:
                    _isButtonEnabled ? Colors.white : Colors.black, // 텍스트 색상 설정
                minimumSize: const Size(342, 50), // 버튼 크기 설정
              ),
              child: const Text(
                '다음',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Pretendard-SemiBold',
                ),
              ),
            ),
            const SizedBox(height: 56),
          ],
        ),
      ),
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

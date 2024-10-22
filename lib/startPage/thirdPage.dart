import 'package:flutter/material.dart';
import 'package:mung_gym/homeFitness/homeFitnessCheckStep1.dart';

class Thirdpage extends StatefulWidget {
  final String name;
  final String age;
  final String neuteringStatus;

  const Thirdpage({
    super.key,
    required this.name,
    required this.age,
    required this.neuteringStatus,
  });

  @override
  _ThirdpageState createState() => _ThirdpageState();
}

class _ThirdpageState extends State<Thirdpage> {
  // 슬개골탈구 진단 여부를 위한 변수
  String patellaDiagnosisStatus = '';

  // 진단받은 슬개골탈구 기수 선택을 위한 변수
  String patellaSeverityStatus = '';

  // 슬개골탈구 진단 여부에 따라 다음 버튼 활성화 함수
  bool _isNextButtonEnabled() {
    // 슬개골탈구 진단 여부 선택 확인 후, 만약 "있어요"를 선택했다면 기수 선택도 확인
    if (patellaDiagnosisStatus == '있어요') {
      // 기수 선택이 되어야만 다음 버튼 활성화
      return patellaSeverityStatus.isNotEmpty;
    } else {
      return patellaDiagnosisStatus.isNotEmpty;
    }
  }

  // 각 증상 체크 상태를 저장하는 변수들
  bool isSymptom1Checked = false;
  bool isSymptom2Checked = false;
  bool isSymptom3Checked = false;
  bool isSymptom4Checked = false;
  bool isSymptom5Checked = false;

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
                painter: CurvedProgressPainter(percentage: 0.3),
              ),
            ),
            const SizedBox(height: 30),
            const SizedBox(
              width: 342,
              child: Text(
                "수의사에게\n슬개골탈구 진단 받은적이 있나요?",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 22,
                  fontFamily: 'Pretendard-SemiBold',
                ),
              ),
            ),
            const SizedBox(height: 16),
            // 슬개골탈구 진단 여부 선택 버튼
            _buildNeuteringOptions(),
            // '있어요' 선택 시 추가로 표시되는 슬개골탈구 기수 선택 영역
            if (patellaDiagnosisStatus == '있어요') ...[
              const SizedBox(height: 52),
              Container(
                width: 342, // 원하는 너비 설정
                padding: const EdgeInsets.all(16), // 패딩을 추가하여 여백을 설정
                decoration: BoxDecoration(
                  color: const Color(0xFFF6F7FB), // 배경색
                  borderRadius: BorderRadius.circular(8), // 모서리 둥글게
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start, // 왼쪽 정렬을 위한 설정
                  children: [
                    const Text(
                      "슬개골탈구\n몇 기를 진단 받으셨나요?",
                      textAlign: TextAlign.left, // 왼쪽 정렬
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Pretendard-Medium',
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildPatellaSeverityOptions(),
                  ],
                ),
              ),
            ],
            // '없어요' 선택 시 추가로 표시되는 이미지와 텍스트 영역
            if (patellaDiagnosisStatus == '없어요') ...[
              const SizedBox(height: 52),
              Container(
                width: 342,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFF6F7FB), // 배경색
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "  해당하는 증상이 있다면",
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Pretendard-Medium',
                      ),
                    ),
                    const Row(
                      children: [
                        Text(
                          "  체크 ",
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Pretendard-Medium',
                          ),
                        ),
                        Icon(
                          Icons.check, // 체크 아이콘
                          color: Color(0xFF4E7EFF), // 원하는 색상으로 설정
                          size: 18,
                        ),
                        Text(
                          " 해주세요.",
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Pretendard-Medium',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    // 증상 목록에 체크박스 추가
                    _buildSymptomCheckbox(
                      "최근 6개월 안에 뒷다리가 절뚝거린 적이 있어요.",
                      isSymptom1Checked,
                      (value) {
                        setState(() {
                          isSymptom1Checked = value!;
                        });
                      },
                    ),
                    _buildSymptomCheckbox(
                      "높은 곳에 올라가거나 내려오기 주저해요.",
                      isSymptom2Checked,
                      (value) {
                        setState(() {
                          isSymptom2Checked = value!;
                        });
                      },
                    ),
                    _buildSymptomCheckbox(
                      "다리를 핥았을 때, '두두둑'하는 뼈소리가 나요.",
                      isSymptom3Checked,
                      (value) {
                        setState(() {
                          isSymptom3Checked = value!;
                        });
                      },
                    ),
                    _buildSymptomCheckbox(
                      "다리를 만지려고 할 때 거부 반응이 있어요.",
                      isSymptom4Checked,
                      (value) {
                        setState(() {
                          isSymptom4Checked = value!;
                        });
                      },
                    ),
                    _buildSymptomCheckbox(
                      "서있는 자세를 뒤에서 봤을 때, 다리가 곧지 않고 휘어 있어요.",
                      isSymptom5Checked,
                      (value) {
                        setState(() {
                          isSymptom5Checked = value!;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
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

  // 슬개골탈구 진단 선택 여부 버튼을 만드는 함수
  Widget _buildPatellaDiagnosisButton(String title, bool isSelected,
      VoidCallback onTap, IconData icon, Color iconColor) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 165,
        height: 49,
        decoration: BoxDecoration(
          border: Border.all(
            color:
                isSelected ? const Color(0xFF4E7EFF) : const Color(0xFFDAE4FF),
            width: isSelected ? 2.5 : 1.5,
          ),
          borderRadius: BorderRadius.circular(10),
          color: isSelected
              ? const Color.fromRGBO(76, 126, 255, 0.2)
              : Colors.transparent,
        ),
        margin: const EdgeInsets.symmetric(vertical: 4.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontFamily: 'Pretendard-Medium',
                ),
              ),
              const SizedBox(width: 8), // 아이콘과 텍스트 사이 간격
              Icon(icon, color: iconColor), // 아이콘 추가
            ],
          ),
        ),
      ),
    );
  }

  // 슬개골탈구 진단 여부를 선택할 수 있는 함수
  Widget _buildNeuteringOptions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildPatellaDiagnosisButton('있어요', patellaDiagnosisStatus == '있어요',
            () {
          setState(() {
            patellaDiagnosisStatus = '있어요';
          });
        }, Icons.radio_button_unchecked, Colors.green), // "있어요" 버튼에 초록색 빈 동그라미

        const SizedBox(width: 12),

        _buildPatellaDiagnosisButton('없어요', patellaDiagnosisStatus == '없어요',
            () {
          setState(() {
            patellaDiagnosisStatus = '없어요';
            patellaSeverityStatus = '';
          });
        }, Icons.clear, Colors.red), // "없어요" 버튼에 빨간색 X 아이콘
      ],
    );
  }

  // 슬개골탈구 기수 선택 버튼을 만드는 함수
  Widget _buildPatellaSeverityButton(
      String title, bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 310,
        height: 50,
        decoration: BoxDecoration(
          color: isSelected
              ? const Color.fromRGBO(76, 126, 255, 0.2) // 선택된 버튼의 배경색
              : Colors.transparent, // 기본 배경은 투명
          border: Border.all(
            color:
                isSelected ? const Color(0xFF4E7EFF) : const Color(0xFFDAE4FF),
            width: isSelected ? 2.5 : 1.5,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.symmetric(vertical: 6.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontSize: 16,
                fontFamily: 'Pretendard-Medium',
              ),
            ),
          ),
        ),
      ),
    );
  }

  // 슬개골탈구 기수 선택 영역을 위한 부모 Container
  Widget _buildPatellaSeverityOptions() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF6F7FB), // 전체 배경색
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          _buildPatellaSeverityButton('1기 이하', patellaSeverityStatus == '1기 이하',
              () {
            setState(() {
              patellaSeverityStatus = '1기 이하';
            });
          }),
          _buildPatellaSeverityButton('2기 이하', patellaSeverityStatus == '2기 이하',
              () {
            setState(() {
              patellaSeverityStatus = '2기 이하';
            });
          }),
          _buildPatellaSeverityButton('3기 이하', patellaSeverityStatus == '3기 이하',
              () {
            setState(() {
              patellaSeverityStatus = '3기 이하';
            });
          }),
          _buildPatellaSeverityButton('4기 이하', patellaSeverityStatus == '4기 이하',
              () {
            setState(() {
              patellaSeverityStatus = '4기 이하';
            });
          }),
        ],
      ),
    );
  }

  // 체크박스와 텍스트를 포함한 위젯을 만드는 함수
  Widget _buildSymptomCheckbox(
      String text, bool isChecked, ValueChanged<bool?> onChanged) {
    return SizedBox(
      width: 320,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12), // 아래쪽 여백 추가
        child: Row(
          children: [
            // 체크박스
            Theme(
              data: Theme.of(context).copyWith(
                unselectedWidgetColor: const Color(0xFF4E7EFF), // 체크박스 색상
              ),
              child: Checkbox(
                value: isChecked,
                onChanged: onChanged,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5), // 둥글게 만들기
                ),
                activeColor: const Color(0xFF4E7EFF), // 체크 시 색상
              ),
            ),
            Expanded(
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 16,
                  fontFamily: 'Pretendard-Medium',
                ),
              ),
            ),
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
                          Homefitnesscheckstep1(name: widget.name),
                    ),
                  );
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

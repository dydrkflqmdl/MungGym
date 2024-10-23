import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mung_gym/startPage/firstPage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // 시뮬레이션 디버그 로고 제거
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF436EE1),
      body: Center(
        child: Container(
          // 모바일 화면 비율 안에만 배경색 설정
          color: const Color(0xFF436EE1),
          // 스크롤 가능하도록 설정
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "내가 바로\n우리 강아지의 전문가!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 26,
                    fontFamily: 'Pretendard-Bold',
                    // 텍스트 색상 (화이트)
                    color: Colors.white,
                  ),
                ),
                // 간격
                const SizedBox(height: 20),
                const Text(
                  "하루 3분,\n우리 집 막둥이를 위한\n시간을 가져보세요!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 26,
                    fontFamily: 'Pretendard-Bold',
                    color: Colors.white,
                  ),
                ),
                // 간격
                const SizedBox(height: 40),
                Image.asset(
                  'assets/images/dog.png',
                  width: 302,
                  height: 299,
                ),

                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.only(bottom: .0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Firstpage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      // 버튼 배경색
                      backgroundColor: Colors.white,
                      // 최소 크기 설정
                      minimumSize: const Size(350, 58),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      "시작하자",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Pretendard-SemiBold',
                        color: Color(0xFF000000), // 텍스트 색상 (블랙)
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

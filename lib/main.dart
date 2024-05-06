import 'package:final_2024_1/ApplicationPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '사용자 정보 수집 앱',
      theme: ThemeData(
        primarySwatch: Colors.indigo, // 앱 전반에 사용될 기본 색상을 변경합니다.
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.indigo, secondary: Colors.amber), // 보조 색상 추가
        useMaterial3: true, // Material Design 3 사용
        inputDecorationTheme: InputDecorationTheme(
          // TextField 디자인을 위한 테마
          border: OutlineInputBorder(
            // 테두리 스타일
            borderRadius: BorderRadius.circular(8.0),
          ),
          filled: true, // 배경색 사용
          fillColor: Colors.indigo.shade50, // 배경색 지정
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          // FAB 디자인
          backgroundColor: Colors.indigo, // FAB 배경색
          foregroundColor: Colors.white, // FAB 아이콘 및 텍스트 색상
        ),
      ),
      home: const FirstPage(),
    );
  }
}

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("이름 입력"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            controller: _nameController,
            decoration: const InputDecoration(
              labelText: '이름을 입력해주세요!',
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      SecondPage(name: _nameController.text)));
        },
        tooltip: '다음',
        child: const Icon(Icons.navigate_next),
      ),
    );
  }
}

class SecondPage extends StatefulWidget {
  final String name;
  const SecondPage({super.key, required this.name});

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final TextEditingController _ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("나이 입력"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            controller: _ageController,
            decoration: const InputDecoration(
              labelText: '나이를 입력해주세요!',
            ),
            keyboardType: TextInputType.number,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      ThirdPage(name: widget.name, age: _ageController.text)));
        },
        tooltip: '다음',
        child: const Icon(Icons.navigate_next),
      ),
    );
  }
}

class ThirdPage extends StatefulWidget {
  final String name;
  final String age;
  const ThirdPage({super.key, required this.name, required this.age});

  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  final TextEditingController _hobbyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("취미 입력"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            controller: _hobbyController,
            decoration: const InputDecoration(
              labelText: '취미를 입력해주세요!',
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ResultPage(
                      name: widget.name,
                      age: widget.age,
                      hobby: _hobbyController.text)));
        },
        tooltip: '완료',
        child: const Icon(Icons.done),
      ),
    );
  }
}

class ResultPage extends StatelessWidget {
  final String name;
  final String age;
  final String hobby;

  const ResultPage(
      {super.key, required this.name, required this.age, required this.hobby});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("결과"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "제공해주신 정보를 바탕으로 작성된 \n자기소개서 입니다!",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.0), // 텍스트 사이의 간격을 추가합니다.
              Text(
                "이름: $name\n나이: $age\n취미: $hobby",
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 40.0),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ApplicationPage()),
                  );
                },
                child: Text(
                  "지금 자기소개서 가지고 \n일 지원해보기",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

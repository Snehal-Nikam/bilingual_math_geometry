import 'package:flutter/material.dart';
import 'angleSectionPage.dart';
void main() {
  runApp(AnglesPracticeQuiz());
}

class AnglesPracticeQuiz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Angles Quiz',
      debugShowCheckedModeBanner: false,
      home: QuizPage(),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _score = 0;
  int _questionIndex = 0;
  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'What is the measure of a right angle?',
      'answers': [
        {'text': '90 degrees', 'correct': true},
        {'text': '180 degrees', 'correct': false},
        {'text': '45 degrees', 'correct': false},
      ],
    },
    {
      'question': 'What are angles that have the same measure?',
      'answers': [
        {'text': 'Complementary angles', 'correct': false},
        {'text': 'Congruent angles', 'correct': true},
        {'text': 'Supplementary angles', 'correct': false},
      ],
    },
    {
      'question': 'What is the sum of angles in a triangle?',
      'answers': [
        {'text': '180 degrees', 'correct': true},
        {'text': '90 degrees', 'correct': false},
        {'text': '360 degrees', 'correct': false},
      ],
    },
  ];

  void _answerQuestion(bool isCorrect) {
    if (isCorrect) {
      setState(() {
        _score++;
      });
    }
    setState(() {
      _questionIndex++;
    });
  }

  void _resetQuiz() {
    setState(() {
      _score = 0;
      _questionIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Triangles Quiz'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // Add back arrow icon
          onPressed: () {
            Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => AnglesSectionsPage()), // Navigate back to PAGE2.dart
                ); // Navigate back when arrow is pressed
              },
            ),
      ),
      body: _questionIndex < _questions.length
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  _questions[_questionIndex]['question'],
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20.0),
                ...(_questions[_questionIndex]['answers'] as List<Map<String, dynamic>>).map((answer) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ElevatedButton(
                      onPressed: () => _answerQuestion(answer['correct']),
                      child: Text(answer['text']),
                    ),
                  );
                }).toList(),
              ],
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Quiz Completed!',
                    style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'Your Score: $_score/${_questions.length}',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: _resetQuiz,
                    child: Text('Restart Quiz'),
                  ),
                ],
              ),
            ),
    );
  }
}
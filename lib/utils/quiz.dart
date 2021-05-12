import './question.dart';

class Quiz {
  List<Questions> _questions;
  int _currentQuestionIndex = 0;
  int _score;

  Quiz(this._questions) {
    _questions.shuffle();
  }

  List<Questions> get questions => _questions;
  int get length => _questions.length;
  int get questionNumber => _currentQuestionIndex++;
  int get score => _score;

  Questions get nextQuestion {
    _currentQuestionIndex++;
    if (_currentQuestionIndex >= length) {
      return null;
    }
    return _questions[_currentQuestionIndex];
  }

  void answer(bool isCorrect) {
    if (isCorrect) {
      _score = _score + 1;
    }
  }
}

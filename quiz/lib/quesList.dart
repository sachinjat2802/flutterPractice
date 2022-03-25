// ignore: file_names
import 'ques.dart';

class QuesList {
  final List<Ques> _quesAns = <Ques>[
    Ques(
        ques: 'By default, npm installs any dependency in the global mode.',
        ans: 'false'),
    Ques(
        ques:
            'A stream fires finish event when all data has been flushed to underlying system.',
        ans: 'true'),
    Ques(
        ques:
            'The buffer class is a global class that can be accessed without importing a buffer module.',
        ans: 'true'),
    Ques(ques: 'Is Node.js multithreaded?.', ans: 'true'),
  ];

  int _index = 0;

  void nextQues() {
    if (_index < _quesAns.length - 1) {
      _index++;
    }
  }

  void reset() {
    _index = 0;
  }

  bool isFinish() {
    if (_index >= _quesAns.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  String getQues() {
    return _quesAns[_index].ques;
  }

  String getAns() {
    return _quesAns[_index].ans;
  }
}

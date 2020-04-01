import 'package:corona/models/global.dart';
import 'package:corona/repositories/corona_repository.dart';
import 'package:rxdart/rxdart.dart';

class GlobalBloc {
  final CoronaRepository _repository;

  final _globalController = BehaviorSubject<List<Global>>.seeded([]);

  // output
  Stream<List<Global>> get globalStream => _globalController.stream;

  // input
  dynamic get changeGlobal => _globalController.sink.add;

  GlobalBloc(this._repository) {
    _getGlobal();
  }

  Future<void> _getGlobal() async {
    _repository
        .getGlobalVictims()
        .then((value) => changeGlobal(value))
        .catchError((er) => print('error - $er'))
        .whenComplete(() => print('Global Complete'));
  }

  void dispose() {
    _globalController.close();
  }
}

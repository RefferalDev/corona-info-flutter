import 'package:corona/models/global.dart';
import 'package:corona/models/global_total.dart';
import 'package:corona/repositories/corona_repository.dart';
import 'package:rxdart/rxdart.dart';

class GlobalBloc {
  final CoronaRepository _repository;

  final _globalController = BehaviorSubject<List<Global>>.seeded([]);
  final _globalPositifController = BehaviorSubject<GlobalTotal>();
  final _globalRecoveredController = BehaviorSubject<GlobalTotal>();
  final _globalDiedController = BehaviorSubject<GlobalTotal>();

  // output
  Stream<List<Global>> get globalStream => _globalController.stream;
  Stream<GlobalTotal> get positifStream => _globalPositifController.stream;
  Stream<GlobalTotal> get recoveredStream => _globalRecoveredController.stream;
  Stream<GlobalTotal> get diedStream => _globalDiedController.stream;

  // input
  dynamic get changeGlobal => _globalController.sink.add;
  Function(GlobalTotal) get changePositif => _globalPositifController.sink.add;
  Function(GlobalTotal) get changeRecovered => _globalRecoveredController.sink.add;
  Function(GlobalTotal) get changeDied => _globalDiedController.sink.add;

  GlobalBloc(this._repository) {
    _getGlobal();
    _getGlobalTotal(Status.POSITIF);
    _getGlobalTotal(Status.RECOVERED);
    _getGlobalTotal(Status.DIED);
  }

  Future<void> _getGlobal() async {
    _repository
        .getGlobalVictims()
        .then((value) => changeGlobal(value))
        .catchError((er) => print('error - $er'))
        .whenComplete(() => print('Global Complete'));
  }

  Future<void> _getGlobalTotal(Status status) async {
    _repository.getGlobalTotal(status: globalStatus(status))
    .then((value) {
      switch (status) {
        case Status.POSITIF:
          changePositif(value);
          break;
        case Status.RECOVERED:
          changeRecovered(value);
          break;
        case Status.DIED:
          changeDied(value);
          break;
        default:
          changePositif(value);
      }
    });
  }

  void dispose() {
    _globalController.close();
    _globalPositifController.close();
    _globalRecoveredController.close();
    _globalDiedController.close();
  }
}

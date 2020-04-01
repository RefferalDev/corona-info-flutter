import 'package:corona/models/indo_victims.dart';
import 'package:corona/models/summary_indonesia.dart';
import 'package:corona/repositories/corona_repository.dart';
import 'package:rxdart/subjects.dart';

class HomeBloc {
  final CoronaRepository _repository;

  final _summaryController = BehaviorSubject<IndonesiaSummary>();
  final _victimsIndoController = BehaviorSubject<List<IndoVictims>>.seeded([]);

  // output
  Stream<IndonesiaSummary> get summaryIndoStream => _summaryController.stream;
  Stream<List<IndoVictims>> get victimsIndoStream =>
      _victimsIndoController.stream;

  // input
  dynamic get changeSummary => _summaryController.sink.add;
  dynamic get changeVictimcIndo => _victimsIndoController.sink.add;

  HomeBloc(this._repository) {
    _getIndonesiaSummary();
    _getIndoVictims();
  }

  Future<void> _getIndonesiaSummary() async {
    _repository
        .getIndonesiaSummary()
        .then((value) => changeSummary(value))
        .catchError((er) => print('error - $er'))
        .whenComplete(() => print('Summary Complete'));
  }

  Future<void> _getIndoVictims() async {
    _repository
        .getIndonesiaVictims()
        .then((value) => changeVictimcIndo(value))
        .catchError((er) => print('Error - $er'))
        .whenComplete(() => print('Victims Complete'));
  }

  void dispose() {
    _summaryController.close();
    _victimsIndoController.close();
  }
}

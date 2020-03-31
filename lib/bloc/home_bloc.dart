

import 'package:corona/models/summary_indonesia.dart';
import 'package:corona/repositories/corona_repository.dart';
import 'package:rxdart/subjects.dart';

class HomeBloc {

  final CoronaRepository _repository;

  final _summaryController = BehaviorSubject<IndonesiaSummary>();

  // output
  Stream<IndonesiaSummary> get summaryIndoStream => _summaryController.stream;

  // input
  dynamic get changeSummary => _summaryController.sink.add;

  HomeBloc(this._repository){
    _getIndonesiaSummary();
  }

  Future<void> _getIndonesiaSummary() async {
    _repository.getIndonesiaSummary().then((value) {
      changeSummary(value);
    }).catchError((er) {
      print('error - $er');
    }).whenComplete(() {
      print('complete');
    });
  }

  void dispose(){
    _summaryController.close();
  }

}
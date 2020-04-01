import 'package:corona/models/indo_province.dart';
import 'package:corona/models/indo_victims.dart';
import 'package:corona/models/summary_indonesia.dart';
import 'package:corona/services/network_client.dart';
import 'package:dio/dio.dart';

class CoronaRepository {
  final NetworkClient _client;

  CoronaRepository(client) : _client = client;

  Future<IndonesiaSummary> getIndonesiaSummary() async {
    Response data = await _client.get(url: 'indonesia');
    return IndonesiaSummary.fromJson(data.data[0]);
  }

  Future<List<IndoVictims>> getIndonesiaVictims() async {
    Response data = await _client.get(url: 'indonesia/provinsi');
    return (data.data as List).map<IndoVictims>((json) {
      IndoVictims _data = IndoVictims.fromJson(json);
      IndoProvince _province = IndoProvince.dataProvince().firstWhere(
              (element) => element.provinceId == _data.attributes.kodeProvi) ??
          null;
      if (_province != null) {
        _data.attributes.latitude = _province.latitude;
        _data.attributes.longitude = _province.longitude;
      }
      return _data;
    }).toList();
  }
}

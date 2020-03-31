

import 'package:corona/models/summary_indonesia.dart';
import 'package:corona/services/network_client.dart';
import 'package:dio/dio.dart';

class CoronaRepository {

  final NetworkClient _client;

  CoronaRepository(client): _client = client;

  Future<IndonesiaSummary> getIndonesiaSummary() async {
    Response data = await _client.get(url: 'indonesia');
    return IndonesiaSummary.fromJson(data.data[0]);
  }


}
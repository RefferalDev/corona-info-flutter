
import 'dart:convert';

class IndonesiaSummary {
  String name = '';
  String positif = '0';
  String sembuh = '0';
  String meninggal = '0';

  IndonesiaSummary({this.name, this.positif, this.sembuh, this.meninggal});

  IndonesiaSummary.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    positif = json['positif'] ?? '0';
    sembuh = json['sembuh'] ?? '0';
    meninggal = json['meninggal'] ?? '0';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['positif'] = this.positif;
    data['sembuh'] = this.sembuh;
    data['meninggal'] = this.meninggal;
    return data;
  }

  static List<IndonesiaSummary> summaryFromList(String response) {
    var parsed = json.decode(response) as List;
    var list = parsed.map((i) => IndonesiaSummary.fromJson(i)).toList();
    return list;
  }

}
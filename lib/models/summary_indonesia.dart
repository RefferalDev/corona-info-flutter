
import 'dart:convert';

class IndonesiaSummary {
  String name;
  String positif;
  String sembuh;
  String meninggal;

  IndonesiaSummary({this.name, this.positif, this.sembuh, this.meninggal});

  IndonesiaSummary.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    positif = json['positif'];
    sembuh = json['sembuh'];
    meninggal = json['meninggal'];
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
enum Status { POSITIF, RECOVERED, DIED }

globalStatus(Status status) {
  switch (status) {
    case Status.POSITIF:
      return 'positif';
    case Status.RECOVERED:
      return 'sembuh';
    case Status.DIED:
      return 'meninggal';
    default:
      return "positif";
  }
}

class Global {
  AttributesGlobal attributes;

  Global({this.attributes});

  Global.fromJson(Map<String, dynamic> json) {
    attributes = json['attributes'] != null
        ? new AttributesGlobal.fromJson(json['attributes'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.attributes != null) {
      data['attributes'] = this.attributes.toJson();
    }
    return data;
  }
}

class AttributesGlobal {
  int oBJECTID;
  String countryRegion;
  int lastUpdate;
  double lat;
  double long;
  int confirmed;
  int deaths;
  int recovered;
  int active;

  AttributesGlobal(
      {this.oBJECTID,
      this.countryRegion,
      this.lastUpdate,
      this.lat,
      this.long,
      this.confirmed,
      this.deaths,
      this.recovered,
      this.active});

  AttributesGlobal.fromJson(Map<String, dynamic> json) {
    oBJECTID = json['OBJECTID'];
    countryRegion = json['Country_Region'];
    lastUpdate = json['Last_Update'];
    lat = json['Lat'].toDouble() ?? 0.0;
    long = json['Long_'].toDouble() ?? 0.0;
    confirmed = json['Confirmed'];
    deaths = json['Deaths'];
    recovered = json['Recovered'];
    active = json['Active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['OBJECTID'] = this.oBJECTID;
    data['Country_Region'] = this.countryRegion;
    data['Last_Update'] = this.lastUpdate;
    data['Lat'] = this.lat;
    data['Long_'] = this.long;
    data['Confirmed'] = this.confirmed;
    data['Deaths'] = this.deaths;
    data['Recovered'] = this.recovered;
    data['Active'] = this.active;
    return data;
  }
}

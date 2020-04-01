import 'package:flutter/material.dart';

class IndoProvince {
  final int provinceId;
  final String provinceName;
  final double latitude;
  final double longitude;

  IndoProvince(
      {@required this.provinceId,
      @required this.provinceName,
      @required this.latitude,
      @required this.longitude});

  static List<IndoProvince> dataProvince() {
    final data = [
      IndoProvince(
          provinceId: 11,
          provinceName: "Aceh",
          latitude: 4.695135,
          longitude: 96.749397),
      IndoProvince(
          provinceId: 12,
          provinceName: "Sumatera Utara",
          latitude: 3.585242,
          longitude: 98.675598),
      IndoProvince(
          provinceId: 13,
          provinceName: "Sumatera Barat",
          latitude: -0.953730,
          longitude: 100.351990),
      IndoProvince(
          provinceId: 14,
          provinceName: "Riau",
          latitude: 0.293347,
          longitude: 101.706818),
      IndoProvince(
          provinceId: 15,
          provinceName: "Jambi",
          latitude: -1.485180,
          longitude: 102.438049),
      IndoProvince(
          provinceId: 16,
          provinceName: "Sumatera Selatan",
          latitude: -2.991100,
          longitude: 104.756729),
      IndoProvince(
          provinceId: 17,
          provinceName: "Bengkulu",
          latitude: -3.800640,
          longitude: 102.256203),
      IndoProvince(
          provinceId: 18,
          provinceName: "Lampung",
          latitude: -4.558580,
          longitude: 105.406799),
      IndoProvince(
          provinceId: 19,
          provinceName: "Kepulauan Bangka Belitung",
          latitude: -2.741050,
          longitude: 106.440582),
      IndoProvince(
          provinceId: 21,
          provinceName: "Kepulauan Riau",
          latitude: 1.082828,
          longitude: 104.030449),
      IndoProvince(
          provinceId: 31,
          provinceName: "DKI Jakarta",
          latitude: -6.211540,
          longitude: 106.845169),
      IndoProvince(
          provinceId: 32,
          provinceName: "Jawa Barat",
          latitude: -6.914740,
          longitude: 107.609810),
      IndoProvince(
          provinceId: 33,
          provinceName: "Jawa Tengah",
          latitude: -6.966660,
          longitude: 110.416656),
      IndoProvince(
          provinceId: 34,
          provinceName: "DI Yogyakarta",
          latitude: -7.797220,
          longitude: 110.368790),
      IndoProvince(
          provinceId: 35,
          provinceName: "Jawa Timur",
          latitude: -7.289160,
          longitude: 112.734390),
      IndoProvince(
          provinceId: 36,
          provinceName: "Banten",
          latitude: -6.120090,
          longitude: 106.150291),
      IndoProvince(
          provinceId: 51,
          provinceName: "Bali",
          latitude: -8.656290,
          longitude: 115.222092),
      IndoProvince(
          provinceId: 52,
          provinceName: "Nusa Tenggara Barat",
          latitude: -8.583330,
          longitude: 116.116661),
      IndoProvince(
          provinceId: 53,
          provinceName: "Nusa Tenggara Timur",
          latitude: -10.172400,
          longitude: 123.577904),
      IndoProvince(
          provinceId: 61,
          provinceName: "Kalimantan Barat",
          latitude: -0.022520,
          longitude: 109.330299),
      IndoProvince(
          provinceId: 62,
          provinceName: "Kalimantan Tengah",
          latitude: -2.226660,
          longitude: 113.944160),
      IndoProvince(
          provinceId: 63,
          provinceName: "Kalimantan Selatan",
          latitude: -3.328490,
          longitude: 114.589203),
      IndoProvince(
          provinceId: 64,
          provinceName: "Kalimantan Timur",
          latitude: -1.265380,
          longitude: 116.831200),
      IndoProvince(
          provinceId: 65,
          provinceName: "Kalimantan Utara",
          latitude: 2.850000,
          longitude: 117.383331),
      IndoProvince(
          provinceId: 71,
          provinceName: "Sulawesi Utara",
          latitude: 1.493056,
          longitude: 124.841263),
      IndoProvince(
          provinceId: 72,
          provinceName: "Sulawesi Tengah",
          latitude: -0.898580,
          longitude: 119.850601),
      IndoProvince(
          provinceId: 73,
          provinceName: "Sulawesi Selatan",
          latitude: -5.133330,
          longitude: 119.416656),
      IndoProvince(
          provinceId: 74,
          provinceName: "Sulawesi Tenggara",
          latitude: -3.967480,
          longitude: 122.594704),
      IndoProvince(
          provinceId: 75,
          provinceName: "Gorontalo",
          latitude: 0.552512,
          longitude: 123.065491),
      IndoProvince(
          provinceId: 76,
          provinceName: "Sulawesi Barat",
          latitude: -2.699190,
          longitude: 118.862106),
      IndoProvince(
          provinceId: 81,
          provinceName: "Maluku",
          latitude: -3.656070,
          longitude: 128.166412),
      IndoProvince(
          provinceId: 82,
          provinceName: "Maluku Utara",
          latitude: 0.788068,
          longitude: 127.377151),
      IndoProvince(
          provinceId: 91,
          provinceName: "Papua Barat",
          latitude: -0.861520,
          longitude: 134.078796),
      IndoProvince(
          provinceId: 94,
          provinceName: "Papua",
          latitude: -2.541360,
          longitude: 140.706390),
    ];
    return data;
  }
}

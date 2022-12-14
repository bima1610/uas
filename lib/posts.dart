import 'dart:convert';

class Posts {
  String id_kontrakan;
  String foto;
  String kamar_mandi;
  String kamar_tidur;
  String garasi;
  String no_telpon;
  String alamat;
  String harga;

  Posts({required this.id_kontrakan, required this.foto, required this.kamar_mandi, required this.kamar_tidur, required this.garasi,
  required this.no_telpon, required this.alamat, required this.harga});
  factory Posts.fromJson(Map<String, dynamic> json) {
    return Posts(id_kontrakan: json['id_kontrakan'], foto: json['foto'], kamar_mandi: json['kamar_mandi'], kamar_tidur: json['kamar_tidur'],
        garasi: json['garasi'], no_telpon: json['no_telpon'], alamat: json['alamat'], harga: json['harga']);
  }
}
// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class ScontrinoModel extends Equatable {
  final String descrizione;
  final String iva;
  final double quantita;
  final double totale;
  const ScontrinoModel({
    required this.descrizione,
    required this.iva,
    required this.quantita,
    required this.totale,
  });

  @override
  // TODO: implement props
  List<Object> get props => [descrizione, iva, quantita, totale];

  ScontrinoModel copyWith({
    String? descrizione,
    String? iva,
    double? quantita,
    double? totale,
  }) {
    return ScontrinoModel(
      descrizione: descrizione ?? this.descrizione,
      iva: iva ?? this.iva,
      quantita: quantita ?? this.quantita,
      totale: totale ?? this.totale,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'descrizione': descrizione,
      'iva': iva,
      'quantita': quantita,
      'totale': totale,
    };
  }

  factory ScontrinoModel.fromMap(Map<String, dynamic> map) {
    return ScontrinoModel(
      descrizione: map['descrizione'] as String,
      iva: map['iva'] as String,
      quantita: map['quantita'] as double,
      totale: map['totale'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory ScontrinoModel.fromJson(String source) =>
      ScontrinoModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'scontrino_bloc.dart';

class ScontrinoState extends Equatable {
  final List<ScontrinoModel> scontrino;
  final double? quantita;
  final double? prezzo;
  ScontrinoState(
      {required this.scontrino, this.quantita = 1.0, this.prezzo = 0.0});

  @override
  // TODO: implement props
  List<Object?> get props => [scontrino, quantita, prezzo];

  ScontrinoState copyWith({
    List<ScontrinoModel>? scontrino,
    double? quantita,
    double? prezzo,
  }) {
    return ScontrinoState(
      scontrino: scontrino ?? this.scontrino,
      quantita: quantita ?? this.quantita,
      prezzo: prezzo ?? this.prezzo,
    );
  }
}

class ScontrinoInitial extends ScontrinoState {
  ScontrinoInitial({required super.scontrino});
}

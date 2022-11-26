// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'scontrino_bloc.dart';

abstract class ScontrinoEvent extends Equatable {
  const ScontrinoEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AddToScontrino extends ScontrinoEvent {
  final String descrizione;
  AddToScontrino({
    required this.descrizione,
  });
  @override
  // TODO: implement props
  List<Object?> get props => [descrizione];
}

class RemoveToScontrino extends ScontrinoEvent {}

class EditToScontrino extends ScontrinoEvent {}

class EditQta extends ScontrinoEvent {}

class EditPrezzo extends ScontrinoEvent {
  final double prezzo;
  EditPrezzo({
    required this.prezzo,
  });
  @override
  // TODO: implement props
  List<Object?> get props => [prezzo];
}

class ClearPrezzo extends ScontrinoEvent {}

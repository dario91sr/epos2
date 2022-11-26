import 'package:bloc/bloc.dart';
import 'package:epos2/models/scontrinoModel.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'scontrino_event.dart';
part 'scontrino_state.dart';

class ScontrinoBloc extends Bloc<ScontrinoEvent, ScontrinoState> {
  ScontrinoBloc() : super(ScontrinoState(scontrino: const [])) {
    on<EditQta>((event, emit) {
      var qtaFromString = state.prezzo;
      var prezzoFromString = 0.0;

      emit(ScontrinoState(
          scontrino: state.scontrino,
          prezzo: prezzoFromString,
          quantita: qtaFromString));
    });
    on<EditPrezzo>((event, emit) {
      var prezzo = (state.prezzo! * 10) + event.prezzo;
      emit(ScontrinoState(
          scontrino: state.scontrino,
          prezzo: prezzo,
          quantita: state.quantita));
    });

    on<AddToScontrino>((event, emit) {
      var riga = ScontrinoModel(
          descrizione: "Reparto " + event.descrizione,
          iva: event.descrizione,
          quantita: state.quantita!,
          totale: state.prezzo!);

      List<ScontrinoModel> scontrino = [...state.scontrino];
      scontrino.insert(0, riga); //scontrino.add(riga);
      emit(ScontrinoState(scontrino: scontrino, prezzo: 0, quantita: 1));
    });

    on<ClearPrezzo>((event, emit) => emit(
        ScontrinoState(scontrino: state.scontrino, quantita: 1, prezzo: 0)));
  }
}

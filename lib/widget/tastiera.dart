import 'package:epos2/bloc/scontrino_bloc.dart';
import 'package:epos2/venditaScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Tastiera extends StatefulWidget {
  const Tastiera({super.key});

  @override
  State<Tastiera> createState() => _TastieraState();
}

class _TastieraState extends State<Tastiera> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Bottone(
              testo: "7",
              colore: Colors.grey,
              premi: () =>
                  context.read<ScontrinoBloc>().add(EditPrezzo(prezzo: 7)),
            ),
            Bottone(
              testo: "8",
              colore: Colors.grey,
              premi: () =>
                  context.read<ScontrinoBloc>().add(EditPrezzo(prezzo: 8)),
            ),
            Bottone(
              testo: "9",
              colore: Colors.grey,
              premi: () =>
                  context.read<ScontrinoBloc>().add(EditPrezzo(prezzo: 9)),
            ),
            Bottone(
              testo: "CL",
              colore: Colors.grey,
              premi: () => context.read<ScontrinoBloc>().add(ClearPrezzo()),
            ),
            Bottone(
              testo: "22%",
              colore: Colors.green,
              premi: () => context
                  .read<ScontrinoBloc>()
                  .add(AddToScontrino(descrizione: "22")),
            ),
            BottoneDiChiusura(
              testo: "SUBTOTALE",
              colore: Colors.red,
              premi: () =>
                  context.read<ScontrinoBloc>().add(EditPrezzo(prezzo: 0)),
            ),
          ],
        ),
        Row(
          children: [
            Bottone(
              testo: "4",
              colore: Colors.grey,
              premi: () =>
                  context.read<ScontrinoBloc>().add(EditPrezzo(prezzo: 4)),
            ),
            Bottone(
              testo: "5",
              colore: Colors.grey,
              premi: () =>
                  context.read<ScontrinoBloc>().add(EditPrezzo(prezzo: 5)),
            ),
            Bottone(
              testo: "6",
              colore: Colors.grey,
              premi: () =>
                  context.read<ScontrinoBloc>().add(EditPrezzo(prezzo: 6)),
            ),
            Bottone(
              testo: "X",
              colore: Colors.grey,
              premi: () => context.read<ScontrinoBloc>().add(EditQta()),
            ),
            Bottone(
              testo: "10%",
              colore: Colors.green,
              premi: () => context
                  .read<ScontrinoBloc>()
                  .add(AddToScontrino(descrizione: "10")),
            ),
            BottoneDiChiusura(
              testo: "NON RISCOSSO",
              colore: Colors.red,
              premi: () =>
                  context.read<ScontrinoBloc>().add(EditPrezzo(prezzo: 0)),
            ),
          ],
        ),
        Row(
          children: [
            Bottone(
              testo: "1",
              colore: Colors.grey,
              premi: () =>
                  context.read<ScontrinoBloc>().add(EditPrezzo(prezzo: 1)),
            ),
            Bottone(
              testo: "2",
              colore: Colors.grey,
              premi: () =>
                  context.read<ScontrinoBloc>().add(EditPrezzo(prezzo: 2)),
            ),
            Bottone(
              testo: "3",
              colore: Colors.grey,
              premi: () =>
                  context.read<ScontrinoBloc>().add(EditPrezzo(prezzo: 3)),
            ),
            Bottone(
              testo: "Sc",
              colore: Colors.yellow,
              premi: () =>
                  context.read<ScontrinoBloc>().add(EditPrezzo(prezzo: 0)),
            ),
            Bottone(
              testo: "5%",
              colore: Colors.green,
              premi: () => context
                  .read<ScontrinoBloc>()
                  .add(AddToScontrino(descrizione: "22")),
            ),
            BottoneDiChiusura(
              testo: "ELETTRONICO",
              colore: Colors.red,
              premi: () =>
                  context.read<ScontrinoBloc>().add(EditPrezzo(prezzo: 0)),
            ),
          ],
        ),
        Row(
          children: [
            Bottone(
              testo: "0",
              colore: Colors.grey,
              premi: () =>
                  context.read<ScontrinoBloc>().add(EditPrezzo(prezzo: 0)),
            ),
            Bottone(
              testo: "00",
              colore: Colors.grey,
              premi: () =>
                  context.read<ScontrinoBloc>().add(EditPrezzo(prezzo: 0)),
            ),
            Bottone(
              testo: ",",
              colore: Colors.grey,
              premi: () =>
                  context.read<ScontrinoBloc>().add(EditPrezzo(prezzo: 0)),
            ),
            Bottone(
              testo: "Lot",
              colore: Colors.yellow,
              premi: () =>
                  context.read<ScontrinoBloc>().add(EditPrezzo(prezzo: 0)),
            ),
            Bottone(
              testo: "4%",
              colore: Colors.green,
              premi: () => context
                  .read<ScontrinoBloc>()
                  .add(AddToScontrino(descrizione: "4")),
            ),
            BottoneDiChiusura(
              testo: "CONTANTI",
              colore: Colors.red,
              premi: () =>
                  context.read<ScontrinoBloc>().add(EditPrezzo(prezzo: 0)),
            ),
          ],
        ),
      ],
    );
  }
}

class Bottone extends StatefulWidget {
  final String testo;
  final Color colore;
  final Function? premi;

  const Bottone(
      {super.key,
      required this.testo,
      required this.colore,
      required this.premi});

  @override
  State<Bottone> createState() => _BottoneState();
}

class _BottoneState extends State<Bottone> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: GestureDetector(
        onTap: () {
          widget.premi!();
        },
        child: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: widget.colore,
            borderRadius: BorderRadius.circular(9),
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: 50,
              minHeight: 50,
            ),
            child: Center(
                child: Text(
              this.widget.testo,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            )),
          ),
        ),
      ),
    );
  }
}

class BottoneDiChiusura extends StatefulWidget {
  final String testo;
  final Color colore;
  final Function? premi;

  const BottoneDiChiusura(
      {super.key,
      required this.testo,
      required this.colore,
      required this.premi});

  @override
  State<BottoneDiChiusura> createState() => _BottoneDiChiusuraState();
}

class _BottoneDiChiusuraState extends State<BottoneDiChiusura> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: GestureDetector(
          onTap: () {
            widget.premi!();
          },
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              color: widget.colore,
              borderRadius: BorderRadius.circular(9),
            ),
            child: Center(
                child: Text(
              this.widget.testo,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            )),
          ),
        ),
      ),
    );
  }
}

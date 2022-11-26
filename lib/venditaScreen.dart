import 'package:epos2/bloc/scontrino_bloc.dart';
import 'package:epos2/widget/tastiera.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VenditaScreen extends StatefulWidget {
  const VenditaScreen({super.key});

  @override
  State<VenditaScreen> createState() => _VenditaScreenState();
}

class _VenditaScreenState extends State<VenditaScreen> {
  double totaleScontrino = 0.0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ScontrinoBloc(),
      child: Scaffold(
          appBar: AppBar(
            title: Text("E-POS 2.0"),
          ),
          body: BlocBuilder<ScontrinoBloc, ScontrinoState>(
            builder: (context, state) {
              return Stack(
                  // fit: StackFit.expand,
                  children: [
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(9),
                                  color: Colors.white,
                                ),
                                width: MediaQuery.of(context).size.width / 1.6,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        state.quantita.toString(),
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      const Text(
                                        "x",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        state.prezzo.toString(),
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            "Scontrino",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: Colors.blue,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "Quantita'",
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        "Descrizione",
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        "Prezzo",
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        "Totale",
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                            fit: FlexFit.tight,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListView.builder(
                                  reverse: true,
                                  dragStartBehavior: DragStartBehavior.start,
                                  shrinkWrap: true,
                                  itemCount: state.scontrino.length,
                                  itemBuilder: (BuildContext context,
                                          int index) =>
                                      Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.black
                                                    .withOpacity(0.2)),
                                            borderRadius:
                                                BorderRadius.circular(6)),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 12, horizontal: 1),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  state
                                                      .scontrino[index].quantita
                                                      .toString(),
                                                  style:
                                                      TextStyle(fontSize: 16),
                                                ),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  state.scontrino[index]
                                                      .descrizione
                                                      .toString(),
                                                  style:
                                                      TextStyle(fontSize: 16),
                                                ),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  "€ " +
                                                      state.scontrino[index]
                                                          .totale
                                                          .toString(),
                                                  style:
                                                      TextStyle(fontSize: 16),
                                                ),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  "€ " +
                                                      (state.scontrino[index]
                                                                  .totale *
                                                              state
                                                                  .scontrino[
                                                                      index]
                                                                  .quantita)
                                                          .toString(),
                                                  style:
                                                      TextStyle(fontSize: 16),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: Colors.blue,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "N.Righe:" +
                                            state.scontrino.length.toString(),
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ),
                                    Expanded(
                                      child: BlocListener<ScontrinoBloc,
                                          ScontrinoState>(
                                        listener: (context, state) {
                                          totaleScontrino = 0;

                                          for (var index = 0;
                                              index < state.scontrino.length;
                                              index++) {
                                            totaleScontrino = totaleScontrino +
                                                (state.scontrino[index].totale *
                                                    state.scontrino[index]
                                                        .quantita);
                                          }
                                        },
                                        child: Text(
                                          "Totale: € " +
                                              totaleScontrino.toString(),
                                          style: TextStyle(fontSize: 14),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                              width: MediaQuery.of(context).size.width,
                              child: Positioned(bottom: 0, child: Tastiera())),
                        ],
                      ),
                    ),
                  ]);
            },
          )),
    );
  }
}

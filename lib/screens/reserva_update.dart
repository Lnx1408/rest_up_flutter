// ignore_for_file: unused_field, must_be_immutable

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rest_up_flutter/Templates/DesignApp.dart';
import 'package:rest_up_flutter/Classes/DatoRemplazo.dart';
import 'package:rest_up_flutter/screens/reserva_read.dart';
import 'package:rest_up_flutter/services/services_reserva.dart';

class ReservaUpdate extends StatefulWidget {
  ReservaUpdate(
      {super.key,
      required this.uid,
      required this.usuario,
      required this.fecha,
      required this.nPersonas});

  String uid, usuario, fecha, nPersonas;

  @override
  State<ReservaUpdate> createState() => _ReservaUpdateState();
}

class _ReservaUpdateState extends State<ReservaUpdate> {
  TextEditingController txtFecha = TextEditingController(text: "");
  TextEditingController txtNPersonas = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    double precio = 0.0;
    txtFecha.text = widget.fecha;
    txtNPersonas.text = widget.nPersonas;
    precio = valoresFijos.precioReserva * double.parse(widget.nPersonas);

    void fechaValue() {
      widget.fecha = datoText.middleVar;
    }

    void navigateToReservaRead() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ReservaRead()),
      );
    }

    ScaffoldFeatureController<SnackBar, SnackBarClosedReason> reservaUpdate() {
      precio = valoresFijos.precioReserva * double.parse(widget.nPersonas);

      updateReserva(widget.uid, widget.usuario, widget.fecha, widget.nPersonas,
          precio.toString());
      navigateToReservaRead();
      return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          "Reserva editada con éxito.",
          style: TextStyle(color: DesignApp.colorSecundario),
        ),
        backgroundColor: DesignApp.colorTerciario,
      ));
    }

    void nPersonasValue() {
      widget.nPersonas = datoText.middleVar;
    }

    return Scaffold(
      appBar: DesignApp.appBarBasic("Editar Reserva"),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(18.0),
          decoration: BoxDecoration(
              image: DecorationImage(
            image: NetworkImage(
              DesignApp.fondoMenuReserva,
            ),
            fit: BoxFit.fill,
          )),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 25,
              ),

              Text(
                'MODIFICAR DATOS DE LA RESERVA'.toUpperCase(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30.0,
                  color: DesignApp.colorSecundario,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // ignore: prefer_const_constructors
              SizedBox(
                height: 50,
              ),
              DesignApp.crearEditableTextField(
                "Fecha",
                "Fecha reserva",
                txtFecha,
                FontAwesomeIcons.solidCalendarCheck,
                () => fechaValue(),
              ),
              const SizedBox(
                height: 10.0,
              ),
              DesignApp.crearEditableTextField(
                "Cantidad",
                "Cantida de personas",
                txtNPersonas,
                FontAwesomeIcons.hashtag,
                () => nPersonasValue(),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                color: const Color.fromARGB(200, 0, 0, 0),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Text(
                      "CONSIDERACIONES",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ],
                ),
              ),

              Container(
                padding: const EdgeInsets.all(10),
                color: const Color.fromARGB(200, 0, 0, 0),
                child: const Row(
                  mainAxisSize: MainAxisSize.max,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    // ignore: prefer_const_constructors
                    Text(
                      "Precio de reserva por persona: \$${valoresFijos.precioReserva}",
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                color: const Color.fromARGB(200, 0, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Text(
                      "Total a pagar: \$$precio",
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
              DesignApp.crearBoton("Confirmar", () => reservaUpdate()),
              const SizedBox(
                height: 10.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

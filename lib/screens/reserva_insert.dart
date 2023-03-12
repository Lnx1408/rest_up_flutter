// ignore_for_file: unused_field, prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rest_up_flutter/Templates/DesignApp.dart';
import 'package:rest_up_flutter/Classes/DatoRemplazo.dart';
import 'package:rest_up_flutter/screens/reserva_read.dart';
import 'package:rest_up_flutter/services/services_reserva.dart';

class ReservaInsert extends StatefulWidget {
  const ReservaInsert({super.key});

  @override
  State<ReservaInsert> createState() => _ReservaInsertState();
}

class _ReservaInsertState extends State<ReservaInsert> {
  String _usuario = "", _fecha = "", _cantidadPersonas = "", _precio = "";
  @override
  Widget build(BuildContext context) {
    void navigateToReservaConsulta() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ReservaRead()),
      );
    }

    ScaffoldFeatureController<SnackBar, SnackBarClosedReason>
        registrarReserva() {
      addReserva(_usuario, _fecha, _cantidadPersonas, _precio);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ReservaRead()),
      );

      return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          "Reserva registrada con éxito",
          style: TextStyle(color: DesignApp.colorSecundario),
        ),
        backgroundColor: DesignApp.colorTerciario,
      ));
    }

    void fechaValue() {
      _fecha = datoText.middleVar;
      debugPrint("XD");
    }

    void cantidadPersonasValue() {
      _cantidadPersonas = datoText.middleVar;
      if (_cantidadPersonas == "") {
        _cantidadPersonas = "0";
      }

      _precio = (valoresFijos.precioReserva * int.parse(_cantidadPersonas))
          .toString();
    }

    for (var datoUsuario in datoList.usuarioActual) {
      _usuario = datoUsuario["NombreUsuario"];
    }

    return Scaffold(
      appBar: DesignApp.appBarBasic("Reserva con nosotros."),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(18.0),
          decoration: BoxDecoration(
              image: DecorationImage(
            image: NetworkImage(DesignApp.fondoMenuReserva),
            fit: BoxFit.fill,
          )),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            // ignore: duplicate_ignore
            children: [
              const SizedBox(
                height: 25,
              ),
              Text(
                'INGRESE LOS DATOS DE LA RESERVA'.toUpperCase(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30.0,
                  color: DesignApp.colorSecundario,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              DesignApp.crearTextFieldDate(
                "Fecha",
                "Fecha de reserva",
                FontAwesomeIcons.solidCalendarDays,
                () => fechaValue(),
              ),
              const SizedBox(
                height: 10.0,
              ),
              DesignApp.crearTextFieldNumber(
                "Cantidad",
                "Cantidad de personas",
                FontAwesomeIcons.hashtag,
                () => cantidadPersonasValue(),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                color: Color.fromARGB(200, 0, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Text(
                      "CONSIDERACIONES",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                color: Color.fromARGB(200, 0, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Text(
                      "Precio de reserva por persona: \$${valoresFijos.precioReserva}",
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                color: Color.fromARGB(200, 0, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Text(
                      "Total a pagar: \$$_precio",
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
              DesignApp.crearBoton(
                  "Realizar reserva", () => registrarReserva()),
              const SizedBox(
                height: 10.0,
              ),
              DesignApp.crearBoton(
                  "Historial", () => navigateToReservaConsulta()),
            ],
          ),
        ),
      ),
    );
  }
}

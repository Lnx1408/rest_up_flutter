// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:rest_up_flutter/Classes/DatoRemplazo.dart';

class DesignApp extends MaterialApp {
  const DesignApp({super.key});

  /// Colores de la app

  static Color colorPrimario = const Color.fromRGBO(15, 15, 15, 1);
  static Color colorSecundario = const Color.fromRGBO(244, 190, 49, 1);
  static Color colorTerciario = const Color.fromRGBO(25, 25, 25, 1);
  static Color colorAcent = const Color.fromRGBO(229, 241, 251, 1);
  static Color colorTransparente = const Color(0x00000000);

  /// Rutas de recursos

  static String logoAmarillo = "assets/icons/rest_up_logo_yellow.png";
  static String logoDark = "assets/icons/rest_up_logo_black.png";
  static String logoWhite = "assets/icons/rest_up_logo_white.png";

  static TextField crearTextField(nombreCampo, hintTexto, bool isPassword,
      IconData icono, Function() myFuncion) {
    return TextField(
      obscureText: isPassword,
      enableInteractiveSelection: false,
      readOnly: false,
      cursorColor: DesignApp.colorTerciario,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(15),
          fillColor: DesignApp.colorAcent,
          filled: true,
          focusColor: DesignApp.colorPrimario,
          hintText: hintTexto,
          labelText: nombreCampo,
          labelStyle: TextStyle(backgroundColor: DesignApp.colorTransparente),
          suffixIcon: Icon(icono),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0), gapPadding: 0),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
      onChanged: (String valorCampoF) {
        datoText.middleVar = valorCampoF;
        myFuncion();
      },
    );
  }

  static ElevatedButton crearBoton(nombreBoton, Function() myFuncion) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: const Size.fromWidth(500),
        backgroundColor: DesignApp.colorSecundario,
      ),
      child: Text(
        nombreBoton,
        style: TextStyle(color: DesignApp.colorPrimario, fontSize: 25.0),
      ),
      onPressed: () {
        myFuncion();
      },
    );
  }
}

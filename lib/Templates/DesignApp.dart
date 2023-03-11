// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:rest_up_flutter/Classes/DatoRemplazo.dart';

class DesignApp extends MaterialApp {
  const DesignApp({super.key});

  /// Colores de la app

  static Color colorPrimario = const Color.fromRGBO(15, 15, 15, 1);
  static Color colorSecundario = const Color.fromRGBO(244, 190, 49, 1);
  static Color colorTerciario = const Color.fromRGBO(25, 25, 25, 1);
  static Color colorAcent = const Color.fromRGBO(243, 235, 235, 1);
  static Color colorTransparente = const Color(0x00000000);

  /// Rutas de recursos

  static String logoAmarillo = "assets/icons/rest_up_logo_yellow.png";
  static String logoDark = "assets/icons/rest_up_logo_black.png";
  static String logoWhite = "assets/icons/rest_up_logo_white.png";

  static String fondoPrincipal = "assets/images/fondo_principal.jpg";
  static String fondoPrincipal_1 = "assets/images/fondo_principal_1.jpg";
  static String fondoPrincipal_2 = "assets/images/fondo_principal_2.jpg";
  static String fondoRegistroUsuario = "assets/images/fondo_registro.png";
  static String splash = "assets/images/splash.png";

  static String imgMenuComidas =
      'assets/images/menu_principal/img_btn_menu_light.png';
  static String imgMenuPromociones =
      'assets/images/menu_principal/img_btn_promociones_light.png';
  static String imgMenuReservas =
      'assets/images/menu_principal/img_btn_reservas_light.png';

  static TextField crearTextField(nombreCampo, hintTexto, bool isPassword,
      IconData icono, Function() myFuncion) {
    return TextField(
      cursorColor: DesignApp.colorSecundario,
      obscureText: isPassword,
      enableInteractiveSelection: false,
      readOnly: false,
      decoration: InputDecoration(
        suffixIconColor: colorSecundario,
        contentPadding: const EdgeInsets.all(15),
        fillColor: const Color.fromRGBO(1, 0, 0, 0.75),
        filled: true,
        focusColor: DesignApp.colorPrimario,
        hintText: hintTexto,
        labelText: nombreCampo,
        labelStyle: TextStyle(
          backgroundColor: colorTransparente,
          color: colorSecundario,
        ),
        suffixIcon: Icon(icono),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          gapPadding: 5,
          borderSide: BorderSide(color: colorSecundario),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      onChanged: (String valorCampoF) {
        datoText.middleVar = valorCampoF;
        myFuncion();
      },
    );
  }

  static TextField crearEditableTextField(
      nombreCampo,
      hintTexto,
      TextEditingController controladorText,
      IconData icono,
      Function() myFuncion) {
    return TextField(
      cursorColor: DesignApp.colorSecundario,
      controller: controladorText,
      enableInteractiveSelection: false,
      readOnly: false,
      decoration: InputDecoration(
        suffixIconColor: colorSecundario,
        contentPadding: const EdgeInsets.all(15),
        fillColor: const Color.fromRGBO(1, 0, 0, 0.75),
        filled: true,
        focusColor: DesignApp.colorPrimario,
        hintText: hintTexto,
        labelText: nombreCampo,
        labelStyle: TextStyle(
          backgroundColor: colorTransparente,
          color: colorSecundario,
        ),
        suffixIcon: Icon(icono),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          gapPadding: 5,
          borderSide: BorderSide(color: colorSecundario),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      onChanged: (String valorCampoF) {
        datoText.middleVar = valorCampoF;
        myFuncion();
      },
    );
  }

  static TextField crearTextFieldPass(nombreCampo, hintTexto, bool isPassword,
      IconData icono, Function() myFuncion, Function() isPasswordField) {
    return TextField(
      obscureText: datoText.isPassword,
      enableInteractiveSelection: false,
      cursorColor: DesignApp.colorSecundario,
      readOnly: false,
      decoration: InputDecoration(
        suffixIconColor: colorSecundario,
        contentPadding: const EdgeInsets.all(15),
        fillColor: const Color.fromRGBO(1, 0, 0, 0.75),
        filled: true,
        focusColor: DesignApp.colorPrimario,
        hintText: hintTexto,
        labelText: nombreCampo,
        labelStyle: TextStyle(
          backgroundColor: colorTransparente,
          color: colorSecundario,
        ),
        suffixIcon: IconButton(
          icon: Icon(
            datoText.isPassword ? Icons.visibility_off : Icons.visibility,
          ),
          onPressed: () {
            isPasswordField();
          },
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          gapPadding: 5,
          borderSide: BorderSide(color: colorSecundario),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      onChanged: (String valorCampoF) {
        datoText.middleVar = valorCampoF;
        myFuncion();
      },
    );
  }

  static ElevatedButton crearBoton(nombreBoton, Function() myFuncion) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        minimumSize: const Size(double.infinity, 50),
        backgroundColor: DesignApp.colorSecundario,
      ),
      child: Text(
        nombreBoton,
        style: TextStyle(
          color: DesignApp.colorPrimario,
          fontSize: 25.0,
        ),
      ),
      onPressed: () {
        myFuncion();
      },
    );
  }

  static AppBar appBarBasic(String nombre) {
    return AppBar(
      title: Text(nombre),
      backgroundColor: DesignApp.colorTerciario,
    );
  }
}

// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rest_up_flutter/Classes/DatoRemplazo.dart';
import 'package:rest_up_flutter/Templates/DesignApp.dart';
import 'UsuarioLogin.dart';

void main() => runApp(const MenuPrincipal());

// ignore: must_be_immutable
class MenuPrincipal extends StatefulWidget {
  const MenuPrincipal({super.key});

  @override
  State<StatefulWidget> createState() => _MenuPrincipalState();
}

class _MenuPrincipalState extends State<MenuPrincipal> {
  void volverLogin(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const Login()));
  }

  void campo1() {
    String valor = datoText.middleVar;
    print('presiono el campo1 $valor sd');
  }

  void campo2() {
    String valor = datoText.middleVar;
    print('presiono el campo2 $valor xd');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Menu principal',
      home: Scaffold(
        backgroundColor: DesignApp.colorPrimario,
        appBar: DesignApp.appBarBasic('Bienvenido a RestUp'),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              verticalDirection: VerticalDirection.down,
              children: [
                DesignApp.crearTextField("Nuevo Text 1", "Este texto 2", false,
                    FontAwesomeIcons.solidCalendar, () => campo1()),
                SizedBox(
                  height: 15.0,
                  child: Divider(color: DesignApp.colorTransparente),
                ),
                DesignApp.crearTextField("Nuevo Text 2", "Este texto 2", true,
                    FontAwesomeIcons.solidBell, () => campo2()),
                SizedBox(
                  height: 15.0,
                  child: Divider(color: DesignApp.colorTransparente),
                ),
                DesignApp.crearBoton(
                    "Cerrar Sesion", () => volverLogin(context))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rest_up_flutter/Classes/DatoRemplazo.dart';

import '../Templates/DesignApp.dart';
import 'menu_principal.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String _email = "";
  String _password = "";

  @override
  Widget build(BuildContext context) {
    void validarLogin(String email, String password) {
      if (email == "Grupo9" && password == "123456") {
        print('Bienvenido: $_email');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MenuPrincipal()),
        );
      } else {
        print('Datos incorrectos');
      }
    }

    void salirApp() {
      print('Usted a salido del sistema');
      Future.delayed(const Duration(milliseconds: 1000), () {
        SystemChannels.platform.invokeMethod('SystemNavigator.pop');
      });
    }

    void usuarioValue() {
      _email = datoText.middleVar;
    }

    void passwordValue() {
      _password = datoText.middleVar;
    }

    return Scaffold(
        backgroundColor: DesignApp.colorPrimario,
        //backgroundColor: const Color.fromARGB(255, 215, 242, 255),
        body: Stack(
          children: [
            Image(
              image: AssetImage(DesignApp.fondoPrincipal),
              fit: BoxFit.fill,
              alignment: Alignment.center,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
              child: SizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'LOGIN',
                      style: TextStyle(
                          fontSize: 35.0, color: DesignApp.colorAcent),
                    ),
                    SizedBox(
                      height: 20.0,
                      child: Divider(color: DesignApp.colorTransparente),
                    ),
                    CircleAvatar(
                      radius: 100.0,
                      backgroundColor: DesignApp.colorTransparente,
                      backgroundImage: AssetImage(DesignApp.logoAmarillo),
                    ),
                    SizedBox(
                      height: 35.0,
                      child: Divider(color: DesignApp.colorTransparente),
                    ),
                    Text(
                      'usuario: Grupo9',
                      style: TextStyle(
                          fontSize: 15.0, color: DesignApp.colorAcent),
                    ),
                    Text(
                      'password: 123456',
                      style: TextStyle(
                          fontSize: 15.0, color: DesignApp.colorAcent),
                    ),
                    SizedBox(
                      width: 160.0,
                      height: 25.0,
                      child: Divider(color: DesignApp.colorTransparente),
                    ),
                    DesignApp.crearTextField(
                        "Usuario",
                        'Ingrese su usuario',
                        false,
                        FontAwesomeIcons.solidUser,
                        () => usuarioValue()),
                    SizedBox(
                      height: 15.0,
                      child: Divider(color: DesignApp.colorTransparente),
                    ),
                    DesignApp.crearTextField(
                        "Contraseña",
                        'Ingrese su contraseña',
                        true,
                        FontAwesomeIcons.solidEye,
                        () => passwordValue()),
                    SizedBox(
                      width: 160.0,
                      height: 25.0,
                      child: Divider(color: DesignApp.colorTransparente),
                    ),
                    DesignApp.crearBoton(
                        "Ingresar", () => validarLogin(_email, _password)),
                    DesignApp.crearBoton("Salir", () => salirApp())
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}

// ignore_for_file: avoid_print, file_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rest_up_flutter/Classes/DatoRemplazo.dart';
import 'package:rest_up_flutter/screens/UsuarioRegistro.dart';

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
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(DesignApp.fondoPrincipal),
            repeat: ImageRepeat.repeat,
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 35),
                child: Text(
                  'Iniciar sesion'.toUpperCase(),
                  style: TextStyle(fontSize: 35.0, color: DesignApp.colorAcent),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: CircleAvatar(
                  radius: 100.0,
                  backgroundColor: DesignApp.colorTransparente,
                  backgroundImage: AssetImage(DesignApp.logoAmarillo),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  children: [
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
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5.0),
                child: DesignApp.crearTextField("Usuario", 'Ingrese su usuario',
                    false, FontAwesomeIcons.solidUser, () => usuarioValue()),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5.0),
                child: DesignApp.crearTextField(
                    "Contraseña",
                    'Ingrese su contraseña',
                    true,
                    FontAwesomeIcons.solidEye,
                    () => passwordValue()),
              ),
              const SizedBox(height: 16.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: DesignApp.crearBoton(
                    "Ingresar", () => validarLogin(_email, _password)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: DesignApp.crearBoton("Salir", () => salirApp()),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "¿Aún no tienes cuenta?",
                      style: TextStyle(
                        color: DesignApp.colorAcent,
                      ),
                    ),
                    TextButton(
                      child: Text(
                        "Registrate",
                        style: TextStyle(
                          color: DesignApp.colorSecundario,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const UsuarioRegistro()),
                        );
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      //backgroundColor: const Color.fromARGB(255, 215, 242, 255),
    );
  }
}

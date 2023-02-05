// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'menu_principal.dart';

const colorPrimario = Color.fromRGBO(15, 15, 15, 1);
const colorSecundario = Color.fromRGBO(244, 190, 49, 1);
const colorTerciario = Color.fromRGBO(25, 25, 25, 1);
const colorAcent = Color.fromRGBO(229, 241, 251, 1);

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
    ///Metodo para acceder a al menú principal
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

    return Scaffold(
      // backgroundColor: Color.fromARGB(33, 33, 33, 200),
      backgroundColor: const Color.fromARGB(255, 215, 242, 255),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Login',
                style: TextStyle(fontSize: 40.0),
              ),
              const SizedBox(
                width: 160.0,
                height: 25.0,
                child: Divider(color: Colors.transparent),
              ),
              const CircleAvatar(
                radius: 100.0,
                backgroundColor: Colors.transparent,
                backgroundImage:
                    AssetImage('assets/icons/rest_up_logo_black.png'),
              ),
              const SizedBox(
                width: 160.0,
                height: 15.0,
                child: Divider(color: Colors.transparent),
              ),
              const Text(
                'usuario: Grupo9',
                style: TextStyle(fontSize: 15.0),
              ),
              const Text(
                'password: 123456',
                style: TextStyle(fontSize: 15.0),
              ),
              const SizedBox(
                width: 160.0,
                height: 25.0,
                child: Divider(color: Colors.transparent),
              ),
              TextField(
                // autofocus: true,
                readOnly: false,
                decoration: InputDecoration(
                    hintText: 'Ingrese su usuario',
                    labelText: 'Usuario',
                    suffixIcon: const Icon(FontAwesomeIcons.solidUser),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
                onChanged: (valor) {
                  _email = valor;
                },
              ),
              const SizedBox(
                height: 15.0,
                child: Divider(color: Colors.transparent),
              ),
              TextField(
                enableInteractiveSelection: false,
                obscureText: true,
                readOnly: false,
                decoration: InputDecoration(
                    hintText: 'Ingrese su contraseña',
                    labelText: 'Contraseña',
                    suffixIcon: const Icon(FontAwesomeIcons.solidEye),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
                onChanged: (valor) {
                  _password = valor;
                },
              ),
              const SizedBox(
                width: 160.0,
                height: 25.0,
                child: Divider(color: Colors.transparent),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  // ignore: sort_child_properties_last
                  child: const Text(
                    'Ingresar',
                    style: TextStyle(color: Colors.white70, fontSize: 25.0),
                  ),
                  onPressed: () {
                    validarLogin(_email, _password);
                  },
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  // ignore: sort_child_properties_last
                  child: const Text(
                    'Salir',
                    style: TextStyle(color: Colors.white70, fontSize: 25.0),
                  ),
                  onPressed: () {
                    salirApp();
                  },
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

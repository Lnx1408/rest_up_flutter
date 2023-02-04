// ignore_for_file: avoid_print
import 'package:flutter/material.dart';

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
    return Scaffold(
      // backgroundColor: Color.fromARGB(33, 33, 33, 200),
      backgroundColor: const Color.fromARGB(255, 215, 242, 255),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 90.0),
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Login',
                style: TextStyle(fontFamily: 'NerkoOne', fontSize: 50.0),
              ),
              const CircleAvatar(
                radius: 100.0,
                backgroundColor: Colors.transparent,
                backgroundImage:
                    AssetImage('assets/icons/rest_up_logo_black.png'),
              ),
              const Text(
                'usuario: Grupo9',
                style: TextStyle(fontFamily: 'NerkoOne', fontSize: 20.0),
              ),
              const Text(
                'password: 123456',
                style: TextStyle(fontFamily: 'NerkoOne', fontSize: 20.0),
              ),
              SizedBox(
                width: 160.0,
                height: 15.0,
                child: Divider(color: Colors.blueGrey[600]),
              ),
              TextField(
                // autofocus: true,
                readOnly: false,
                decoration: InputDecoration(
                    hintText: 'Ingrese su usuario',
                    labelText: 'usuario',
                    suffixIcon: const Icon(Icons.alternate_email),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0))),
                onChanged: (valor) {
                  _email = valor;
                  print('El Email es $_email');
                },
              ),
              const Divider(
                height: 15.0,
              ),
              TextField(
                enableInteractiveSelection: false,
                obscureText: true,
                readOnly: false,
                decoration: InputDecoration(
                    hintText: 'Ingrese su contraseña',
                    labelText: 'Password',
                    suffixIcon: const Icon(Icons.lock_outline),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0))),
                onChanged: (valor) {
                  _password = valor;
                  print('El Password es $_password');
                },
              ),
              const Divider(
                height: 15.0,
              ),
              SizedBox(
                width: double.infinity,
                child: MaterialButton(
                  hoverColor: const Color.fromRGBO(3, 169, 244, 1),
                  // ignore: sort_child_properties_last
                  child: const Text(
                    'Sing in',
                    style: TextStyle(
                        color: Colors.white70,
                        fontSize: 30.0,
                        fontFamily: 'NerkoOne'),
                  ),
                  color: Colors.lightBlueAccent,
                  onPressed: () {
                    if (_email == "Grupo9" && _password == "123456") {
                      print('Bienvenido: $_email');
                    } else {
                      print('Datos incorrectos');
                    }
                  },
                ),
              ),
              const Divider(
                height: 15.0,
              ),
              SizedBox(
                width: double.infinity,
                child: MaterialButton(
                  hoverColor: const Color.fromRGBO(3, 169, 244, 1),
                  // ignore: sort_child_properties_last
                  child: const Text(
                    'Salir',
                    style: TextStyle(
                        color: Colors.white70,
                        fontSize: 30.0,
                        fontFamily: 'NerkoOne'),
                  ),
                  color: Colors.lightBlueAccent,
                  onPressed: () {
                    print('Usted a salido del sistema');
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

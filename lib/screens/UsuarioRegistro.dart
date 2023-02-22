// ignore_for_file: file_names, unused_field, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rest_up_flutter/screens/UsuarioLogin.dart';

import '../Templates/DesignApp.dart';

class UsuarioRegistro extends StatefulWidget {
  const UsuarioRegistro({super.key});

  @override
  State<UsuarioRegistro> createState() => _UsuarioRegistroState();
}

class _UsuarioRegistroState extends State<UsuarioRegistro> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _email = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DesignApp.colorTerciario,
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(DesignApp.fondoRegistroUsuario),
            repeat: ImageRepeat.repeat,
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 25.0),
                  Center(
                    child: Text(
                      "Rest\nUp".toUpperCase(),
                      style: TextStyle(
                        color: DesignApp.colorAcent,
                        fontSize: 65.0,
                        fontWeight: FontWeight.normal,
                        fontFamily: "Italianno",
                      ),
                    ),
                  ),
                  const SizedBox(height: 50.0),
                  Center(
                    child: Text(
                      "Ingrese sus datos".toUpperCase(),
                      style: TextStyle(
                        color: DesignApp.colorAcent,
                        fontSize: 20.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  const SizedBox(height: 25.0),
                  DesignApp.crearTextField("Nombre", "Ingrese su nombre", false,
                      FontAwesomeIcons.solidUser, () => null),
                  const SizedBox(height: 16),
                  DesignApp.crearTextField(
                      "Contraseña",
                      "Ingrese su contraseña",
                      true,
                      FontAwesomeIcons.solidEyeSlash,
                      () => null),
                  const SizedBox(height: 16),
                  DesignApp.crearTextField(
                      "Confirmar contraseña",
                      "Ingrese su contraseña",
                      true,
                      FontAwesomeIcons.solidEyeSlash,
                      () => null),
                  const SizedBox(height: 16),
                  DesignApp.crearBoton("Registrarse", () => null),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "¿Ya tienes cuenta?",
                        style: TextStyle(
                          color: DesignApp.colorAcent,
                        ),
                      ),
                      TextButton(
                        child: Text(
                          "Entrar",
                          style: TextStyle(
                            color: DesignApp.colorSecundario,
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Login()),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

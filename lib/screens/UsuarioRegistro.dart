// ignore_for_file: file_names, unused_field, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rest_up_flutter/screens/UsuarioLogin.dart';
import 'package:rest_up_flutter/Classes/DatoRemplazo.dart';

import '../Templates/DesignApp.dart';
import '../services/services_usuario.dart';

class UsuarioRegistro extends StatefulWidget {
  const UsuarioRegistro({super.key});

  @override
  State<UsuarioRegistro> createState() => _UsuarioRegistroState();
}

class _UsuarioRegistroState extends State<UsuarioRegistro> {
  final _formKey = GlobalKey<FormState>();
  String _nameUser = '';
  String _email = '';
  String _confirmPassword = '';
  String _password = '';
  String _linkImagen = "";

  @override
  Widget build(BuildContext context) {
    void passwordValue() {
      _password = datoText.middleVar;
    }

    void nameUserValue() {
      _nameUser = datoText.middleVar;
    }

    void mailValue() {
      _email = datoText.middleVar;
    }

    void imagenValue() {
      _linkImagen = datoText.middleVar;
    }

    void confirmPassValue() {
      _confirmPassword = datoText.middleVar;
    }

    void isPasswordField() {
      setState(() {
        datoText.isPassword = !datoText.isPassword;
      });
    }

    ScaffoldFeatureController<SnackBar, SnackBarClosedReason> registrarUsuario(
        context) {
      String mensaje = "Ingrese todos los datos solicitados";
      if (_nameUser != "" &&
          _email != "" &&
          _password != "" &&
          _linkImagen != "") {
        if (_password == _confirmPassword) {
          mensaje = "Usuario registrado con éxito";
          addUsuario(_nameUser, _email, _password, _linkImagen);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Login()),
          );
        } else {
          mensaje = "Las contraseñas no coinciden";
        }
      }
      return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          mensaje,
          style: TextStyle(color: DesignApp.colorSecundario),
        ),
        backgroundColor: DesignApp.colorTerciario,
      ));
    }

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
                  DesignApp.crearTextField(
                    "Nombre",
                    "Ingrese su nombre",
                    false,
                    FontAwesomeIcons.solidUser,
                    () => nameUserValue(),
                  ),
                  const SizedBox(height: 16),
                  DesignApp.crearTextField(
                    "Imagen",
                    "Ingrese un enlace de su foto de perfil",
                    false,
                    FontAwesomeIcons.solidUser,
                    () => imagenValue(),
                  ),
                  const SizedBox(height: 16),
                  DesignApp.crearTextField(
                    "Email",
                    "Ingrese su email",
                    false,
                    FontAwesomeIcons.solidEnvelope,
                    () => mailValue(),
                  ),
                  const SizedBox(height: 16),
                  DesignApp.crearTextFieldPass(
                    "Contraseña",
                    'Ingrese su contraseña',
                    true,
                    FontAwesomeIcons.solidEye,
                    () => passwordValue(),
                    () => isPasswordField(),
                  ),
                  const SizedBox(height: 16),
                  DesignApp.crearTextFieldPass(
                    "Confirmar contraseña",
                    'Ingrese nuevamente su contraseña',
                    true,
                    FontAwesomeIcons.solidEye,
                    () => confirmPassValue(),
                    () => isPasswordField(),
                  ),
                  const SizedBox(height: 16),
                  DesignApp.crearBoton(
                      "Registrarse", () => registrarUsuario(context)),
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

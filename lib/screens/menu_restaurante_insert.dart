// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rest_up_flutter/Templates/DesignApp.dart';
import 'package:rest_up_flutter/Classes/DatoRemplazo.dart';
import 'package:rest_up_flutter/services/services_menu_comida.dart';

import 'menu_restaurante_read.dart';

class MenuRestauranteInsert extends StatefulWidget {
  const MenuRestauranteInsert({super.key});

  @override
  State<MenuRestauranteInsert> createState() => _MenuRestauranteInsertState();
}

class _MenuRestauranteInsertState extends State<MenuRestauranteInsert> {
  String _nombre = "", _descripcion = "", _precio = "", _imagen = "";
  @override
  Widget build(BuildContext context) {
    void navigateToMenuRestauranteConsulta() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MenuRestauranteRead()),
      );
    }

    ScaffoldFeatureController<SnackBar, SnackBarClosedReason> registrarMenu() {
      addMenuComida(_nombre, _descripcion, _precio, _imagen);

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MenuRestauranteRead()),
      );

      return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          "Menú registrado con éxito",
          style: TextStyle(color: DesignApp.colorSecundario),
        ),
        backgroundColor: DesignApp.colorTerciario,
      ));
    }

    void nombreValue() {
      _nombre = datoText.middleVar;
    }

    void descripcionValue() {
      _descripcion = datoText.middleVar;
    }

    void precioValue() {
      _precio = datoText.middleVar;
    }

    void imagenValue() {
      _imagen = datoText.middleVar;
    }

    return Scaffold(
      appBar: DesignApp.appBarBasic("Registro de menú del restaurante"),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(18.0),
          decoration: BoxDecoration(
              image: DecorationImage(
            image: NetworkImage(DesignApp.fondoMenuRestaurante),
            fit: BoxFit.fill,
          )),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 25,
              ),
              Text(
                'INGRESE LOS DATOS DEL MENÚ'.toUpperCase(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30.0,
                  color: DesignApp.colorSecundario,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // ignore: prefer_const_constructors
              SizedBox(
                height: 50,
              ),
              DesignApp.crearTextField(
                  "Nombre",
                  "Ingrese el nombre de la comida",
                  false,
                  FontAwesomeIcons.bowlFood,
                  () => nombreValue()),
              const SizedBox(
                height: 10.0,
              ),
              DesignApp.crearTextField(
                "Descripcion",
                "Descripción del plato",
                false,
                FontAwesomeIcons.bowlRice,
                () => descripcionValue(),
              ),
              const SizedBox(
                height: 10.0,
              ),
              DesignApp.crearTextField(
                "Precio",
                "Precio del plato",
                false,
                FontAwesomeIcons.moneyCheckDollar,
                () => precioValue(),
              ),
              const SizedBox(
                height: 10.0,
              ),
              DesignApp.crearTextField(
                "Imagen",
                "Imagen de internet",
                false,
                FontAwesomeIcons.solidFileImage,
                () => imagenValue(),
              ),
              const SizedBox(
                height: 15.0,
              ),
              DesignApp.crearBoton("Registrar Menú", () => registrarMenu()),
              const SizedBox(
                height: 10.0,
              ),
              DesignApp.crearBoton(
                  "Ver Menú", () => navigateToMenuRestauranteConsulta()),
            ],
          ),
        ),
      ),
    );
  }
}

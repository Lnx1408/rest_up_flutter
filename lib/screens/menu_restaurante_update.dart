// ignore_for_file: unused_field, must_be_immutable

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rest_up_flutter/Templates/DesignApp.dart';
import 'package:rest_up_flutter/Classes/DatoRemplazo.dart';
import 'package:rest_up_flutter/screens/menu_restaurante_read.dart';
import 'package:rest_up_flutter/services/services_menu_comida.dart';

class MenuRestauranteUpdate extends StatefulWidget {
  MenuRestauranteUpdate(
      {super.key,
      required this.uid,
      required this.nombre,
      required this.descripcion,
      required this.precio,
      required this.imagen});

  String uid, nombre, descripcion, precio, imagen;

  @override
  State<MenuRestauranteUpdate> createState() => _MenuRestauranteUpdateState();
}

class _MenuRestauranteUpdateState extends State<MenuRestauranteUpdate> {
  TextEditingController txtNombre = TextEditingController(text: "");
  TextEditingController txtDescripcion = TextEditingController(text: "");
  TextEditingController txtPrecio = TextEditingController(text: "");
  TextEditingController txtImagen = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    txtNombre.text = widget.nombre;
    txtDescripcion.text = widget.descripcion;
    txtPrecio.text = widget.precio;
    txtImagen.text = widget.imagen;

    void nombreValue() {
      widget.nombre = datoText.middleVar;
    }

    void navigateToMenuRestauranteRead() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MenuRestauranteRead()),
      );
    }

    ScaffoldFeatureController<SnackBar, SnackBarClosedReason>
        updateMenuRestaurante() {
      updateMenuComida(widget.uid, widget.nombre, widget.descripcion,
          widget.precio, widget.imagen);
      navigateToMenuRestauranteRead();
      return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          "Menú editado con éxito.",
          style: TextStyle(color: DesignApp.colorSecundario),
        ),
        backgroundColor: DesignApp.colorTerciario,
      ));
    }

    void descripcionValue() {
      widget.descripcion = datoText.middleVar;
    }

    void precioValue() {
      widget.precio = datoText.middleVar;
    }

    void imagenValue() {
      widget.imagen = datoText.middleVar;
    }

    return Scaffold(
      appBar: DesignApp.appBarBasic("Editar Menú"),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(18.0),
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: NetworkImage(
                "https://learn.canva.com/wp-content/uploads/2018/05/FoodPhotographyTips24.jpg"),
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
                'MODIFICAR DATOS DEL MENÚ'.toUpperCase(),
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
              DesignApp.crearEditableTextField(
                  "Nombre",
                  "Ingrese el nombre del menú",
                  txtNombre,
                  FontAwesomeIcons.bowlFood,
                  () => nombreValue()),
              const SizedBox(
                height: 10.0,
              ),
              DesignApp.crearEditableTextField(
                "Descripción",
                "Descripción del menú",
                txtDescripcion,
                FontAwesomeIcons.bowlRice,
                () => descripcionValue(),
              ),
              const SizedBox(
                height: 10.0,
              ),
              DesignApp.crearEditableTextField(
                "Precio",
                "Precio de la promoción",
                txtPrecio,
                FontAwesomeIcons.moneyCheckDollar,
                () => precioValue(),
              ),
              const SizedBox(
                height: 10.0,
              ),
              DesignApp.crearEditableTextField(
                "Imagen",
                "Imagen de internet",
                txtImagen,
                FontAwesomeIcons.solidFileImage,
                () => imagenValue(),
              ),
              const SizedBox(
                height: 15.0,
              ),
              DesignApp.crearBoton("Confirmar", () => updateMenuRestaurante()),
              const SizedBox(
                height: 10.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

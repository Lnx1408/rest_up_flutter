// ignore_for_file: unused_field, must_be_immutable

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rest_up_flutter/Templates/DesignApp.dart';
import 'package:rest_up_flutter/Classes/DatoRemplazo.dart';
import 'package:rest_up_flutter/screens/promociones_consulta.dart';
import 'package:rest_up_flutter/services/services_promociones.dart';

class PromocionActualizar extends StatefulWidget {
  PromocionActualizar(
      {super.key,
      required this.uid,
      required this.nombre,
      required this.dias,
      required this.restricciones,
      required this.imagen});

  String uid, nombre, dias, restricciones, imagen;

  @override
  State<PromocionActualizar> createState() => _PromocionActualizarState();
}

class _PromocionActualizarState extends State<PromocionActualizar> {
  TextEditingController txtNombre = TextEditingController(text: "");
  TextEditingController txtDias = TextEditingController(text: "");
  TextEditingController txtRestricciones = TextEditingController(text: "");
  TextEditingController txtImagen = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    txtNombre.text = widget.nombre;
    txtDias.text = widget.dias;
    txtRestricciones.text = widget.restricciones;
    txtImagen.text = widget.imagen;

    void nombrePromoValue() {
      widget.nombre = datoText.middleVar;
    }

    void navigateToPromocionesConsulta() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const PromocionConsulta()),
      );
    }

    ScaffoldFeatureController<SnackBar, SnackBarClosedReason>
        modificarPromociones() {
      updatePromocion(widget.uid, widget.nombre, widget.dias,
          widget.restricciones, widget.imagen);
      navigateToPromocionesConsulta();
      return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          "Promoción editada con éxito.",
          style: TextStyle(color: DesignApp.colorSecundario),
        ),
        backgroundColor: DesignApp.colorTerciario,
      ));
    }

    void diasPromoValue() {
      widget.dias = datoText.middleVar;
    }

    void restriccionPromoValue() {
      widget.restricciones = datoText.middleVar;
    }

    void imagenPromoValue() {
      widget.imagen = datoText.middleVar;
    }

    return Scaffold(
      appBar: DesignApp.appBarBasic("Editar Promocion"),
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
                'MODIFICAR DATOS DE LA PROMOCIÓN'.toUpperCase(),
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
                  "Ingrese el nombre de la promoción",
                  txtNombre,
                  FontAwesomeIcons.tag,
                  () => nombrePromoValue()),
              const SizedBox(
                height: 10.0,
              ),
              DesignApp.crearEditableTextField(
                "Días",
                "Días que aplica la promoción",
                txtDias,
                FontAwesomeIcons.calendarDay,
                () => diasPromoValue(),
              ),
              const SizedBox(
                height: 10.0,
              ),
              DesignApp.crearEditableTextField(
                "Restricciones",
                "Restricciones de la promoción",
                txtRestricciones,
                FontAwesomeIcons.triangleExclamation,
                () => restriccionPromoValue(),
              ),
              const SizedBox(
                height: 10.0,
              ),
              DesignApp.crearEditableTextField(
                "Imagen",
                "Imagen de internet",
                txtImagen,
                FontAwesomeIcons.solidFileImage,
                () => imagenPromoValue(),
              ),
              const SizedBox(
                height: 15.0,
              ),
              DesignApp.crearBoton("Confirmar", () => modificarPromociones()),
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

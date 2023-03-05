import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rest_up_flutter/Templates/DesignApp.dart';

class Promociones extends StatefulWidget {
  const Promociones({super.key});

  @override
  State<Promociones> createState() => _PromocionesState();
}

class _PromocionesState extends State<Promociones> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DesignApp.appBarBasic("Promociones"),
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
                'INGRESE LOS DATOS DE LA PROMOCIÓN'.toUpperCase(),
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
                  "Ingrese el nombre de la promoción",
                  false,
                  FontAwesomeIcons.tag,
                  () => null),
              const SizedBox(
                height: 10.0,
              ),
              DesignApp.crearTextField("Días", "Días que aplica la promoción",
                  false, FontAwesomeIcons.calendarDay, () => null),
              const SizedBox(
                height: 10.0,
              ),
              DesignApp.crearTextField(
                  "Restricciones",
                  "Restricciones de la promoción",
                  false,
                  FontAwesomeIcons.triangleExclamation,
                  () => null),
              const SizedBox(
                height: 10.0,
              ),
              DesignApp.crearTextField("Imagen", "Imagen de internet", false,
                  FontAwesomeIcons.solidFileImage, () => null),
              const SizedBox(
                height: 15.0,
              ),
              DesignApp.crearBoton("Registrar promoción", () => null),
            ],
          ),
        ),
      ),
    );
  }
}

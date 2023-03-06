import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rest_up_flutter/Templates/DesignApp.dart';
import 'package:rest_up_flutter/Classes/DatoRemplazo.dart';
import 'package:rest_up_flutter/screens/promociones_consulta.dart';

class Promociones extends StatefulWidget {
  const Promociones({super.key});

  @override
  State<Promociones> createState() => _PromocionesState();
}

class _PromocionesState extends State<Promociones> {
  String _nombre = "", _dias = "", _restricciones = "", _imagen = "";
  @override
  Widget build(BuildContext context) {
    void nombrePromoValue() {
      _nombre = datoText.middleVar;
    }

    void navigateToPromocionesConsulta() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const PromocionConsulta()),
      );
    }

    void diasPromoValue() {
      _dias = datoText.middleVar;
    }

    void restriccionPromoValue() {
      _restricciones = datoText.middleVar;
    }

    void imagenPromoValue() {
      _imagen = datoText.middleVar;
    }

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
                  () => nombrePromoValue()),
              const SizedBox(
                height: 10.0,
              ),
              DesignApp.crearTextField(
                "Días",
                "Días que aplica la promoción",
                false,
                FontAwesomeIcons.calendarDay,
                () => diasPromoValue(),
              ),
              const SizedBox(
                height: 10.0,
              ),
              DesignApp.crearTextField(
                "Restricciones",
                "Restricciones de la promoción",
                false,
                FontAwesomeIcons.triangleExclamation,
                () => restriccionPromoValue(),
              ),
              const SizedBox(
                height: 10.0,
              ),
              DesignApp.crearTextField(
                "Imagen",
                "Imagen de internet",
                false,
                FontAwesomeIcons.solidFileImage,
                () => imagenPromoValue(),
              ),
              const SizedBox(
                height: 15.0,
              ),
              DesignApp.crearBoton(
                  "Registrar promoción", () => navigateToPromocionesConsulta()),
            ],
          ),
        ),
      ),
    );
  }
}

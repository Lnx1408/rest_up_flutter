import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List> getDatosPromociones() async {
  List datos = [];

  QuerySnapshot queryPromocion = await db.collection('Promocion').get();

  for (var documento in queryPromocion.docs) {
    final Map<String, dynamic> data = documento.data() as Map<String, dynamic>;
    final elements = {
      "Nombre": data['Nombre'],
      "Dias": data['Dias'],
      "Restricciones": data['Restricciones'],
      "Imagen": data['Imagen'],
      "uid": documento.id,
    };
    datos.add(elements);
  }
  return datos;
}

//guardar en base de datos
Future<void> addPromocion(
    String nombre, String dias, String restricciones, String imagen) async {
  await db.collection("Promocion").add({
    "Nombre": nombre,
    "Dias": dias,
    "Restricciones": restricciones,
    "Imagen": imagen
  });
}

//actualizar
Future<void> updatePromocion(String uid, String nombre, String dias,
    String restricciones, String imagen) async {
  await db.collection("Promocion").doc(uid).set({
    "Nombre": nombre,
    "Dias": dias,
    "Restricciones": restricciones,
    "Imagen": imagen,
  });
}

//eliminar desde firebase
Future<void> deletePromocion(String id) async {
  await db.collection("Promocion").doc(id).delete();
}

import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List> getDatosPromociones() async {
  List datos = [];
  CollectionReference collectionReferencedatos = db.collection('Promocion');
  QuerySnapshot queryPromocion = await collectionReferencedatos.get();

  for (var documento in queryPromocion.docs) {
    datos.add(documento.data());
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
Future<void> actualizarM(String uid, String descrip) async {
  await db.collection("Promocion").doc(uid).set({"descripcion": descrip});
}

//eliminar desde firebase
Future<void> eliminerM(String id) async {
  await db.collection("Promocion").doc(id).delete();
}

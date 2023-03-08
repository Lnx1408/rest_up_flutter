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
Future<void> addMenu(String name) async {
  await db.collection("menu").add({"descripcion": name});
}

//actualizar
Future<void> actualizarM(String uid, String descrip) async {
  await db.collection("menu").doc(uid).set({"descripcion": descrip});
}

//eliminar desde firebase
Future<void> eliminerM(String id) async {
  await db.collection("menu").doc(id).delete();
}

import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List> getDatosPromociones() async {
  List datos = [];
  CollectionReference collectionReferencedatos = db.collection('Promocion');
  QuerySnapshot querymenu = await collectionReferencedatos.get();
  //QuerySnapshot querymenu = await db.collection('Promocion').get();
  // ignore: avoid_function_literals_in_foreach_calls
  querymenu.docs.forEach((documento) {
    /*for (var doc in querymenu.docs) {
    final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    final elements = {
      "nombre": data['Nombre'],
      "dias": data['Dias'],
      "Restricciones": data['Restricciones'],
      "imagen": data['Imagen'],
      "uid": doc.id,
    };
    datos.add(elements);*/
    datos.add(documento.data());
  });
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

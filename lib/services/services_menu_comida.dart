import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List> getDatosMenuComida() async {
  List datos = [];

  QuerySnapshot queryMenuComida = await db.collection('MenuComida').get();

  for (var documento in queryMenuComida.docs) {
    final Map<String, dynamic> data = documento.data() as Map<String, dynamic>;
    final elements = {
      "Nombre": data['Nombre'],
      "Descripcion": data['Descripcion'],
      "Precio": data['Precio'],
      "Imagen": data['Imagen'],
      "uid": documento.id,
    };
    datos.add(elements);
  }
  return datos;
}

//guardar en base de datos
Future<String> addMenuComida(String nombreComida, String descripcion,
    String precio, String imagen) async {
  String result = "";
  try {
    await db.collection("MenuComida").add({
      "Nombre": nombreComida,
      "Descripcion": descripcion,
      "Precio": precio,
      "Imagen": imagen
    });
    result = "Registro exitoso";
  } catch (e) {
    result = "Error, no se realizó el registro";
  }
  return result;
}

//actualizar
Future<String> updateMenuComida(String uid, String nombreComida,
    String descripcion, String precio, String imagen) async {
  String result = "";
  try {
    await db.collection("MenuComida").doc(uid).set({
      "Nombre": nombreComida,
      "Descripcion": descripcion,
      "Precio": precio,
      "Imagen": imagen,
    });
    result = "Registro modificado con éxito";
  } catch (e) {
    result = "Error, no se pudo modicar el registro";
  }
  return result;
}

//eliminar desde firebase
Future<String> deleteMenuComida(String id) async {
  String result = "";
  try {
    await db.collection("MenuComida").doc(id).delete();
    result = "Registro eliminado con éxito";
  } catch (e) {
    result = "Error, no se pudo eliminar el registro";
  }
  return result;
}

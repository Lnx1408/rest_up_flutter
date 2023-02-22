// ignore_for_file: file_names, prefer_final_fields

class MenuRestaurante {
  String _plato, _imagen;
  double _precio;

  MenuRestaurante(this._plato, this._precio, this._imagen);

  static MenuRestaurante? fromJson(Map<String, dynamic> json) {
    if (json.isEmpty) {
      return null;
    } else {
      return MenuRestaurante(json["_plato"], json["_precio"], json["_imagen"]);
    }
  }

  get plato => _plato;
  get precio => _precio;
  get imagen => _imagen;
}

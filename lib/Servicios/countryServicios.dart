import 'dart:convert';
import 'package:ejercicio_paises/modelos/countryViewModel.dart';
import 'package:http/http.dart' as http;

// Clase servicio que se encarga de ir a la API y traer los datos.
// Es como un "mensajero": va a la API, recibe el JSON y lo convierte
// en una lista de objetos CountryViewModel.
class CountryServicios {
  final String _baseUrl = "https://restcountries.com";

  // Función que obtiene la lista de países
  Future<List<CountryViewModel>> getListadoPaises() async {
    final url = Uri.parse("$_baseUrl/v3.1/all?fields=name,capital,region,flags");

    // Lista donde guardaremos los países convertidos
    List<CountryViewModel> listaFinal = [];

    final response = await http.get(url);

    // Si la petición fue exitosa
    if (response.statusCode == 200) {
      List jsonList = jsonDecode(response.body);

      for (var item in jsonList) {
        CountryViewModel c = CountryViewModel();

        final nameObj = item["name"];
        c.name = nameObj is Map ? nameObj["common"] : null;

        final capitalObj = item["capital"];
        if (capitalObj is List && capitalObj.isNotEmpty) {
          c.capital = capitalObj.first;
        } else if (capitalObj is String) {
          c.capital = capitalObj;
        } else {
          c.capital = null;
        }

        c.region = item["region"];

        final flagsObj = item["flags"];
        String? svg;
        String? png;
        if (flagsObj is Map) {
          svg = flagsObj["svg"];
          png = flagsObj["png"];
        }
        c.flag = svg ?? png;

        listaFinal.add(c);
      }

      return listaFinal;
    } else {
      throw Exception("Error al obtener países desde la API");
    }
  }
}

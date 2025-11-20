// Modelo que representa a un País dentro de la aplicación.
// Sirve como una "plantilla" para guardar los datos que vienen de la API.
//
// La idea es convertir el JSON recibido en un OBJETO CountryViewModel,
// para poder usarlo fácilmente en la vista (UI).

class CountryViewModel {

  // Nombre del país
  String? name;

  // Capital del país
  String? capital;

  // Región del país (Asia, Europa, América, etc.)
  String? region;

  // URL de la bandera del país (imagen en la web)
  String? flag;
}
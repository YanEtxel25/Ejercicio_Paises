import 'package:flutter/material.dart';
import 'package:ejercicio_paises/modelos/countryViewModel.dart';
import 'package:ejercicio_paises/servicios/countryServicios.dart';

// Vista que muestra la lista de países obtenidos desde la API
class ViewPaises extends StatefulWidget {
  @override
  State<ViewPaises> createState() => _ViewPaisesState();
}

class _ViewPaisesState extends State<ViewPaises> {
  // Instancia del servicio para obtener los datos de la API
  CountryServicios servicio = CountryServicios();

  // Lista donde guardaremos los países convertidos
  List<CountryViewModel> listaPaises = [];

  // Indicador de carga
  bool estaCargando = true;

  @override
  void initState() {
    super.initState();
    cargarPaises();
  }

  // Función que obtiene los países desde la API
  void cargarPaises() async {
    try {
      listaPaises = await servicio.getListadoPaises();
    } catch (e) {
      print("Error al obtener países: $e");
    }

    // Cuando terminamos de cargar actualizamos el estado
    setState(() {
      estaCargando = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Países"),
        backgroundColor: Color(0xff480955),
      ),

      backgroundColor: Colors.white,

      // Si la información aún está cargando
      body: estaCargando
          ? Center(child: CircularProgressIndicator())
          // Cuando ya cargó mostramos los países
          : ListView.builder(
              itemCount: listaPaises.length,
              itemBuilder: (context, index) {
                final p = listaPaises[index];

                return Card(
                  elevation: 3,
                  margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),

                  child: ListTile(
                    // Bandera del país
                    leading: Image.network(
                      p.flag ?? "",
                      width: 55,
                      height: 40,
                      fit: BoxFit.cover,
                      errorBuilder: (c, o, s) => Icon(Icons.flag),
                    ),

                    // Nombre del país
                    title: Text(
                      p.name ?? "Sin nombre",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),

                    // Capital y región
                    subtitle: Text(
                      "Capital: ${p.capital}\nRegión: ${p.region}",
                    ),
                  ),
                );
              },
            ),
    );
  }
}

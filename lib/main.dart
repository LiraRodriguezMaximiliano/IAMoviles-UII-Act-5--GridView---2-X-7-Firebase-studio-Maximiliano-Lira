import 'package:flutter/material.dart';

void main() => runApp(const ProyectoLalaApp());

class ProyectoLalaApp extends StatelessWidget {
  const ProyectoLalaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Proyecto Lala - Catálogo de Red',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const PantallaCatalogoLala(),
    );
  }
}

class PantallaCatalogoLala extends StatelessWidget {
  const PantallaCatalogoLala({super.key});

  // --- DATOS DEL PROYECTO ---

  // 1. Lista de los 14 nombres de productos solicitados
  final List<String> nombresProductos = const [
    "Jamon", "Leche", "Jugo", "Mantequilla", "Queso", "Tocino", "Yogurt",
    "Crema", "Gelatina", "Media Crema", "Queso Panela", "Leche Polvo",
    "Lechita Cacao", "Margarina"
  ];

  // 2. Lista de URLs de REFERENCIA (Imágenes reales de Lala de la red)
  // Nota: Estas URLs son públicas y podrían cambiar, pero sirven de ejemplo perfecto.
  final List<String> urlsImagenesLala = const [
    // Jamon
    "https://raw.githubusercontent.com/LiraRodriguezMaximiliano/imagenes-para-flutter-6I-11-02-26/refs/heads/main/Jamon.jpg",
    // Leche
    "https://raw.githubusercontent.com/LiraRodriguezMaximiliano/imagenes-para-flutter-6I-11-02-26/refs/heads/main/L1.png",
    // Jugo
    "https://raw.githubusercontent.com/LiraRodriguezMaximiliano/imagenes-para-flutter-6I-11-02-26/refs/heads/main/Jugo.jpg",
    // Mantequilla
    "https://raw.githubusercontent.com/LiraRodriguezMaximiliano/imagenes-para-flutter-6I-11-02-26/refs/heads/main/Mantequilla.png",
    // Queso
    "https://raw.githubusercontent.com/LiraRodriguezMaximiliano/imagenes-para-flutter-6I-11-02-26/refs/heads/main/Manchego.jfif",
    // Tocino
    "https://raw.githubusercontent.com/LiraRodriguezMaximiliano/imagenes-para-flutter-6I-11-02-26/refs/heads/main/Tocino.jpg",
    // Yogurt
    "https://raw.githubusercontent.com/LiraRodriguezMaximiliano/imagenes-para-flutter-6I-11-02-26/refs/heads/main/Yogurt.png",
    // Crema
    "https://raw.githubusercontent.com/LiraRodriguezMaximiliano/imagenes-para-flutter-6I-11-02-26/refs/heads/main/Crema.jfif",
    // Gelatina
    "https://raw.githubusercontent.com/LiraRodriguezMaximiliano/imagenes-para-flutter-6I-11-02-26/refs/heads/main/Gelatina.jfif",
    // Media Crema
    "https://raw.githubusercontent.com/LiraRodriguezMaximiliano/imagenes-para-flutter-6I-11-02-26/refs/heads/main/Media%20Crema.jfif",
    // Queso Panela
    "https://raw.githubusercontent.com/LiraRodriguezMaximiliano/imagenes-para-flutter-6I-11-02-26/refs/heads/main/Queso.png",
    // Leche Polvo
    "https://raw.githubusercontent.com/LiraRodriguezMaximiliano/imagenes-para-flutter-6I-11-02-26/refs/heads/main/Polvo.jfif",
    // Batidillo (referencia de producto batido)
    "https://raw.githubusercontent.com/LiraRodriguezMaximiliano/imagenes-para-flutter-6I-11-02-26/refs/heads/main/Leche%20C.png",
    // Margarina
    "https://raw.githubusercontent.com/LiraRodriguezMaximiliano/imagenes-para-flutter-6I-11-02-26/refs/heads/main/Margarina.png"
  ];

  // --- CONSTRUCCIÓN DE LA PANTALLA ---

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Header azul clarito solicitado
        backgroundColor: const Color(0xFFB3E5FC),
        elevation: 1,
        title: const Text(
          "Maximiliano Lira 6-I",
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      // Fondo muy sutil para que resalten las tarjetas blancas
      backgroundColor: const Color(0xFFF0F8FF), 
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        // Cuadrícula dinámica: 2 columnas, 7 filas (14 items)
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 Columnas
            childAspectRatio: 0.75, // Ajusta proporción Alto/Ancho de la tarjeta
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemCount: nombresProductos.length, // 14
          itemBuilder: (context, index) {
            // Construimos cada tarjeta de producto
            return TarjetaProductoLala(
              nombre: nombresProductos[index],
              urlImagen: urlsImagenesLala[index],
            );
          },
        ),
      ),
    );
  }
}

// --- WIDGET PERSONALIZADO PARA CADA TARJETA ---

class TarjetaProductoLala extends StatelessWidget {
  final String nombre;
  final String urlImagen;

  const TarjetaProductoLala({
    super.key,
    required this.nombre,
    required this.urlImagen,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            // ÁREA DE IMAGEN (Arriba, expandida para ocupar espacio)
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[50], // Fondo sutil para la imagen
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  // *** AQUÍ ESTÁ LA MAGIA DE LA RED ***
                  child: Image.network(
                    urlImagen,
                    // contain: Muestra la imagen completa sin recortar
                    fit: BoxFit.contain, 
                    // Mostramos un cargando mientras descarga
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child; // Imagen cargada
                      return const Center(
                        child: CircularProgressIndicator(strokeWidth: 2), // Cargando...
                      );
                    },
                    // Si la URL falla (p.ej. sin internet), mostramos un icono de error
                    errorBuilder: (context, error, stackTrace) => Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.broken_image, size: 40, color: Colors.grey[400]),
                        const SizedBox(height: 5),
                        Text("Error de red", style: TextStyle(color: Colors.grey[500], fontSize: 10)),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),

            // NOMBRE DEL PRODUCTO (Abajo, centrado y en negrita)
            Text(
              nombre,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
              maxLines: 1, // Limita a una línea para mantener orden
              overflow: TextOverflow.ellipsis, // Si es muy largo, pone "..."
            ),
            
            const SizedBox(height: 4),
            
            const Text(
              "Producto Lala",
              style: TextStyle(fontSize: 12, color: Colors.blueGrey),
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

void main() => runApp(const ProyectoLalaApp());

class ProyectoLalaApp extends StatelessWidget {
  const ProyectoLalaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Proyecto Lala - Estrellas',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const PantallaCatalogoLala(),
    );
  }
}

class PantallaCatalogoLala extends StatelessWidget {
  const PantallaCatalogoLala({super.key});

  final List<String> nombresProductos = const [
    "Jamon", "Leche", "Jugo", "Mantequilla", "Queso", "Tocino", "Yogurt",
    "Crema", "Gelatina", "Media Crema", "Queso Panela", "Leche Polvo",
    "Lechita Cacao", "Margarina"
  ];

  final List<String> urlsImagenesLala = const [
    "https://raw.githubusercontent.com/LiraRodriguezMaximiliano/imagenes-para-flutter-6I-11-02-26/refs/heads/main/Jamon.jpg",
    "https://raw.githubusercontent.com/LiraRodriguezMaximiliano/imagenes-para-flutter-6I-11-02-26/refs/heads/main/L1.png",
    "https://raw.githubusercontent.com/LiraRodriguezMaximiliano/imagenes-para-flutter-6I-11-02-26/refs/heads/main/Jugo.jpg",
    "https://raw.githubusercontent.com/LiraRodriguezMaximiliano/imagenes-para-flutter-6I-11-02-26/refs/heads/main/Mantequilla.png",
    "https://raw.githubusercontent.com/LiraRodriguezMaximiliano/imagenes-para-flutter-6I-11-02-26/refs/heads/main/Manchego.jfif",
    "https://raw.githubusercontent.com/LiraRodriguezMaximiliano/imagenes-para-flutter-6I-11-02-26/refs/heads/main/Tocino.jpg",
    "https://raw.githubusercontent.com/LiraRodriguezMaximiliano/imagenes-para-flutter-6I-11-02-26/refs/heads/main/Yogurt.png",
    "https://raw.githubusercontent.com/LiraRodriguezMaximiliano/imagenes-para-flutter-6I-11-02-26/refs/heads/main/Crema.jfif",
    "https://raw.githubusercontent.com/LiraRodriguezMaximiliano/imagenes-para-flutter-6I-11-02-26/refs/heads/main/Gelatina.jfif",
    "https://raw.githubusercontent.com/LiraRodriguezMaximiliano/imagenes-para-flutter-6I-11-02-26/refs/heads/main/Media%20Crema.jfif",
    "https://raw.githubusercontent.com/LiraRodriguezMaximiliano/imagenes-para-flutter-6I-11-02-26/refs/heads/main/Queso.png",
    "https://raw.githubusercontent.com/LiraRodriguezMaximiliano/imagenes-para-flutter-6I-11-02-26/refs/heads/main/Polvo.jfif",
    "https://raw.githubusercontent.com/LiraRodriguezMaximiliano/imagenes-para-flutter-6I-11-02-26/refs/heads/main/Leche%20C.png",
    "https://raw.githubusercontent.com/LiraRodriguezMaximiliano/imagenes-para-flutter-6I-11-02-26/refs/heads/main/Margarina.png"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFB3E5FC),
        elevation: 1,
        title: const Text(
          "Maximiliano Lira 6-I",
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
      backgroundColor: const Color(0xFFF0F8FF), 
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, 
            childAspectRatio: 0.75, 
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemCount: nombresProductos.length,
          itemBuilder: (context, index) {
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

class TarjetaProductoLala extends StatelessWidget {
  final String nombre;
  final String urlImagen;

  const TarjetaProductoLala({super.key, required this.nombre, required this.urlImagen});

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
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[50],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    urlImagen,
                    fit: BoxFit.contain,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return const Center(child: CircularProgressIndicator(strokeWidth: 2));
                    },
                    errorBuilder: (context, error, stackTrace) => const Icon(Icons.broken_image, size: 40, color: Colors.grey),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              nombre,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black87),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            
            // --- AQUÍ ESTÁN LAS 5 ESTRELLITAS ---
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.star, color: Colors.amber, size: 16),
                Icon(Icons.star, color: Colors.amber, size: 16),
                Icon(Icons.star, color: Colors.amber, size: 16),
                Icon(Icons.star, color: Colors.amber, size: 16),
                Icon(Icons.star, color: Colors.amber, size: 16),
              ],
            ),
            const SizedBox(height: 2),
          ],
        ),
      ),
    );
  }
}

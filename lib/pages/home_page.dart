import 'package:flutter/material.dart';
import 'package:myapp/widgets/side_menu.dart'; // Importe o novo componente

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Colors.cyanAccent;
    const Color backgroundColor = Color(0xFF0B132B);
    const Color cardColor = Color(0xFF1C2541);

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: cardColor,
        elevation: 0,
        title: const Text(
          'SINGER - MONITORAMENTO',
          style: TextStyle(letterSpacing: 2, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: primaryColor),
      ),
      
      // INSTANCIANDO O COMPONENTE REUTILIZÁVEL
      drawer: const SideMenu(),

      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [backgroundColor, Color(0xFF1C2541)],
          ),
        ),
        child: const Center(
          child: Text(
            'BEM-VINDO AO SISTEMA SINGER',
            style: TextStyle(color: Colors.white24, letterSpacing: 2),
          ),
        ),
      ),
    );
  }
}
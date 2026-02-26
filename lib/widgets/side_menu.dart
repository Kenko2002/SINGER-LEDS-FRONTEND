import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Colors.cyanAccent;
    const Color backgroundColor = Color(0xFF0B132B);
    const Color cardColor = Color(0xFF1C2541);

    return Drawer(
      backgroundColor: cardColor,
      child: Column(
        children: [
          // Cabeçalho fixo do Menu
          DrawerHeader(
            decoration: const BoxDecoration(color: backgroundColor),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.bolt_rounded, color: primaryColor, size: 40),
                  SizedBox(height: 10),
                  Text(
                    'SINGER SYSTEM',
                    style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Itens do Menu
          _buildMenuItem(context, Icons.dashboard_outlined, 'Dashboard Total', '/home'),
          _buildMenuItem(context, Icons.precision_manufacturing_outlined, 'Unidades de Negócio', '/unidades'),
          _buildMenuItem(context, Icons.electric_meter_outlined, 'Medidores', '/medidores'),
          _buildMenuItem(context, Icons.factory_outlined, 'Usinas', '/usinas'),
          
          const Divider(color: Colors.white24, indent: 20, endIndent: 20),
          
          _buildMenuItem(context, Icons.settings_outlined, 'Configurações', '/settings'),
          
          const Spacer(),

          // Botão Sair
          _buildMenuItem(
            context, 
            Icons.logout_rounded, 
            'Sair', 
            '/', 
            color: Colors.redAccent,
            isLogout: true
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context, 
    IconData icon, 
    String title, 
    String routeName, 
    {Color color = Colors.white, bool isLogout = false}
  ) {
    return ListTile(
      leading: Icon(icon, color: color == Colors.white ? Colors.cyanAccent : color),
      title: Text(title, style: TextStyle(color: color, fontSize: 14)),
      onTap: () {
        // Fecha o drawer antes de navegar
        Navigator.pop(context);
        
        // Se for logout ou se a rota for diferente da atual, navega
        if (isLogout) {
          Navigator.pushReplacementNamed(context, '/');
        } else {
          // Aqui você pode implementar a navegação real quando criar as outras páginas
          print('Navegando para $routeName');
        }
      },
    );
  }
}
// lib/presentation/appearance_settings_screen.dart
import 'package:flutter/material.dart';

class AppearanceSettingsScreen extends StatelessWidget {
  const AppearanceSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final baseTheme = Theme.of(context);
    final isDark = baseTheme.brightness == Brightness.dark;

    
    const Color upeuPurple = Color(0xFF570089);
    const Color upeuLightPurple = Color(0xFFF3ECF9);
    const Color upeuAccent = Color(0xFF9B4DFF);

    
    final localTheme = baseTheme.copyWith(
      appBarTheme: AppBarTheme(
        backgroundColor: isDark ? upeuAccent : upeuPurple,
        foregroundColor: Colors.white,
      ),
      scaffoldBackgroundColor: isDark
          ? const Color(0xFF1E1E1E)
          : Colors.white, 
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: isDark ? upeuAccent : upeuLightPurple,
          foregroundColor: isDark ? Colors.white : upeuPurple,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(999),
          ),
          elevation: isDark ? 1 : 0,
        ),
      ),
      textTheme: baseTheme.textTheme.apply(
        bodyColor: isDark ? Colors.white : Colors.black,
        displayColor: isDark ? Colors.white : Colors.black,
      ),
    );

    return Theme(
      data: localTheme,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Apariencia (tema local)'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Esta pantalla usa un tema local',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: isDark ? Colors.white : Colors.black,
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: isDark ? upeuAccent : upeuPurple,
                      content: const Text(
                        'Este SnackBar usa el tema local!',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                },
                child: const Text('Botón con colores locales'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

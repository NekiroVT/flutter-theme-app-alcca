# 🌙 flutter-theme-app-alcca

Aplicación Flutter diseñada para **demostrar el uso avanzado de temas personalizados**, modo **claro/oscuro**, y **ThemeExtension** para crear experiencias visuales coherentes, modernas y adaptables.

Este proyecto muestra cómo aplicar un **tema global**, un **tema local por pantalla**, y cómo **extender ThemeData** para personalizar componentes como pantallas de login y registro.

---

## 🎯 Objetivo

- Aplicar **temas personalizados** en Flutter.  
- Analizar el **impacto visual** del tema en diferentes pantallas.  
- Implementar **modo claro y oscuro** dinámico con `ThemeMode`.  
- Crear un **tema local** con `Theme.of(context).copyWith()`.  
- Extender el sistema de temas usando **ThemeExtension** para colores, gradientes y bordes.  

---

## 🧩 Estructura del proyecto

```text
lib/
 ├─ main.dart
 ├─ theme/
 │   ├─ app_theme.dart                 # Tema global (light y dark)
 │   ├─ auth_theme_extension.dart      # Extensión para pantallas de autenticación
 │   └─ custom_theme_extension.dart    # Extensión para colores personalizados
 ├─ presentation/
 │   ├─ dashboard_screen.dart          # Pantalla principal con switch de tema
 │   ├─ auth_login_screen.dart         # Login adaptado a claro/oscuro
 │   ├─ auth_register_screen.dart      # Registro adaptado a claro/oscuro
 │   └─ appearance_settings_screen.dart # Ejemplo de tema local
 └─ widgets/
     └─ (componentes adicionales si se agregan)
```
Coppyright:

NekiroVT © coppyright - Todos los derechos reservados 2025

Aprende Flutter en:


- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)


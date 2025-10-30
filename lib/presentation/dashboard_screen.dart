// lib/presentation/dashboard_screen.dart
import 'package:flutter/material.dart';
import 'auth_login_screen.dart';
import 'auth_register_screen.dart';
import 'appearance_settings_screen.dart';
import '../theme/custom_theme_extension.dart';

class DashboardScreen extends StatelessWidget {
  final bool isDarkMode;
  final ValueChanged<bool> onThemeChanged;

  const DashboardScreen({
    super.key,
    required this.isDarkMode,
    required this.onThemeChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final custom = theme.extension<CustomThemeExtension>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Theme Mode'),
        actions: [
          Row(
            children: [
              Icon(
                isDarkMode ? Icons.dark_mode : Icons.light_mode,
                size: 20,
              ),
              Switch(
                value: isDarkMode,
                onChanged: onThemeChanged,
              ),
              const SizedBox(width: 8),
            ],
          ),
        ],
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 250),
        child: SingleChildScrollView(
          key: ValueKey(isDarkMode),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              Text(
                'Hola Ingeniero!👋',
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Demostración de tema claro, oscuro y tema local.',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.textTheme.bodyMedium?.color?.withOpacity(0.7),
                ),
              ),
              const SizedBox(height: 20),

              
              Row(
                children: [
                  _StatusCard(
                    label: 'Modo',
                    value: isDarkMode ? 'Oscuro' : 'Claro',
                    icon: isDarkMode ? Icons.dark_mode : Icons.light_mode,
                    background: theme.colorScheme.primaryContainer
                        .withOpacity(isDarkMode ? 0.25 : 0.5),
                    iconColor: theme.colorScheme.onPrimaryContainer,
                  ),
                  const SizedBox(width: 12),
                  _StatusCard(
                    label: 'Theme local',
                    value: 'Config',
                    icon: Icons.tune,
                    background:
                        theme.colorScheme.secondaryContainer.withOpacity(0.35),
                    iconColor: theme.colorScheme.onSecondaryContainer,
                  ),
                ],
              ),

              const SizedBox(height: 24),

              Text(
                'Pantallas',
                style: theme.textTheme.titleLarge
                    ?.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 12),

              _NavTile(
                title: 'Login',
                subtitle: 'Vista ajustable al modo | Claro / Oscuro |',
                icon: Icons.login_rounded,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const AuthLoginScreen()),
                  );
                },
              ),
              const SizedBox(height: 10),
              _NavTile(
                title: 'Registro',
                subtitle: 'Vista ajustable al modo | Claro / Oscuro |',
                icon: Icons.person_add_alt_1,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const AuthRegisterScreen()),
                  );
                },
              ),
              const SizedBox(height: 10),
              _NavTile(
                title: 'Apariencia (tema local)',
                subtitle: 'Implementación de Theme.of(context).copyWith()',
                icon: Icons.palette_outlined,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const AppearanceSettingsScreen()),
                  );
                },
              ),

              const SizedBox(height: 26),

              Text(
                'Colores personalizados (ThemeExtension)',
                style: theme.textTheme.titleMedium,
              ),
              const SizedBox(height: 12),

              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: [
                  _ColorBox(
                    label: 'Success',
                    color: custom?.successColor ?? Colors.green,
                  ),
                  _ColorBox(
                    label: 'Warning',
                    color: custom?.warningColor ?? Colors.orange,
                  ),
                  _ColorBox(
                    label: 'Info',
                    color: custom?.infoColor ?? Colors.blue,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatusCard extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final Color background;
  final Color iconColor;

  const _StatusCard({
    required this.label,
    required this.value,
    required this.icon,
    required this.background,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: iconColor,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(icon, color: Colors.white, size: 20),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label,
                    style: theme.textTheme.labelMedium
                        ?.copyWith(color: theme.hintColor)),
                Text(
                  value,
                  style: theme.textTheme.titleMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _NavTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onTap;

  const _NavTile({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: Ink(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: theme.colorScheme.surfaceVariant.withOpacity(0.25),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: theme.colorScheme.primary.withOpacity(0.15),
              child: Icon(icon, color: theme.colorScheme.primary),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: theme.textTheme.titleMedium
                        ?.copyWith(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    subtitle,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color:
                          theme.textTheme.bodySmall?.color?.withOpacity(0.65),
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right_rounded),
          ],
        ),
      ),
    );
  }
}

class _ColorBox extends StatelessWidget {
  final String label;
  final Color color;

  const _ColorBox({
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: 115,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.16),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: color.withOpacity(0.4)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: theme.textTheme.labelLarge,
          ),
        ],
      ),
    );
  }
}

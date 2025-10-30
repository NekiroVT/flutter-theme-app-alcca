// lib/theme/custom_theme_extension.dart
import 'package:flutter/material.dart';

@immutable
class CustomThemeExtension extends ThemeExtension<CustomThemeExtension> {
  final Color? successColor;
  final Color? warningColor;
  final Color? infoColor;

  const CustomThemeExtension({
    this.successColor,
    this.warningColor,
    this.infoColor,
  });

  @override
  CustomThemeExtension copyWith({
    Color? successColor,
    Color? warningColor,
    Color? infoColor,
  }) {
    return CustomThemeExtension(
      successColor: successColor ?? this.successColor,
      warningColor: warningColor ?? this.warningColor,
      infoColor: infoColor ?? this.infoColor,
    );
  }

  @override
  CustomThemeExtension lerp(ThemeExtension<CustomThemeExtension>? other, double t) {
    if (other is! CustomThemeExtension) return this;
    return CustomThemeExtension(
      successColor: Color.lerp(successColor, other.successColor, t),
      warningColor: Color.lerp(warningColor, other.warningColor, t),
      infoColor: Color.lerp(infoColor, other.infoColor, t),
    );
  }

  
  static const light = CustomThemeExtension(
    successColor: Colors.green,
    warningColor: Colors.orange,
    infoColor: Colors.blue,
  );

  static const dark = CustomThemeExtension(
    successColor: Colors.lightGreen,
    warningColor: Colors.deepOrange,
    infoColor: Colors.lightBlueAccent,
  );
}

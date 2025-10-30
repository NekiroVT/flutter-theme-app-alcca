// lib/theme/auth_theme_extension.dart
import 'package:flutter/material.dart';

@immutable
class AuthThemeExtension extends ThemeExtension<AuthThemeExtension> {
  final Gradient? loginGradient;
  final Gradient? registerGradient;
  final Color? authPrimaryColor;
  final BorderRadius? cardRadius;
  final Color? cardBackgroundLight;
  final Color? cardBackgroundDark;
  final Color? buttonForegroundLight;
  final Color? buttonForegroundDark;

  const AuthThemeExtension({
    this.loginGradient,
    this.registerGradient,
    this.authPrimaryColor,
    this.cardRadius,
    this.cardBackgroundLight,
    this.cardBackgroundDark,
    this.buttonForegroundLight,
    this.buttonForegroundDark,
  });

  @override
  AuthThemeExtension copyWith({
    Gradient? loginGradient,
    Gradient? registerGradient,
    Color? authPrimaryColor,
    BorderRadius? cardRadius,
    Color? cardBackgroundLight,
    Color? cardBackgroundDark,
    Color? buttonForegroundLight,
    Color? buttonForegroundDark,
  }) {
    return AuthThemeExtension(
      loginGradient: loginGradient ?? this.loginGradient,
      registerGradient: registerGradient ?? this.registerGradient,
      authPrimaryColor: authPrimaryColor ?? this.authPrimaryColor,
      cardRadius: cardRadius ?? this.cardRadius,
      cardBackgroundLight: cardBackgroundLight ?? this.cardBackgroundLight,
      cardBackgroundDark: cardBackgroundDark ?? this.cardBackgroundDark,
      buttonForegroundLight:
          buttonForegroundLight ?? this.buttonForegroundLight,
      buttonForegroundDark: buttonForegroundDark ?? this.buttonForegroundDark,
    );
  }

  @override
  AuthThemeExtension lerp(ThemeExtension<AuthThemeExtension>? other, double t) {
    if (other is! AuthThemeExtension) return this;
    return AuthThemeExtension(
      loginGradient: Gradient.lerp(loginGradient, other.loginGradient, t),
      registerGradient:
          Gradient.lerp(registerGradient, other.registerGradient, t),
      authPrimaryColor:
          Color.lerp(authPrimaryColor, other.authPrimaryColor, t),
      cardRadius: BorderRadius.lerp(cardRadius, other.cardRadius, t),
      cardBackgroundLight:
          Color.lerp(cardBackgroundLight, other.cardBackgroundLight, t),
      cardBackgroundDark:
          Color.lerp(cardBackgroundDark, other.cardBackgroundDark, t),
      buttonForegroundLight:
          Color.lerp(buttonForegroundLight, other.buttonForegroundLight, t),
      buttonForegroundDark:
          Color.lerp(buttonForegroundDark, other.buttonForegroundDark, t),
    );
  }

  
  static AuthThemeExtension light = AuthThemeExtension(
    
    authPrimaryColor: const Color(0xFF0D47A1), 
    loginGradient: const LinearGradient(
      colors: [
        Color(0xFF0D47A1),
        Color(0xFF42A5F5),
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    registerGradient: const LinearGradient(
      colors: [
        Color(0xFF1565C0),
        Color(0xFF64B5F6),
      ],
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
    ),
    cardRadius: const BorderRadius.all(Radius.circular(22)),
    
    cardBackgroundLight: Colors.white.withOpacity(0.9),
    
    cardBackgroundDark: const Color(0xFF1F2937),
    
    buttonForegroundLight: Colors.white,
    buttonForegroundDark: Colors.black,
  );

  
  static AuthThemeExtension dark = AuthThemeExtension(
    authPrimaryColor: const Color(0xFF90CAF9), 
    loginGradient: const LinearGradient(
      colors: [
        Color(0xFF0F172A), 
        Color(0xFF1E293B),
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    registerGradient: const LinearGradient(
      colors: [
        Color(0xFF0F172A),
        Color(0xFF334155),
      ],
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
    ),
    cardRadius: const BorderRadius.all(Radius.circular(22)),
    
    cardBackgroundLight: const Color(0xFF0F172A),
    cardBackgroundDark: const Color(0xFF0F172A), 
    buttonForegroundLight: Colors.white,
    buttonForegroundDark: Colors.black,
  );
}

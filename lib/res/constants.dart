import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFF855400),
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFFFFDDB7),
  onPrimaryContainer: Color(0xFF2A1700),
  secondary: Color(0xFF705B41),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFFFCDEBC),
  onSecondaryContainer: Color(0xFF281905),
  tertiary: Color(0xFF944A00),
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xFFFFDCC6),
  onTertiaryContainer: Color(0xFF301400),
  error: Color(0xFFBA1A1A),
  errorContainer: Color(0xFFFFDAD6),
  onError: Color(0xFFFFFFFF),
  onErrorContainer: Color(0xFF410002),
  background: Color(0xFFFFFBFF),
  onBackground: Color(0xFF1F1B16),
  surface: Color(0xFFFFFBFF),
  onSurface: Color(0xFF1F1B16),
  surfaceVariant: Color(0xFFF0E0D0),
  onSurfaceVariant: Color(0xFF504539),
  outline: Color(0xFF827568),
  onInverseSurface: Color(0xFFF9EFE7),
  inverseSurface: Color(0xFF352F2A),
  inversePrimary: Color(0xFFFFB95C),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF855400),
  outlineVariant: Color(0xFFD4C4B5),
  scrim: Color(0xFF000000),
);

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFFFFB95C),
  onPrimary: Color(0xFF462A00),
  primaryContainer: Color(0xFF653E00),
  onPrimaryContainer: Color(0xFFFFDDB7),
  secondary: Color(0xFFDFC2A2),
  onSecondary: Color(0xFF3F2D17),
  secondaryContainer: Color(0xFF57432B),
  onSecondaryContainer: Color(0xFFFCDEBC),
  tertiary: Color(0xFFFFB784),
  onTertiary: Color(0xFF4F2500),
  tertiaryContainer: Color(0xFF713700),
  onTertiaryContainer: Color(0xFFFFDCC6),
  error: Color(0xFFFFB4AB),
  errorContainer: Color(0xFF93000A),
  onError: Color(0xFF690005),
  onErrorContainer: Color(0xFFFFDAD6),
  background: Color(0xFF1F1B16),
  onBackground: Color(0xFFEBE1D9),
  surface: Color(0xFF1F1B16),
  onSurface: Color(0xFFEBE1D9),
  surfaceVariant: Color(0xFF504539),
  onSurfaceVariant: Color(0xFFD4C4B5),
  outline: Color(0xFF9C8E80),
  onInverseSurface: Color(0xFF1F1B16),
  inverseSurface: Color(0xFFEBE1D9),
  inversePrimary: Color(0xFF855400),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFFFFB95C),
  outlineVariant: Color(0xFF504539),
  scrim: Color(0xFF000000),
);

var tabTextTheme = GoogleFonts.montserrat(fontWeight: FontWeight.w700);

double edgePadding = 0;
double appBarPadding = 0;
double actionsLength = 0;

final GlobalKey appBarKey = GlobalKey();
final GlobalKey homeKey = GlobalKey();
final GlobalKey aboutKey = GlobalKey();
final GlobalKey heritageKey = GlobalKey();
final GlobalKey industryKey = GlobalKey();
final GlobalKey csrKey = GlobalKey();
final GlobalKey blogKey = GlobalKey();
final GlobalKey contactKey = GlobalKey();

List<GlobalKey> keys = [homeKey,aboutKey,heritageKey,csrKey];
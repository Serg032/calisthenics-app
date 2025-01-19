class AppConfig {
  // Detecta si la aplicación está corriendo en modo producción
  static const bool isProduction = bool.fromEnvironment(
    'dart.vm.product', // Esta variable se activa automáticamente en compilaciones de producción
    defaultValue: false, // Por defecto, no es producción
  );

  // Devuelve la URL base dependiendo del entorno
  static String get apiBaseUrl {
    return isProduction
        ? 'https://api.produccion.com' // URL para producción
        : 'https://ek4bzofg49.execute-api.eu-west-1.amazonaws.com'; // URL para desarrollo
  }
}

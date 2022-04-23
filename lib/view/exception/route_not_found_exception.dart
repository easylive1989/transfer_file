class RouteNotFoundException implements Exception {
  final String message;

  RouteNotFoundException(this.message);
}
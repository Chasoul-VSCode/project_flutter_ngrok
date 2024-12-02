class Config {
  static const String baseUrl = 'https://f8d8-182-253-176-172.ngrok-free.app';

  static String getApiUrl(String endpoint) {
    return '$baseUrl/api/$endpoint';
  }
}

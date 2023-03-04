import 'package:dio/dio.dart';

class PlacesInterceptor extends Interceptor {
  final accessToken =
      'pk.eyJ1IjoibG1haW5kdXN0cmllcyIsImEiOiJjbDFkcTJsaTEwYzY2M2RuMm9nOWJuamg3In0.cIHVSgGgaiYEhmpMOlzhtQ';

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.queryParameters.addAll({
      'limit': 5,
      'types': '',
      'language': 'es',
      'access_token': accessToken
    });
    // TODO: implement onRequest
    super.onRequest(options, handler);
  }
}

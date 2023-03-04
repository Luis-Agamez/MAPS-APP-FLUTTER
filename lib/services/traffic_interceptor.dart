import 'package:dio/dio.dart';

class TrafficInterceptor extends Interceptor {
  @override
  final access_token =
      'pk.eyJ1IjoibG1haW5kdXN0cmllcyIsImEiOiJjbDFkcTJsaTEwYzY2M2RuMm9nOWJuamg3In0.cIHVSgGgaiYEhmpMOlzhtQ';

  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.queryParameters.addAll({
      'alternatives': true,
      'geometries': 'polyline6',
      'overview': 'simplified',
      'steps': false,
      'access_token': access_token
    });
    // TODO: implement onRequest
    super.onRequest(options, handler);
  }
}

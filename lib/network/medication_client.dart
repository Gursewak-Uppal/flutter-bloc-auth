import 'package:http/http.dart' as http;


class MedicationClient extends http.BaseClient {
  final http.Client _inner;

  MedicationClient( this._inner);

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    return _inner.send(request);
  }
}
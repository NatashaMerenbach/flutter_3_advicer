import 'dart:convert';

import 'package:flutter_3_advicer/1_domain/repositories/advice_repository.dart';
import 'package:http/http.dart' as http;

class AdviceRepositoryImpl implements AdviceRepository {
  AdviceRepositoryImpl(this._client);

  static final Uri _adviceUri = Uri.https('api.adviceslip.com', '/advice');

  final http.Client _client;

  @override
  Future<String> fetchAdvice() async {
    late final http.Response response;
    try {
      response = await _client.get(_adviceUri);
    } on http.ClientException catch (error) {
      throw AdviceFetchException('Unable to fetch advice: ${error.message}');
    }

    if (response.statusCode != 200) {
      throw AdviceFetchException(
        'The advice service returned status ${response.statusCode}.',
      );
    }

    late final Object? decodedResponse;
    try {
      decodedResponse = jsonDecode(response.body);
    } on FormatException {
      throw const AdviceFetchException(
        'The advice service returned an invalid response.',
      );
    }

    if (decodedResponse is! Map<String, dynamic> ||
        decodedResponse['slip'] is! Map<String, dynamic>) {
      throw const AdviceFetchException(
        'The advice service returned an invalid response.',
      );
    }

    final advice = decodedResponse['slip']['advice'];
    if (advice is! String || advice.isEmpty) {
      throw const AdviceFetchException(
        'The advice service returned an invalid response.',
      );
    }

    return advice;
  }

  void dispose() => _client.close();
}

class AdviceFetchException implements Exception {
  const AdviceFetchException(this.message);

  final String message;
}

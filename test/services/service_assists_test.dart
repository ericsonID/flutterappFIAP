import 'dart:convert';
import 'dart:io';


import 'package:appabctech/model/assist.dart';
import 'package:appabctech/provider/assist_provider.dart';
import 'package:appabctech/services/assists_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get_connect.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'assist_service_test.mocks.dart';

@GenerateMocks([IAssistProvider])
void main() {
  late AssistsService service;
  late MockAssistProviderInterface provider;

  setUp(() async {
    provider = MockAssistProviderInterface();
    service = AssistsService(assistProvider: provider);

    String json =
        File('${Directory.current.path}/test/resources/assist_response.json')
            .readAsStringSync();
    when(provider.getAssists()).thenAnswer((_) async => Future.sync(
        () => Response(statusCode: HttpStatus.ok, body: jsonDecode(json))));
  });

  test('Testando o retorno com sucesso', () async {
    List<Assist> lista = await service.getAssists();
    expect(lista.length, 6);
    expect(lista[0].id, 1);
  });
}
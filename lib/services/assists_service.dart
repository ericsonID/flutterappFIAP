import 'package:appabctech/model/assist.dart';
import 'package:appabctech/provider/assist_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AssistsService extends GetxService{
  late IAssistProvider assistProvider;

  AssistsService({required this.assistProvider});

  Future<List<Assist>> getAssists() async{
    Response response = await assistProvider.getAssists();

    if(response.hasError){
      return Future.error(ErrorDescription("Erro na Conexão"));
    }
    try{
      List<Assist> listResult = 
        response.body.map<Assist>((item)=> Assist.fromMap(item)).toList();
      return Future.sync(() => listResult);
    }
    catch (e){
      e.printError();
      return Future.error(e.toString());
    }
  }
}
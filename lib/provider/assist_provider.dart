import 'package:appabctech/const.dart';
import 'package:get/get_connect.dart';

abstract class IAssistProvider{
  Future<Response> getAssists();
}

class AssistProvider extends GetConnect implements IAssistProvider{
  @override
  Future<Response> getAssists() => get ('{$Const.url}/assistance');
}
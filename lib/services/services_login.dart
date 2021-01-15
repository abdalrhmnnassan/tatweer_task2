// this function to login with the correct UserName and Password by API
import 'dart:convert';

import 'package:storeaksdk/models/Identity/IdentityParameters/LoginModel.dart';
import 'package:storeaksdk/models/Identity/Token.dart';
import 'package:storeaksdk/models/Model.dart';
import 'package:storeaksdk/models/result_classes.dart';
import 'package:storeaksdk/services/StoreakSDKService.dart';
// function to login user
Future <ResponseState<Token>> login(String username , String password) async {
  LoginModel loginBody = LoginModel(username:username ,password:password ,clientId:"d07204ae-4ea4-45c7-b6fb-64969f778ea1",clientSecret:"3zsCDFefv54HIRlljzNU1VPEulg60P8R");
  var body = await StoreakSdkService().identityService.postToken(loginBody);
return body;
}

// fetch token from api
Future log(String username , String password) async{
  var body =  await login(username, password);
  if (body is SuccessState<Token>) {
    Token token =  body.data;
    return {'bool':true,'result':token};
  }
  else if (body is ErrorState<Token>) {
    Model errorModel = body.errorMessage;
    var error =errorModel.error.message;

    return {'bool':false,'result':error};
  }

}
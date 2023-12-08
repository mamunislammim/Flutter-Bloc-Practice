import 'dart:convert';
import 'package:bloc_state_management_practice/Repository/apis.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Repository {
  Future<String> loginApi(String cid, String userID, String password) async {
    String url = AllApis().loginApi;
    try{
      var response = await http.get(Uri.parse("${url}cid=$cid&user_id=$userID&user_pass=$password"));
      var data = jsonDecode(response.body);
      if (data['status'] == 'Success') {
        return "0";
      }
    }catch (e){
      debugPrint("Error : $e");
    }
    return "1";
  }
}

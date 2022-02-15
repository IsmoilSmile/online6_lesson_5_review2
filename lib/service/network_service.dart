import 'dart:convert';

import 'package:http/http.dart';


class HttpService {
  // Base url
  static String BASE_URL = "jsonplaceholder.typicode.com";

  // Header
  static Map<String, String> headers = {
    'Content-Type': 'application/json; charset=UTF-8'
  };

  ///  Future<String?>GET(String api, Map<String, String>params)  String api o'rniga  API_TODO_LIST dan foydalanamiz
  static String API_TODO_LIST = "/todos";

  ///  Future<String?>GET(String api, Map<String, String>params)  String api o'rniga  API_TODO_ONE dan foydalanamiz
  ///bu ham get funksiyasida foydalanamiz faqat nechanchi id dagisini olishni aytamiz
  static String API_TODO_ONE = "/todos/"; //{id}

  static String API_TODO_CREATE = "/todos";
  static String API_TODO_UPDATE = "/todos/"; //{id}
  static String API_TODO_EDIT = "/todos/"; //{id}
  static String API_TODO_DELETE = "/todos/"; //{id}

  /// method

  /// postlar listini olish uchun function
  static Future<String?> GET(String api, Map<String, String> params) async {
    var url = Uri.https(BASE_URL, api, params);
    var response = await get(url, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  /// yangi post yaratish uchunn
  static Future<String?> POST(String api, Map<String, String> params) async {
    var url = Uri.https(BASE_URL, api);
    var resalt = await post(url, headers: headers, body: jsonEncode(params));
    if (resalt.statusCode == 201 ||resalt.statusCode==200) {
      return resalt.body;
    }
    return null;
  }

  /// servadigi malumotlarni yangilash uchun
  static Future<String?>PUT(String api, Map<String, String>params)async{
    var url =Uri.https(BASE_URL, api);
    var response=await put(url,headers:headers,body: jsonEncode(params) );
    if(response.statusCode==200){
      return response.body;
    }
    return null;
  }

  /// serverda kiritilgan obyectning bitta elementini o'zgartirish uchun
  static Future<String?> PATCH(String api ,Map<String, String>params)async{
    var url = Uri.https(BASE_URL, api);
    var response=await patch(url,headers: headers,body: jsonEncode(params));
    print(response.statusCode);
    if(response.statusCode == 200){
      print(response.body);
      return response.body;
    }
    return null;
  }


  ///                     #params

  /// GET function uchun funksiya static Future<String?>GET(String api, Map<String, String>params)
  ///  Map<String, String>params o'rniga  paramEmpty() funksiyadan foydalanamiz
  static Map<String, String> paramEmpty() {
    Map<String, String> map = {};
    return map;
  }

  ///  static Future<String?> POST(String api, Map<String, String> params)   Map<String, String> params orniga foydalanishda
  ///   static Map<String, String> createPost(Todo todo) funksiyani chaqirib foydanamiz
  static Map<String, String> createPost(Todo todo) {
    Map <String , String>map={
      "userId": todo.userId.toString(),
      "title": todo.title,
      "comleted": todo.comleted.toString()
    };
    return map;
  }

  static Map<String, String> updatePost(Todo todo) {
    return {
      "id":todo.id.toString(),
      "userId": todo.userId.toString(),
      "title": todo.title,
      "comleted": todo.comleted.toString()
    };
  }

  static Map<String, String> edetingPost(String key,String value) {
    return {
      key:value
    };
  }

}

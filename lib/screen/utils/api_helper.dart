import 'dart:convert';
import 'package:exam_train_api/screen/home/model/home_model.dart';
import 'package:http/http.dart' as http;


class ApiHelper
{
  Future<HomeModel> ApiCall(String name)
  async {
    String link = "https://trains.p.rapidapi.com/";
    Uri uri = Uri.parse(link);
    var result = await http.get(uri);
    var json = jsonDecode(result.body);
    HomeModel homeModel = HomeModel.fromJson(json);
    return homeModel;
  }
}
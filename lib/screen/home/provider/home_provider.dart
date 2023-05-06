import 'package:flutter/cupertino.dart';
import '../../utils/api_helper.dart';
import '../model/home_model.dart';

class HomeProvider extends ChangeNotifier {
  ApiHelper apiHelper = ApiHelper();
  HomeModel? homeModel;


  String Name = "surat memu";
  TextEditingController txtcityname = TextEditingController();

  void changeData(String name){
    Name = name;
    notifyListeners();
  }
  Future<HomeModel?> weatherData(String name) async {
    homeModel= await apiHelper.ApiCall(name);
    return homeModel;
  }
}
//provi
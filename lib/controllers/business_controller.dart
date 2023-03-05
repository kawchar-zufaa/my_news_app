import 'dart:convert';

import 'package:get/get.dart';
import 'package:my_news_app/constants/my_url.dart';
import 'package:http/http.dart'as http;
class BusinessController extends GetxController{

  var isLoading = true.obs;
  var businessNews=[].obs;


  @override
  void onInit() {
    fetchBusinessNews();
    super.onInit();
  }

  Future<void> fetchBusinessNews()async{

    try{
    isLoading(true);
      final url="${MyUrl.businessApi}&${MyUrl.apiKey}";
      final response=await http.get(Uri.parse(url));

      if(response.statusCode==200){
        final Map<String,dynamic> json=jsonDecode(response.body);
        businessNews.value=json['articles']as List;
      }else{
        throw Exception("Failed to load data");
      }
    }finally{
      isLoading(false);
    }

  }

}
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_automation_app/screen/homepage.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
class Services{
  saveAddressFunction(String address)async{
    // Saving response in shared preference
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('ip_address', address);
        Get.to(HomePage());
    }

  bulbServiceFunction(String switchBulb) async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String ipAddress = prefs.getString('ip_address');
    var apiUrl =
        Uri.parse("http://$ipAddress/BULB=$switchBulb");
    print(apiUrl);
    await http.get(apiUrl).timeout(const Duration(seconds: 15), onTimeout: () {return null;});

    
  }

  autoServiceFunction(String switchBulb) async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String ipAddress = prefs.getString('ip_address');
    var apiUrl =
    Uri.parse("http://$ipAddress/AUTOMODE=$switchBulb");
    print(apiUrl);
    await http.get(apiUrl).timeout(const Duration(seconds: 15), onTimeout: () {return null;});


  }

  fanServiceFunction(String switchFan)async{
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String ipAddress = prefs.getString('ip_address');
    var apiUrl =
        Uri.parse("http://$ipAddress/FAN=$switchFan");
    print(apiUrl);
    await http.get(apiUrl);

   
  }

  tvServiceFunction(String switchTv)async{
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String ipAddress = prefs.getString('ip_address');
    var apiUrl =
        Uri.parse("http://$ipAddress/TV=$switchTv");
    print(apiUrl);
    await http.get(apiUrl);

   
  }

  automaticMode(String switchMode)async{
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String ipAddress = prefs.getString('ip_address');
    var apiUrl =
        Uri.parse("http://$ipAddress/AUTO=$switchMode");
    print(apiUrl);
    final response = await http.get(apiUrl);

   
  }

}
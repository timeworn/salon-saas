/*
  Authors : initappz (Rahul Jograna)
  Website : https://initappz.com/
  App Name : Ultimate Salon Full App Flutter V2
  This App Template Source code is licensed as per the
  terms found in the Website https://initappz.com/license
  Copyright and Good Faith Purchasers © 2023-present initappz.
*/
import 'package:ultimate_salon_owner_flutter/app/backend/api/api.dart';
import 'package:ultimate_salon_owner_flutter/app/helper/shared_pref.dart';
import 'package:get/get.dart';
import 'package:ultimate_salon_owner_flutter/app/util/constance.dart';

class PackagesParser {
  final SharedPreferencesManager sharedPreferencesManager;
  final ApiService apiService;

  PackagesParser(
      {required this.sharedPreferencesManager, required this.apiService});

  Future<Response> getPackagesById(var body) async {
    var response = await apiService.postPrivate(
        AppConstants.getPackagesBySalonId,
        body,
        sharedPreferencesManager.getString('token') ?? '');
    return response;
  }

  Future<Response> packagesDestroy(var body) async {
    var response = await apiService.postPrivate(AppConstants.packagesDestroy,
        body, sharedPreferencesManager.getString('token') ?? '');
    return response;
  }

  bool getType() {
    return sharedPreferencesManager.getString('type') == 'salon' ? true : false;
  }

  String getUid() {
    return sharedPreferencesManager.getString('uid') ?? '';
  }

  Future<Response> onUpdatePackages(var body) async {
    var response = await apiService.postPrivate(AppConstants.packagesUpdate,
        body, sharedPreferencesManager.getString('token') ?? '');
    return response;
  }
}

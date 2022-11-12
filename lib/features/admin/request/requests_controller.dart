import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:trashfree/common/widgets/custom_snackbar.dart';
import 'package:trashfree/constants/api_constants.dart';

import '../../../models/request_model.dart';

class RequestController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getRequests();
  }

  RxList<RequestModel> requests = <RequestModel>[].obs;

  void getRequests() async {
    final response = await http.get(Uri.parse(Api.getRequest));
    var jsonResponse = json.decode(response.body);
    try {
      if (response.statusCode == 200) {
        requests.value = jsonResponse.map<RequestModel>((json) {
          return RequestModel.fromJson(json);
        }).toList();
      } else if (response.statusCode == 404) {
        return;
      } else {
        CustomSnackBars.showErrorSnackBar(
            'Failed to retrieve Requestss', 'Please try again later!');
      }
    } catch (e) {
      debugPrint(e.toString());
      CustomSnackBars.showErrorSnackBar(
          'Failed to retrieve Requestss', 'Please try again later!');
    }
  }
}

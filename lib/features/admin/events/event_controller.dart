import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:trashfree/common/widgets/custom_snackbar.dart';
import 'package:trashfree/constants/api_constants.dart';

import '../../../models/event_model.dart';

class EventController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getEvents();
  }

  final TextEditingController titleController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  Rx<DateTime?> selectedDate = DateTime.now().obs;
  Rx<TimeOfDay?> selectedTime = TimeOfDay.now().obs;

  RxList<EventModel> events = <EventModel>[].obs;

  void getEvents() async {
    final response = await http.get(Uri.parse(Api.getEvents));
    var jsonResponse = json.decode(response.body);
    try {
      if (response.statusCode == 200) {
        events.value = jsonResponse.map<EventModel>((json) {
          return EventModel.fromJson(json);
        }).toList();
      } else if (response.statusCode == 404) {
        return;
      } else {
        CustomSnackBars.showErrorSnackBar(
            'Failed to retrieve events', 'Please try again later!');
      }
    } catch (e) {
      debugPrint(e.toString());
      CustomSnackBars.showErrorSnackBar(
          'Failed to retrieve events', 'Please try again later!');
    }
  }

  selectDate(BuildContext context) async {
    selectedDate.value = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 30)),
    );
  }

  selectTime(BuildContext context) async {
    selectedTime.value =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
  }

  void createEvent() async {
    final response = await http.post(
      Uri.parse(Api.createEvent),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, dynamic>{
        'title': titleController.text,
        'location': locationController.text,
        'date': selectedDate.value.toString(),
        'time': selectedTime.value.toString(),
      }),
    );
    try {
      if (response.statusCode == 200) {
        CustomSnackBars.showSuccessSnackBar(
            Get.context!, 'Event created successfully');
        clearControllers();
        getEvents();
        Get.back();
      } else {
        CustomSnackBars.showErrorSnackBar(
            'Failed to create event', 'Please try again later!');
      }
    } catch (e) {
      CustomSnackBars.showErrorSnackBar(
          'Failed to create event', 'Please try again later!');
    }
  }

  void deleteEvent(String id) async {
    final response = await http.delete(
      Uri.parse(Api.deleteEvent),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, dynamic>{'eventID': id}),
    );
    var jsonResponse = json.decode(response.body);
    try {
      if (response.statusCode == 200) {
        getEvents();
        CustomSnackBars.showSuccessSnackBar(
            Get.context!, 'Event deleted successfully');
      } else {
        CustomSnackBars.showErrorSnackBar(
            'Failed to delete event', jsonResponse['message']);
      }
    } catch (e) {
      debugPrint(e.toString());
      CustomSnackBars.showErrorSnackBar(
          'Failed to delete event', 'Please try again later!');
    }
  }

  void clearControllers() {
    titleController.clear();
    locationController.clear();
  }

  @override
  void onClose() {
    titleController.dispose();
    locationController.dispose();
    super.onClose();
  }
}

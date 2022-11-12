import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:trashfree/common/widgets/text_subtitle.dart';
import 'package:trashfree/common/widgets/text_title.dart';
import 'package:trashfree/constants/dimensions.dart';

import 'requests_controller.dart';

class Requests extends StatelessWidget {
  const Requests({super.key});

  @override
  Widget build(BuildContext context) {
    final RequestController controller = Get.put(RequestController());
    return Scaffold(
      appBar: AppBar(
        title: const TextTitle(
          text: 'Requests',
          fontSize: 22,
        ),
        elevation: 0,
      ),
      body: Obx(() => controller.requests.isEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset('assets/lottie/no_items_found.json'),
                SizedBox(height: deviceHeight * 0.03),
                const TextSubtitle(
                  text: 'No requests yet',
                  fontSize: 18,
                ),
              ],
            )
          : Padding(
              padding: const EdgeInsets.all(16),
              child: ListView.builder(
                itemCount: controller.requests.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      ListTile(
                        isThreeLine: true,
                        title: Column(
                          children: [
                            ListView.builder(
                              shrinkWrap: true,
                              itemCount:
                                  controller.requests[index].wasteType.length,
                              itemBuilder: (context, i) => TextSubtitle(
                                text: controller.requests[index].wasteType[i],
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        subtitle: TextSubtitle(
                          text:
                              'Date: ${DateFormat('dd MMM, yyyy').format(DateTime.parse(controller.requests[index].date))}',
                          fontSize: 14,
                        ),
                        trailing: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              TextSubtitle(
                                text: controller.requests[index].pickupTime
                                    .split('(')[1]
                                    .replaceAll(')', ''),
                                fontSize: 14,
                              ),
                              TextSubtitle(
                                text: controller.requests[index].location,
                                fontSize: 14,
                              ),
                            ]),
                      ),
                      SizedBox(height: deviceHeight * 0.03),
                    ],
                  );
                },
              ),
            )),
    );
  }
}

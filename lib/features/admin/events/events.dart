import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:trashfree/common/widgets/text_subtitle.dart';
import 'package:trashfree/common/widgets/text_title.dart';
import 'package:trashfree/constants/dimensions.dart';
import 'package:trashfree/features/admin/events/event_controller.dart';

import 'widgets/add_events.dart';

class Events extends StatelessWidget {
  const Events({super.key});

  @override
  Widget build(BuildContext context) {
    final EventController controller = Get.put(EventController());
    return Scaffold(
      appBar: AppBar(
        title: const TextTitle(
          text: 'Events',
          fontSize: 22,
        ),
        elevation: 0,
      ),
      body: Obx(() => controller.events.isEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset('assets/lottie/no_items_found.json'),
                SizedBox(height: deviceHeight * 0.03),
                const TextSubtitle(
                  text: 'No events yet',
                  fontSize: 18,
                ),
              ],
            )
          : Padding(
              padding: const EdgeInsets.all(16),
              child: ListView.builder(
                itemCount: controller.events.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: ListTile(
                      isThreeLine: true,
                      title: TextSubtitle(
                        text: controller.events[index].title,
                        fontSize: 18,
                      ),
                      subtitle: TextSubtitle(
                        text: controller.events[index].location,
                        fontSize: 14,
                      ),
                      trailing: TextSubtitle(
                        text: controller.events[index].date.split(' ')[0],
                        fontSize: 14,
                      ),
                    ),
                  );
                },
              ),
            )),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          onPressed: () => showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (_) => const AddEvent(),
          ),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

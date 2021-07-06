import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slot_machine/application/slot_controller.dart';

class SlotScreen extends GetView<SlotController> {
  SlotController controller = Get.put(SlotController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('slots'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GetBuilder<SlotController>(
              builder: (SlotController controller) {
                return Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    children: [
                      Visibility(
                        child: Text("your broke please add more doge! "),
                        visible: controller.score == 0,
                      ),
                      Visibility(
                        child: Text(controller.winningResult?.winningDesc ??
                            'try again'),
                        visible: true,
                      ),
                    ],
                  ),
                );
              },
              //  why did obx not work here ?
            ),
            SizedBox(height: 50),
            Text(
              'score',
            ),
            Obx(
              () => Text(
                '${controller.score}',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            GetBuilder<SlotController>(
              builder: (SlotController controller) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Slot(
                              number: controller.slots[0],
                            ),
                            Slot(
                              number: controller.slots[1],
                            ),
                            Slot(
                              number: controller.slots[2],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Slot(
                              number: controller.slots[3],
                            ),
                            Slot(
                              number: controller.slots[4],
                            ),
                            Slot(
                              number: controller.slots[5],
                            )
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Slot(
                              number: controller.slots[6],
                            ),
                            Slot(
                              number: controller.slots[7],
                            ),
                            Slot(
                              number: controller.slots[8],
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
            FloatingActionButton.extended(
              onPressed: controller.spin,
              tooltip: 'Increment',
              label: Text('Spin'),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: controller.incrementCounter,
        tooltip: 'Increment',
        label: Text('Add DogeCoin'),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class Slot extends StatelessWidget {
  int number;
  Slot({
    this.number,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Text(
        '$number',
        style: Theme.of(context).textTheme.headline4,
      ),
    );
  }
}

// map the thing
// and also make points a bit more complicated

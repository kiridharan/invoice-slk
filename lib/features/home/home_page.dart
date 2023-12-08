import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invoice/constants/appbar.dart';
import 'package:invoice/features/home/controller/home_controller.dart';
import 'package:invoice/features/home/ui/list_tile.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (_) {
        return Scaffold(
          appBar: AppBarInvoice(
            title: "Home",
            onPressed: () {
              controller.deleteDB();
            },
          ),
          body: SizedBox(
            width: Get.width,
            height: Get.height,
            child: Row(
              children: [
                Container(
                  width: 400,
                  height: Get.height,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 10.0,
                      ),
                    ],
                  ),
                  // color: Colors.red,
                  child: ListView.builder(
                    itemCount: controller.invoiceList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onLongPress: () {
                          Get.defaultDialog(
                            title: "Delete",
                            middleText: "Are you sure you want to delete?",
                            textConfirm: "Yes",
                            textCancel: "No",
                            confirmTextColor: Colors.white,
                            buttonColor: Colors.red,
                            onConfirm: () {
                              controller
                                  .delete(controller.invoiceList[index].id!);
                              Get.back();
                            },
                            onCancel: () {
                              Get.back();
                            },
                          );
                        },
                        child: RecipeItemMallika1(
                          data: controller.invoiceList[index],
                        ),
                      );
                    },
                  ),
                ),

                // const Text("Home"),
              ],
            ),
          ),
          floatingActionButton: ElevatedButton.icon(
            onPressed: () {
              controller.increment();
            },
            icon: const Icon(Icons.add),
            label: const Text("Add"),
          ),
        );
      },
    );
  }
}

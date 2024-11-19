import 'package:bookshop/conrtrollers/mainscreencontroller.dart';
import 'package:bookshop/widgets/CustomTextfields.dart';
import 'package:bookshop/widgets/ProductCard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MainScreenController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                child: Text("User"),
                decoration: const BoxDecoration(
                  color: Colors.blue,
                )),
            ListTile(
              onTap: () {},
              title: Text("Log out"),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const Text("Hello, Dear",
                    style: TextStyle(
                        fontFamily: "inter",
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff498B6D))),
                const SizedBox(height: 20),
                CustomTextfield(
                    controller: TextEditingController(), Text: "Search Book"),
                const SizedBox(height: 50),
                Obx(() {
                  if (controller.categories.isEmpty) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.categories.length,
                      itemBuilder: (context, index) {
                        final category = controller.categories[index];
                        final products = category['books'];
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${category['categoryName']}",
                              style: const TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              height: 250,
                              child: ListView.separated(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: products.length,
                                itemBuilder: (context, index) {
                                  final product = products[index];
                                  return ProductCard(
                                      productName: "${product['name']}",
                                      price: "${product['price']}",
                                      description: "${product['desc']}");
                                },
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return const SizedBox(
                                    width: 20,
                                  );
                                },
                              ),
                            )
                          ],
                        );
                      });
                })
              ]),
        ),
      ),
    );
  }
}
// 
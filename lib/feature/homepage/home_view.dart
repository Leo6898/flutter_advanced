import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_flutter06012024/feature/homepage/home_argument.dart';
import 'package:test_flutter06012024/feature/homepage/home_controller.dart';
import 'package:test_flutter06012024/feature/model/get_topmanga_reponse.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scrollController = ScrollController();
  final controller = Get.find<HomeController>();
  @override
  void initState() {
    super.initState();
    controller.getTopMangaResponse();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        controller.getTopMangaResponse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final argument = Get.arguments as HomeArguments;

    return Stack(
      children: [
        Scaffold(
          body: Center(
            child: Obx(
              () => RefreshIndicator(
                onRefresh: () async {
                  controller.getTopMangaResponse();
                },
                child: SingleChildScrollView(
                  controller: _scrollController,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (controller.getTopMangaStatus.value ==
                              GetTopMangaStatus.loaded ||
                          controller.getTopMangaStatus.value ==
                              GetTopMangaStatus.loadmore)
                        ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: controller.listMangaItem.length,
                            itemBuilder: (context, index) {
                              final item = controller.listMangaItem[index];
                              return Column(
                                children: [
                                  Image.network(item?.coverUrl ?? ""),
                                  Text(item?.name ?? ""),
                                  Text("View count: ${item?.viewsCount ?? ""}"),
                                ],
                              );
                            }),
                      if (controller.getTopMangaStatus.value ==
                          GetTopMangaStatus.loadmore)
                        const Center(
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      if (controller.getTopMangaStatus.value ==
                          GetTopMangaStatus.failed)
                        const Center(
                          child: Text("Đã có lỗi xảy ra. Vui lòng thử lại"),
                        )
                    ],
                  ),
                ),
              ),
            ),
            // const Text('Home'),
            // Text('Xin Chao ${argument.username}'),
          ),
        ),
        Obx(
          () => controller.isLoading.value
              ? Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.black.withOpacity(0.6),
                  child: const Center(
                    child: SizedBox(
                      width: 100,
                      height: 100,
                      child: CircularProgressIndicator(),
                    ),
                  ),
                )
              : const SizedBox.shrink(),
        )
      ],
    );
  }
}

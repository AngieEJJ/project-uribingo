import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:leute/styles/app_text_style.dart';
import 'package:leute/view/widget/custom_widgets/super_container.dart';
import 'package:leute/view_model/my_fridge_view_model.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';

class MyFridge extends StatelessWidget {
  const MyFridge({super.key});

  // @override
  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MyFridgeViewModel>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Center(
          child: Text(
            '나의냉장고',
            style: AppTextStyle.header22(color: Colors.white),
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              color: const Color(0xFF9bc6bf),
              borderRadius: BorderRadius.circular(10)),
        ),
      ),
      body: viewModel.isLoading
          ? Center(
              child: LoadingAnimationWidget.inkDrop(
                color: const Color(0xFF9bc6bf),
                size: 50,
              ),
            )
          : viewModel.myFoodDetails.isEmpty
              ? const Center(
                  child: Text('보관중인 음식이 없습니다.'),
                )
              : Padding(
                  padding: const EdgeInsets.all(8),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        for (var refrigeDetail in viewModel.refrigeDetails)
                          Column(
                            children: [
                              Stack(
                                children: [
                                  if (viewModel.myFoodDetails
                                      .where((e) =>
                                          e.refrigeName ==
                                          refrigeDetail.refrigeName)
                                      .isNotEmpty)
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 40, left: 16, right: 16),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Color(0xFFbbd7da)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: GridView.builder(
                                            shrinkWrap: true,
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            gridDelegate:
                                                const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 3,
                                              mainAxisSpacing: 10,
                                              crossAxisSpacing: 10,
                                              childAspectRatio: 1 / 1,
                                            ),
                                            itemCount: viewModel.myFoodDetails
                                                .where((e) =>
                                                    e.refrigeName ==
                                                    refrigeDetail.refrigeName)
                                                .length,
                                            itemBuilder: (context, index) {
                                              return GestureDetector(
                                                onTap: () {
                                                  context.go('/myfooddetail',
                                                      extra: [
                                                        viewModel.myFoodDetails
                                                            .where((e) =>
                                                                e.refrigeName ==
                                                                refrigeDetail
                                                                    .refrigeName)
                                                            .toList()[index],
                                                        refrigeDetail
                                                      ]);
                                                },
                                                child: SuperContainer(
                                                  height: 90.h,
                                                  width: 100.w,
                                                  border: 80,
                                                  borderWidth: 5,
                                                  borderColor:
                                                      const Color(0xFF9bc6bf),
                                                  image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: NetworkImage(
                                                      viewModel.myFoodDetails
                                                          .where((e) =>
                                                              e.refrigeName ==
                                                              refrigeDetail
                                                                  .refrigeName)
                                                          .toList()[index]
                                                          .foodImage,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  if (viewModel.myFoodDetails
                                      .where((e) =>
                                          e.refrigeName ==
                                          refrigeDetail.refrigeName)
                                      .isNotEmpty)
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              border: Border.all(
                                                  color: Color(0xFF9bc6bf),
                                                  width: 3),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                ' ${refrigeDetail.refrigeName}',
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                ],
                              ),
                              if (viewModel.myFoodDetails
                                  .where((e) =>
                                      e.refrigeName ==
                                      refrigeDetail.refrigeName)
                                  .isNotEmpty)
                                SizedBox(
                                  height: 30,
                                )
                            ],
                          ),
                      ],
                    ),
                  ),
                ),
    );
  }
}

 
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeletons/skeletons.dart';
import 'package:user/app/controller/pages_controller.dart';
import 'package:user/app/util/theme.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class AppPageScreen extends StatefulWidget {
  const AppPageScreen({Key? key}) : super(key: key);

  @override
  State<AppPageScreen> createState() => _AppPageScreenState();
}

class _AppPageScreenState extends State<AppPageScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppPagesController>(
      builder: (value) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: ThemeProvider.appColor,
            elevation: 0,
            centerTitle: false,
            automaticallyImplyLeading: false,
            title: Text(value.pageName.toString(), style: ThemeProvider.titleStyle),
            leading: IconButton(icon: const Icon(Icons.arrow_back, color: ThemeProvider.whiteColor), onPressed: () => Get.back()),
          ),
          body: value.apiCalled == true ? SingleChildScrollView(child: Padding(padding: const EdgeInsets.all(10), child: Wrap(children: [HtmlWidget(value.content.toString())]))) : buildDummy(),
        );
      },
    );
  }

  Widget buildDummy() {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 5,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: const BoxDecoration(color: ThemeProvider.whiteColor),
          child: SkeletonItem(
            child: Column(
              children: [
                Row(
                  children: [
                    const SkeletonAvatar(style: SkeletonAvatarStyle(shape: BoxShape.circle, width: 50, height: 50)),
                    const SizedBox(width: 8),
                    Expanded(
                      child: SkeletonParagraph(
                        style: SkeletonParagraphStyle(
                          lines: 3,
                          spacing: 6,
                          lineStyle: SkeletonLineStyle(
                            randomLength: true,
                            height: 10,
                            borderRadius: BorderRadius.circular(8),
                            minLength: MediaQuery.of(context).size.width / 6,
                            maxLength: MediaQuery.of(context).size.width / 3,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 12),
                SkeletonParagraph(
                  style: SkeletonParagraphStyle(
                    lines: 3,
                    spacing: 6,
                    lineStyle: SkeletonLineStyle(
                      randomLength: true,
                      height: 10,
                      borderRadius: BorderRadius.circular(8),
                      minLength: MediaQuery.of(context).size.width / 2,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                SkeletonAvatar(style: SkeletonAvatarStyle(width: double.infinity, minHeight: MediaQuery.of(context).size.height / 8, maxHeight: MediaQuery.of(context).size.height / 3)),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Row(
                      children: [
                        SkeletonAvatar(style: SkeletonAvatarStyle(width: 20, height: 20)),
                        SizedBox(width: 8),
                        SkeletonAvatar(style: SkeletonAvatarStyle(width: 20, height: 20)),
                        SizedBox(width: 8),
                        SkeletonAvatar(style: SkeletonAvatarStyle(width: 20, height: 20)),
                      ],
                    ),
                    SkeletonLine(style: SkeletonLineStyle(height: 16, width: 64, borderRadius: BorderRadius.circular(8)))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

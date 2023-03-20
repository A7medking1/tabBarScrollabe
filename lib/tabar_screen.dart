import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tabbar_scrollable/category_model.dart';
import 'package:tabbar_scrollable/tab_controller.dart';

const Color backgroundColor = Color(0xFFF6F9FA);
const Color blueColor = Color(0xFF0D1863);
const Color greenColor = Color(0xFF2BBEBA);

const double categoryHeight = 55.0;
const double productHeight = 110.0;

class MainTabBarScreen extends StatelessWidget {
  const MainTabBarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.white, // this one for android
      statusBarBrightness: Brightness.light, // this one for iOS
      statusBarIconBrightness: Brightness.light,
    ));
    return Theme(
      data: ThemeData.light(),
      child: const TabBarScreenContent(),
    );
  }
}

class TabBarScreenContent extends StatefulWidget {
  const TabBarScreenContent({Key? key}) : super(key: key);

  @override
  State<TabBarScreenContent> createState() => _TabBarScreenContentState();
}

class _TabBarScreenContentState extends State<TabBarScreenContent>
    with SingleTickerProviderStateMixin {
  final controller = Get.put<TabBarController>(TabBarController());

  @override
  void initState() {
    super.initState();
    controller.init(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: GetBuilder<TabBarController>(
        init: Get.find<TabBarController>(),
        assignId: true,
        builder: (logic) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.15,
                color: backgroundColor,
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //  crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      Text(
                        'Home Page',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: backgroundColor,
                        child: ClipOval(
                          child: FlutterLogo(
                            size: 40,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
                child: TabBar(
                  onTap: controller.onCategorySelected,
                  isScrollable: true,
                  indicatorWeight: 0.1,
                  controller: controller.tabController,
                  tabs: controller.tabs
                      .map((e) => TabWidget(
                            categoryTab: e,
                          ))
                      .toList(),
                ),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: controller.itemsModel.length,
                    controller: controller.scrollController,
                    padding:
                        const EdgeInsetsDirectional.symmetric(horizontal: 20.0),
                    itemBuilder: (context, index) {
                      final items = controller.itemsModel[index];
                      if (items.isCategory) {
                        return CategoryItem(category: items.categoryModel!);
                      } else {
                        return ProductItem(product: items.productModel!);
                      }
                    }),
              ),
            ],
          );
        },
      ),
    );
  }
}

class TabWidget extends StatelessWidget {
  final CategoryTab categoryTab;

  const TabWidget({Key? key, required this.categoryTab}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selected = categoryTab.selected;
    return Opacity(
      opacity: selected ? 1 : 0.5,
      child: Card(
        elevation: selected ? 6 : 0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            categoryTab.categoryModel.name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: blueColor,
            ),
          ),
        ),
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final CategoryModel category;

  const CategoryItem({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: categoryHeight,
      alignment: Alignment.centerLeft,
      child: Text(
        category.name,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  final ProductModel product;

  const ProductItem({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: productHeight,
      child: Padding(
        padding: const EdgeInsetsDirectional.symmetric(vertical: 5),
        child: Card(
          elevation: 6,
          shadowColor: Colors.black45,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  height: 120,
                  width: 100,
                  child: Image.asset(
                    product.image,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      product.name,
                      style: const TextStyle(
                        fontSize: 16,
                        color: blueColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      product.desc,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 13,
                      ),
                    ),
                    Text(
                      product.price.toStringAsFixed(2),
                      style: const TextStyle(
                        fontSize: 16,
                        color: greenColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

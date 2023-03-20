import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tabbar_scrollable/category_model.dart';
import 'package:tabbar_scrollable/tabar_screen.dart';

class TabBarController extends GetxController {
  late final TabController tabController;
  List<CategoryTab> tabs = [];

  List<ItemModel> itemsModel = [];

  late final ScrollController scrollController;

  bool listen = true;

  void init(TickerProvider provider) {
    tabController = TabController(vsync: provider, length: items.length);
    scrollController = ScrollController();

    double offsetFrom = 0.0;
    double offsetTo = 0.0;

    for (int i = 0; i < items.length; i++) {
      final category = items[i];

      if (i > 0) {
        offsetFrom += items[i - 1].product.length * productHeight;
      }

      if (i < items.length - 1) {
        offsetTo = offsetFrom + items[i + 1].product.length * productHeight;
      } else {
        offsetTo = double.infinity;
      }

      /*     print('offsetFrom $offsetFrom');
      print('offsetTo $offsetTo');*/

      tabs.add(
        CategoryTab(
          categoryModel: category,
          selected: (i == 0),
          offsetFrom: categoryHeight * i + offsetFrom,
          offsetTo: offsetTo,
        ),
      );

      itemsModel.add(ItemModel(categoryModel: category));

      for (int j = 0; j < category.product.length; j++) {
        itemsModel.add(ItemModel(productModel: category.product[j]));
      }
    }
    scrollController.addListener(onScrollListener);
  }

  void onScrollListener() {
    if (listen) {
      for (int i = 0; i < tabs.length; i++) {
        final tab = tabs[i];

        if (scrollController.offset >= tab.offsetFrom &&
            scrollController.offset <= tab.offsetTo &&
            !tab.selected) {
          onCategorySelected(i, animationRequired: false);
          tabController.animateTo(i);
          break;
        }
      }
    }
  }

  void onCategorySelected(int index, {bool animationRequired = true}) async {
    final selected = tabs[index];

    for (int i = 0; i < tabs.length; i++) {
      final condition =
          selected.categoryModel.name == tabs[i].categoryModel.name;
      tabs[i] = tabs[i].copyWith((condition));
    }

    update();

    print('offsetFrom ${selected.offsetFrom}');
    print('offsetTo ${selected.offsetTo}');

    if (animationRequired) {
      listen = false;
      await scrollController.animateTo(
        selected.offsetFrom,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
      listen = true;
    }
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
    tabController.dispose();
    scrollController.removeListener(onScrollListener);
  }
}

class CategoryTab {
  final CategoryModel categoryModel;

  final bool selected;

  final double offsetFrom;

  final double offsetTo;

  CategoryTab({
    required this.categoryModel,
    required this.selected,
    required this.offsetFrom,
    required this.offsetTo,
  });

  CategoryTab copyWith(bool selected) => CategoryTab(
        categoryModel: categoryModel,
        selected: selected,
        offsetFrom: offsetFrom,
        offsetTo: offsetTo,
      );
}

class ItemModel {
  CategoryModel? categoryModel;

  ProductModel? productModel;

  ItemModel({
    this.categoryModel,
    this.productModel,
  });

  bool get isCategory => categoryModel != null;
}

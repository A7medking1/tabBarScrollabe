import 'package:equatable/equatable.dart';
import 'package:tabbar_scrollable/app_assets.dart';

class CategoryModel extends Equatable {
  final String name;

  final List<ProductModel> product;

  const CategoryModel({
    required this.name,
    required this.product,
  });


  @override
  List<Object> get props => [name, product];
}

class ProductModel extends Equatable {
  final String name;

  final String desc;

  final String image;

  final double price;

  const ProductModel({
    required this.name,
    required this.desc,
    required this.image,
    required this.price,
  });

  @override
  List<Object> get props => [name, desc, image, price];
}

 String desc = 'Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.';


 List<CategoryModel> items = [
  CategoryModel(
    name: 'Iphone',
    product: [
      ProductModel(name: 'iphone 11', desc: desc, image: AppAssets.iph11, price: 132.5),
      ProductModel(name: 'iphone 13', desc: desc, image: AppAssets.iph13, price: 105.5),
      ProductModel(name: 'iphone 13 blue', desc: desc, image: AppAssets.iph132, price: 100.5),
      ProductModel(name: 'iphone 9', desc: desc, image: AppAssets.iph9, price: 200.5),
    ],
  ),
  CategoryModel(
    name: 'headphones',
    product: [
      ProductModel(name: 'head one', desc: desc, image: AppAssets.head1, price: 132.5),
      ProductModel(name: 'head two', desc: desc, image: AppAssets.head2, price: 105.5),
      ProductModel(name: 'head three', desc: desc, image: AppAssets.head3, price: 100.5),
    ],
  ),
  CategoryModel(
    name: 'screen',
    product: [
      ProductModel(name: 'screen one', desc: desc, image: AppAssets.screen1, price: 132.5),
      ProductModel(name: 'screen two', desc: desc, image: AppAssets.screen2, price: 105.5),
      ProductModel(name: 'screen three', desc: desc, image: AppAssets.screen3, price: 100.5),
      ProductModel(name: 'screen four', desc: desc, image: AppAssets.screen4, price: 100.5),
      ProductModel(name: 'screen five', desc: desc, image: AppAssets.screen5, price: 100.5),
    ],
  ),
  CategoryModel(
    name: 'power',
    product: [
      ProductModel(name: 'power one', desc: desc, image: AppAssets.power1, price: 132.5),
      ProductModel(name: 'power two', desc: desc, image: AppAssets.power2, price: 105.5),
      ProductModel(name: 'power three', desc: desc, image: AppAssets.power3, price: 100.5),

    ],
  ),
  CategoryModel(
    name: 'Iphone 2',
    product: [
      ProductModel(name: 'iphone 11', desc: desc, image: AppAssets.iph11, price: 132.5),
      ProductModel(name: 'iphone 13', desc: desc, image: AppAssets.iph13, price: 105.5),
      ProductModel(name: 'iphone 13 blue', desc: desc, image: AppAssets.iph132, price: 100.5),
      ProductModel(name: 'iphone 9', desc: desc, image: AppAssets.iph9, price: 200.5),
    ],
  ),
  CategoryModel(
    name: 'headphones 2',
    product: [
      ProductModel(name: 'head one', desc: desc, image: AppAssets.head1, price: 132.5),
      ProductModel(name: 'head two', desc: desc, image: AppAssets.head2, price: 105.5),
      ProductModel(name: 'head three', desc: desc, image: AppAssets.head3, price: 100.5),
    ],
  ),
  CategoryModel(
    name: 'screen 2',
    product: [
      ProductModel(name: 'screen one', desc: desc, image: AppAssets.screen1, price: 132.5),
      ProductModel(name: 'screen two', desc: desc, image: AppAssets.screen2, price: 105.5),
      ProductModel(name: 'screen three', desc: desc, image: AppAssets.screen3, price: 100.5),
      ProductModel(name: 'screen four', desc: desc, image: AppAssets.screen4, price: 100.5),
      ProductModel(name: 'screen five', desc: desc, image: AppAssets.screen5, price: 100.5),
    ],
  ),
  CategoryModel(
    name: 'power 2',
    product: [
      ProductModel(name: 'power one', desc: desc, image: AppAssets.power1, price: 132.5),
      ProductModel(name: 'power two', desc: desc, image: AppAssets.power2, price: 105.5),
      ProductModel(name: 'power three', desc: desc, image: AppAssets.power3, price: 100.5),

    ],
  ),
];







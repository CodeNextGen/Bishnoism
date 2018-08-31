import 'package:plantly/redux/models/page_view_model.dart';

class Products {
  final List<PageViewModel> products;
  final int totalProducts;
  final int pageNumber;
  final int pageSize;

  Products({this.products, this.totalProducts, this.pageNumber, this.pageSize});

  Products.fromMap(Map<String, dynamic> map)
      : products = new List<PageViewModel>.from(map['products'].map((product) => new PageViewModel.fromMap(product))),
        totalProducts = map['totalProducts'],
        pageNumber = map['pageNumber'],
        pageSize = map['pageSize'];
}
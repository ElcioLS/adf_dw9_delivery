import 'package:adf_dw9_delivery/app/models/product_model.dart';
import 'package:equatable/equatable.dart';
import 'package:match/match.dart';

import '../../dto/order_product_dto.dart';

part 'home_state.g.dart';

@match
enum HomeStateStatus {
  initial,
  loading,
  loaded,
  error,
}

class HomeState extends Equatable {
  final HomeStateStatus status;
  final List<ProductModel> products;
  final String? errorMessage;
  final List<OrderProductDto>
      productsCart; // //shoppingBag preferi utilizar como productsCart 'Carrinho de produtos'

  const HomeState({
    required this.status,
    required this.products,
    required this.productsCart,
    this.errorMessage,
  });

  const HomeState.initial()
      : status = HomeStateStatus.initial,
        products = const [],
        productsCart = const [],
        errorMessage = null;

  @override
  List<Object?> get props => [status, products, errorMessage, productsCart];

  HomeState copyWith({
    HomeStateStatus? status,
    List<ProductModel>? products,
    String? errorMessage,
    List<OrderProductDto>? productsCart,
  }) {
    return HomeState(
      status: status ?? this.status,
      products: products ?? this.products,
      errorMessage: errorMessage ?? this.errorMessage,
      productsCart: productsCart ?? this.productsCart,
    );
  }
}

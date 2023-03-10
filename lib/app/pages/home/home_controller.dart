import 'dart:developer';

import 'package:adf_dw9_delivery/app/dto/order_product_dto.dart';
import 'package:adf_dw9_delivery/app/repositories/products/products_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_state.dart';

class HomeController extends Cubit<HomeState> {
  final ProductsRepository _productsRepository;

  HomeController(
    this._productsRepository,
  ) : super(const HomeState.initial());

  Future<void> loadProducts() async {
    emit(state.copyWith(status: HomeStateStatus.loading));
    try {
      final products = await _productsRepository.findAllProducts();

      emit(state.copyWith(status: HomeStateStatus.loaded, products: products));
    } catch (e, s) {
      log('Erro ao buscar produtos', error: e, stackTrace: s);
      emit(
        state.copyWith(
            status: HomeStateStatus.error,
            errorMessage: 'Erro ao buscar produtos'),
      );
    }
  }

  void addOrUpdateCart(OrderProductDto orderProduct) {
    final productsCart = [...state.productsCart];
    final orderIndex = productsCart
        .indexWhere((orderP) => orderP.product == orderProduct.product);

    if (orderIndex > -1) {
      if (orderProduct.amount == 0) {
        productsCart.removeAt(orderIndex);
      } else {
        productsCart[orderIndex] = orderProduct;
      }
    } else {
      productsCart.add(orderProduct);
    }

    emit(state.copyWith(productsCart: productsCart));
  }

  void updateCart(List<OrderProductDto> updateCart) {
    emit(state.copyWith(productsCart: updateCart));
  }
}

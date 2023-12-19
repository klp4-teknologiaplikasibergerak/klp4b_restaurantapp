import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:klp4b_restaurantapp/api/services.dart';

class OrderProvider extends ChangeNotifier {
  late ApiService apiService;
  List<Order> orders = [];

  OrderProvider() {
    apiService = ApiService();
    init();
  }

  Future<void> init() async {
    orders = await apiService.fetchOrderByTable('qzu7uscmx1jv0hf23x8g');
    notifyListeners();
  }

  Future<void> storeOrder({
    int? orderId,
  }) async {
    try {
      Order order = await apiService.fetchOrder(orderId);
      orders.add(order);
      notifyListeners();
    } catch (e) {
      print('Error: $e');
    }
  }
}

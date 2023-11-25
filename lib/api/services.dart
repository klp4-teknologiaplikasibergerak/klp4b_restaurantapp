import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String apiUrl =
      'http://192.168.1.64:8000/api'; // Replace with your API endpoint

  Future<List<Menu>> fetchMenuData(String? barcode) async {
    final fetchMenuUrl = '$apiUrl/menus/$barcode';
    print(fetchMenuUrl);
    final response = await http.get(Uri.parse(fetchMenuUrl));
    if (response.statusCode == 200) {
      List menu = jsonDecode(response.body);
      return menu.map((menu) => Menu.fromJson(menu)).toList();
    } else {
      // Handle error
      print('Failed to fetch menu data: ${response.statusCode}');
      throw Exception('Failed to fetch menu data');
    }
  }

  Future<List<Order>> fetchAllOrders() async {
    final fetchOrdersUrl = '$apiUrl/orders';
    print(fetchOrdersUrl);
    final response = await http.get(Uri.parse(fetchOrdersUrl));
    if (response.statusCode == 200) {
      List orders = jsonDecode(response.body);
      return orders.map((order) => Order.fromJson(order)).toList();
    } else {
      // Handle error
      print('Failed to fetch order data: ${response.statusCode}');
      throw Exception('Failed to fetch order data');
    }
  }

  Future<Order> fetchOrder(int? id) async {
    final fetchOrderUrl = '$apiUrl/orders/$id';
    print(fetchOrderUrl);
    final response = await http.get(Uri.parse(fetchOrderUrl));
    if (response.statusCode == 200) {
      Order order = jsonDecode(response.body);
      print(order);
      return Order.fromJson(jsonDecode(response.body));
    } else {
      // Handle error
      print('Failed to fetch order data: ${response.statusCode}');
      throw Exception('Failed to fetch order data');
    }
  }

  Future<List<Order>> fetchOrderByTable(String? barcode) async {
    final fetchOrdersByTableUrl = '$apiUrl/orders/table/$barcode';
    print(fetchOrdersByTableUrl);
    final response = await http.get(Uri.parse(fetchOrdersByTableUrl));
    if (response.statusCode == 200) {
      List order = jsonDecode(response.body);
      print(order);
      return order.map((order) => Order.fromJson(order)).toList();
    } else {
      // Handle error
      print('Failed to fetch order data: ${response.statusCode}');
      throw Exception('Failed to fetch order data');
    }
  }

  Future<Order> storeOrder({
    required int menuId,
    required int tableId,
    required String customerName,
    required int qty,
  }) async {
    print([menuId, tableId, customerName, qty]); // For debugging purpose
    http.Response response = await http.post(
      Uri.parse('$apiUrl/orders'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'menu_id': menuId,
        'table_id': tableId,
        'customer_name': customerName,
        'qty': qty,
        'status': 'ordered',
      }),
    );

    if (response.statusCode != 201) {
      // Handle error
      print('Failed to store order: ${response.statusCode}');
      throw Exception('Failed to store order');
    }
    return Order.fromJson(jsonDecode(response.body));
  }
}

class Order {
  final int? id;
  final int? tableId;
  final int? menuId;
  final String? customerName;
  final String? tableName;
  final String? menuName;
  final int qty;
  final String? menuPrice;
  final String? status;
  final String? createdAt;

  Order({
    this.tableId,
    this.menuId,
    this.id,
    this.customerName,
    this.menuName,
    required this.qty,
    this.menuPrice,
    this.tableName,
    this.status,
    this.createdAt,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
        id: json['id'] as int,
        customerName: json['customer_name'],
        tableName: json['table_name'],
        menuName: json['menu_name'],
        qty: json['qty'] as int,
        menuPrice: json['price'],
        status: json['status'],
        createdAt: json['timestamp']);
  }
}

class Menu {
  final int id;
  final String name;
  final String price;

  Menu({required this.id, required this.name, required this.price});

  factory Menu.fromJson(Map<String, dynamic> json) {
    return Menu(
      id: json['id'],
      name: json['name'],
      price: json['price'],
    );
  }
}

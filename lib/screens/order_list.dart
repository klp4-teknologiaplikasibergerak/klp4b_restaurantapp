import 'package:flutter/material.dart';
import 'package:klp4b_restaurantapp/api/services.dart';
import 'package:klp4b_restaurantapp/providers/order_provider.dart';
import 'package:provider/provider.dart';

class OrderList extends StatefulWidget {
  const OrderList({super.key});

  @override
  State<OrderList> createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<OrderProvider>(builder: (context, orderInstance, child) {
      List<Order> orders = orderInstance.orders;
      return Flexible(
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: orders.length,
              itemBuilder: (context, index) {
                Order order = orders[index];
                return ListTile(
                  title: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Row(
                      children: [
                        const Text(
                          'Nama Menu',
                          style: TextStyle(
                            color: Color(0xFF000000),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          order.menuName ?? '',
                          style: const TextStyle(
                            color: Color(0xFF000000),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  subtitle: Row(
                    children: [
                      const Text(
                        'Harga',
                        style: TextStyle(
                          color: Color.fromARGB(255, 68, 75, 85),
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        order.menuPrice ?? '',
                        style: const TextStyle(
                          color: Color(0xFF000000),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                );
              }));
    });
  }
}

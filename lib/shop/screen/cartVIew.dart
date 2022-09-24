import 'package:flutter/material.dart';
import 'package:flutter_account_note/shop/model/cart.dart';
import 'package:provider/provider.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart', style: Theme.of(context).textTheme.displayMedium),
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.yellow,
        child: Column(
          children: const [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: _cartList(),
              ),
            ),
            Divider(
              height: 4,
              color: Colors.black,
            ),
            _cartTotal()
          ],
        ),
      ),
    );
  }
}

class _cartList extends StatelessWidget {
  const _cartList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var itemNamesStyle = Theme.of(context).textTheme.titleLarge;
    // 此處監聽會發現購物車更新
    var cart = context.watch<CartModel>();
// const Icon(Icons.remove_circle_outline)
    return ListView.builder(
      itemCount: cart.items.length,
      itemBuilder: (context, index) => ListTile(
        leading: const Icon(Icons.done),
        trailing: IconButton(
          icon: const Icon(Icons.remove_circle_outline),
          onPressed: () {
            cart.remove(cart.items[index]);
          },
        ),
        title: Text(
          cart.items[index].name,
          style: itemNamesStyle,
        ),
      ),
    );
    ;
  }
}

class _cartTotal extends StatelessWidget {
  const _cartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var hugesStyle = Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 48);

    return SizedBox(
      height: 200,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<CartModel>(
              builder: (context, cart, child) => Text('\$${cart.totalPrice}', style: hugesStyle),
            ),
            const SizedBox(width: 24),
            TextButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Buying not supported yet.')));
              },
              style: TextButton.styleFrom(backgroundColor: Colors.white),
              child: const Text('BUY'),
            ),
          ],
        ),
      ),
    );
  }
}

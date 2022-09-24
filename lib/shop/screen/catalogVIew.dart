import 'package:flutter/material.dart';
import 'package:flutter_account_note/shop/model/cart.dart';
import 'package:flutter_account_note/shop/model/catalog.dart';
import 'package:provider/provider.dart';

class Catalog extends StatelessWidget {
  const Catalog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _appBar(),
          const SliverToBoxAdapter(
            child: SizedBox(height: 12),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => _listItem(index),
              childCount: 4,
            ),
          ),
        ],
      ),
    );
  }
}

class _appBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text(
        'Catalog',
        style: Theme.of(context).textTheme.displayMedium,
      ),
      actions: [
        IconButton(
          onPressed: () => Navigator.pushNamed(context, '/cart'),
          icon: const Icon(Icons.shopping_cart),
        )
      ],
    );
  }
}

class _listItem extends StatelessWidget {
  final int index;

  const _listItem(this.index);
  @override
  Widget build(BuildContext context) {
    var item = context.select<CatalogModel, Item>(
      (catalog) => catalog.getByPosition(index),
    );

    var textTheme = Theme.of(context).textTheme.titleLarge;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: LimitedBox(
        maxHeight: 48,
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                color: item.color,
              ),
            ),
            const SizedBox(width: 24),
            Expanded(
              child: Text(item.name, style: textTheme),
            ),
            const SizedBox(width: 24),
            _addButton(item: item),
          ],
        ),
      ),
    );
  }
}

class _addButton extends StatelessWidget {
  const _addButton({Key? key, required this.item}) : super(key: key);
  final Item item;
  @override
  Widget build(BuildContext context) {
    var isInCart = context.select<CartModel, bool>((cart) => cart.items.contains(item));

    return TextButton(
      onPressed: isInCart
          ? null
          : () {
              var cart = context.read<CartModel>();
              cart.add(item);
            },
      child: isInCart ? const Icon(Icons.check, semanticLabel: 'ADDED') : const Text('ADD'),
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
          if (states.contains(MaterialState.pressed)) {
            return Theme.of(context).primaryColor;
          }
          return null;
        }),
      ),
    );
  }
}

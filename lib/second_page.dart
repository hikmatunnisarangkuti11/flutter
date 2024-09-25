import 'package:flutter/material.dart';

class IceCreamPage extends StatefulWidget {
  const IceCreamPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _IceCreamPageState createState() => _IceCreamPageState();
}

class _IceCreamPageState extends State<IceCreamPage> {
  // Sample list of ice creams with image URLs
  final List<Map<String, String>> iceCreams = [
    {
      'name': 'Vanilla',
      'price': '3.00',
      'image': 'https://media.istockphoto.com/id/1326143969/id/foto/mangkuk-dengan-bola-es-krim-vanila.webp?s=1024x1024&w=is&k=20&c=j5WQOM12n_8BANCR5GbjM7nsIhCyQv_CrMTs3jKZB0E=',
    },
    {
      'name': 'Chocolate',
      'price': '3.50',
      'image': 'https://assets.tmecosys.com/image/upload/t_web600x528/img/recipe/ras/Assets/0C9310E2-D356-4ED3-BBA0-147E7D21C67C/Derivates/E08BD85D-9D20-471A-BE8F-990ED6E2C1C3.jpg',
    },
    {
      'name': 'Strawberry',
      'price': '3.25',
      'image': 'https://www.theendlessmeal.com/wp-content/uploads/2016/07/strawberry-ice-cream-2-330x330.jpg',
    },
    {
      'name': 'Mint Chocolate Chip',
      'price': '3.75',
      'image': 'https://amandascookin.com/wp-content/uploads/2020/07/mint-chocolate-chip-ice-cream-SQ-500x500.jpg',
    },
    {
      'name': 'Cookie Dough',
      'price': '4.00',
      'image': 'https://40aprons.com/wp-content/uploads/2018/06/paleo-cookie-dough-ice-cream-vegan-healthy-3-1.jpg',
    },
  ];

  // List to store selected ice creams
  final List<Map<String, String>> cart = [];

  // Function to calculate the total price
  double getTotalPrice() {
    return cart.fold(0.0, (total, item) {
      return total + double.parse(item['price']!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ice Cream Sales'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text('Total: \$${getTotalPrice().toStringAsFixed(2)} (${cart.length} items)'),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: iceCreams.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.network(
              iceCreams[index]['image']!,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
            title: Text(iceCreams[index]['name']!),
            subtitle: Text('Price: \$${iceCreams[index]['price']}'),
            onTap: () {
              setState(() {
                cart.add(iceCreams[index]);
              });

              // Show a dialog or perform an action on item click
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Added to Cart'),
                  content: Text(
                      'You added ${iceCreams[index]['name']} for \$${iceCreams[index]['price']} to your cart.'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('OK'),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Display cart items or navigate to a checkout page
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Cart'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: cart.map((item) {
                  return ListTile(
                    title: Text(item['name']!),
                    subtitle: Text('Price: \$${item['price']}'),
                  );
                }).toList(),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('OK'),
                ),
              ],
            ),
          );
        },
        child: const Icon(Icons.shopping_cart),
      ),
    );
  }
}

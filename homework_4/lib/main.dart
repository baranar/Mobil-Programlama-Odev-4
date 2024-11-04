import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SimpleProductScreen(),
    );
  }
}

class SimpleProductScreen extends StatefulWidget {
  @override
  _SimpleProductScreenState createState() => _SimpleProductScreenState();
}

class _SimpleProductScreenState extends State<SimpleProductScreen> {
  List<String> productNames = [
    'Urun 1',
    'Urun 2',
    'Urun 3',
    'Urun 4',
    'Urun 5'
  ];
  List<int> productPrices = [1000, 2000, 3000, 4000, 5000];
  int? selectedProductIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Basit Ürün Listesi')),
      body: Column(
        children: [
          // Horizontal ListView
          Container(
            height: 80,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: productNames.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedProductIndex = index;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    color: selectedProductIndex == index
                        ? Colors.red
                        : Colors.blue,
                    child: Center(
                      child: Text(
                        productNames[index],
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          // GridView
          Expanded(
            child: GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: productNames.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedProductIndex = index;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.all(8),
                    color: selectedProductIndex == index
                        ? Colors.yellow
                        : Colors.grey[300],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(productNames[index]),
                        Text('${productPrices[index]} \$'),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

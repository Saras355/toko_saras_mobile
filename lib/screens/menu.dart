import 'package:flutter/material.dart';
import 'package:toko_saras/screens/shoplist_form.dart';
import 'package:toko_saras/widgets/left_drawer.dart';
import 'package:toko_saras/widgets/shop_card.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  final List<ShopItem> items = [
    ShopItem("Lihat Item", Icons.checklist),
    ShopItem("Tambah Item", Icons.add_shopping_cart),
    ShopItem("Logout", Icons.logout),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text('Your Item List at Shop', style: TextStyle(color: Colors.white)),
      ),
      drawer: const LeftDrawer(),
      body: SingleChildScrollView(
        // Widget wrapper yang dapat discroll
        child: Padding(
          padding: const EdgeInsets.all(10.0), // Set padding dari halaman
          child: Column(
            // Widget untuk menampilkan children secara vertikal
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                // Widget Text untuk menampilkan tulisan dengan alignment center dan style yang sesuai
                child: Text(
                  'Selamat Datang di Toko Saras', // Text yang menandakan toko
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Grid layout
              GridView.count(
                // Container pada card kita.
                primary: true,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                shrinkWrap: true,
                children: items.asMap().entries.map((entry) {
                // Iterasi untuk setiap item
                int index = entry.key;
                ShopItem item = entry.value;
                Color color = Colors.white;
                switch (index) {
                  case 0:
                    color = Color.fromARGB(255, 197, 72, 63);
                    break;
                  case 1:
                    color = Color.fromARGB(255, 60, 214, 65);
                    break;
                  case 2:
                    color = Color.fromARGB(255, 82, 147, 201);
                    break;
                }
                return ShopCard(item, color);
                }).toList(),
                ),

            ],
          ),
        ),
      ),
    );
  }
}

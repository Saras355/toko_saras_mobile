import 'package:toko_saras/screens/shoplist_form.dart';
import 'package:flutter/material.dart';
import 'package:toko_saras/screens/itemlist_page.dart';
import 'package:toko_saras/screens/menu.dart'; 
import 'package:toko_saras/widgets/left_drawer.dart'; 

class ShopItem {
  final String name;
  final IconData icon;

  ShopItem(this.name, this.icon);
}

class ShopCard extends StatelessWidget {
  final ShopItem item;
  final Color color;

  const ShopCard(this.item, this.color, {Key? key}) : super(key: key);
  // const ShopCard(this.item, {super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      // color: Colors.indigo,
      child: InkWell(
        // Area ini responsif  terhadap sentuhan -> ontap
        onTap: () {
          // Memunculkan SnackBar ketika diklik
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));

          // Navigate ke route yang sesuai (tergantung jenis tombol)
          if (item.name == "Tambah Item") {
            // TODO: Gunakan Navigator.push untuk melakukan navigasi ke MaterialPageRoute yang mencakup ShopFormPage.
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => ShopFormPage(),
                ));
          }

          if (item.name == "Lihat Item") {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductListPage(productList: productList)
              ));
          }
        },
        
        child: Container(
          // Container untuk menyimpan Icon dan Text
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
# Tugas 7 
## 1. Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter?
        Ada dua jenis sifat widget pada pengembangan aplikasi flutter, yakni stateless dan stateful. Perbedaan utama keduanya adalah kemampuan untuk berubah mereka, tentang bagaimana cara mereka memproses dan merender komponen- komponen widget yang ada di dalam mereka.
        - Stateles widget merupakan widget yang tidak memiliki state (informasi yang dapat dibaca secara sinkron saat widget dibuat dan mungkin berubah selama masa hidup widget). Widget jenis ini biasanya digunakan untuk menggambarkan bagian dari antarmuka pengguna yang tidak bergantung pada apapun selain informasi konfigurasi dan Build Context. Contoh: Text, Icon, Image, Container, Row, dan Column
        - Stateful widget merupakan widget yang memiliki state. Widget ini dapat berubah selama aplikasi berjalan, misalnya karena interaksi pengguna atau perubahan data. Widget jenis ini biasanya digunakan untuk menggambarkan bagian dari antarmuka pengguna yang dapat berubah dinamis. Contoh: AppBar, TextField, ListView, TabBar, Slider. 
## 2. Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing
#### MaterialApp
    Widget utama yang digunakan untuk menginisialisasi aplikasi. Biasanya merupakan parent utama dari widget kita. Biasanya digunakan untuk mengatur tema dan color palette dari applikasi kita.
#### Scaffold
    Scaffold adalah template dasar yang digunakan untuk membuat tampilan seperti applikasi pada umumnya. Scaffold memiliki parameter appbar, dan drawer sebagai navigasi utama pada applikasi kita.
#### AppBar
    Widget yang digunakan untuk membuat AppBar (Panel yang ada di atas applikasi).
#### SingleChildScrollView
    Widget yang memungkinkan childnya dapat discroll. Digunakan untuk membungkus konten utama.
#### Padding
    Digunakan untuk memberikan padding pada childnya.
#### Column
    Widget yang menampilkan elemen-elemen secara vertikal, child dari widget ini adalah list of widget / kumpulan dari widget yang akan disusun secara vertikal.
#### Text
    Widget untuk menampilkan teks. Dapat pula diatur font, warna, dan styling text disini.
#### Center
    Digunakan untuk mengatur childnya pada posisi ke tengah secara horizontal dan vertikal.
#### GridView.count
    Digunakan untuk membuat grid layout dengan jumlah kolom yang diberikan.
#### InkWell
    Digunakan untuk memberikan efek sentuhan. Ini memungkinkan untuk menangani interaksi pengguna. Biasanya diterapkan pada button.
#### Icon
    Digunakan untuk menampilkan ikon.
#### SnackBar
#Ini adalah widget yang digunakan untuk menampilkan pesan singkat di bagian bawah layar.

## 3. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step (bukan hanya sekadar mengikuti tutorial)
### Dimulai dengan pembuatan proyek flutter baru dengan membuat suatu file, masuk ke cmd path dari root file tersebut dan melakukan:
#### flutter create toko_saras. Maka akan secara otomatis terinstal, sebuah direktori baru bernama toko_sarasm, sebuah file lib berisi main.dart, dan sebuah pubspec.yaml.
### Untuk memisahkan fokus dan merapikan penulisan kode, kita melakukan pemisahan antara main.dart ke menu.dart. Kemudian, kita menambah widget-widget pada menu.dart, antara lain:
#### AppBar
    AppBar ini akan menampilkan teks dengan latar belakang berwarna indigo.
##### Body
    Body dari widget Scaffold akan menampilkan halaman yang dapat di scroll. Halaman ini akan berisi tulisan “Selamat datang di menu utama" dan grid layout dengan 3 menu utama. Grid layout akan diimplementasikan dengan menggunakan widget GridView.
    Child pada grid layout akan berupa widget yang kita buat sendiri, yaitu ShopCard. ShopCard akan menampilkan informasi tentang menu utama.
    Widget ShopCard adalah tombol yang menampilkan 3 pilihan menu, yaitu "Lihat Item", "Tambah Item", dan "Logout". Ketika tombol ini ditekan, akan muncul notifikasi "Kamu telah menekan tombol X", di mana X adalah nama tombol yang ditekan.Sehingga, isi dari menu.dart seperti ini:
```
import 'package:flutter/material.dart';
class ShopItem {
  final String name;
  final IconData icon;
  late Color color;


  ShopItem(this.name, this.icon, this.color);
}
class MyHomePage extends StatelessWidget {
    MyHomePage({Key? key}) : super(key: key);
    final List<ShopItem> items = [
    ShopItem("Lihat Item", Icons.checklist,  const Color(0xFFE95555)),
    ShopItem("Tambah Item", Icons.add_shopping_cart, const Color(0xFFE97777)),
    ShopItem("Logout", Icons.logout, const Color(0xFF999999)),
];
    @override
    Widget build(BuildContext context) {
       return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Toko Saras',
        ),
      ),
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
                  'Selamat datang di menu utama', // Text yang menandakan toko
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
                children: items.map((ShopItem item) {
                  // Iterasi untuk setiap item
                  return ShopCard(item);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
    }
}
// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;


//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }}




class ShopCard extends StatelessWidget {
  final ShopItem item;


  const ShopCard(this.item, {super.key}); // Constructor


  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.color,
      child: InkWell(
        // Area responsive terhadap sentuhan
        onTap: () {
          // Memunculkan SnackBar ketika diklik
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));
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
'
```

## Pengerjaaan Bonus:
##### Dengan cara menambahkan parameter pada class ShopItem, kemudian untuk tiap anak dari ShopItem kita langsung menambahkan nilai dari parameter tersebut dengan nilai suatu heksadesimal representasi warna. Pada widget BuildContext, color menjadi color :color.item. 





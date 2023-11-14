## Nama: Sri Saraswati Widhisari
## Kelas: PBP E
## NPM : 2206812180

# Tugas 8
## 1. Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement(), disertai dengan contoh mengenai penggunaan kedua metode tersebut yang tepat!
-  Navigator.push() akan memasukkan halaman baru ke atas stack navigasi. Halama yang dimasukan akan menjadi halaman teraatas dalam stack navigasi, dan jika kemabli dari halaman tersebut, maka halaman sebelum halaman baru yang ditambahkan yang akan ditampilkan. 
- Navigator.pushReplacement() akan memasukkan halaman baru ke atas stack navigas sekaligus menghapus halaman sebelumnya yang merupakan halaman teratas dari stack, sehingga ketika kembali, maka halaman sebelumnya yang berada di atas stack sebelum halaman baru ditambah tidak akan ditampilkan. 

## 2. Jelaskan masing-masing layout widget pada Flutter dan konteks penggunaannya masing-masing!
- ListView
Merupakan widget yang digunakan untuk membuat daftar tampilan yang dapat bergulir (bisa discroll). Kemampuan scrollabel ini berguna ketika daftar item yang ingin ditampilkan lebih panjang daripada panjang layar perangkat. ListView sesuai utnk menampilkan daftar item seperti daftar produk, kumpulan berita, daftar event, dan lain-lain.
- Stack
Merupakan widget yang digunakna untuk melaksanakan penumpukan widget satu di atas widget lainnya. Stack sesuai digunakan ketika kita mau menerapkan tata letak yang lebik kompleks atau layering.
- Expanded dan Flexible
- Container
Merupakan widget utnuk mengubah properti seperti padidng, ukuran, marhin, dan warna untuk latar. Di dalam container, bisa berisi widget-widget lainnya dan kita bisa mengatur tata letak widget lainnya. Container sesuai digunkana untuk mengatur properti dasar dan menata widget tersebut dengan properti yang sudah ditentukan.
- Column dan Row
Merupakan widget untuk mengatur tata letak widget di dalamnya (seperti tombol, teks, atau gambar) baik secara vertikal (Column), maupun secara horizontal (Row). Column dan Row sangat sesusai digunakan ketika kita mau menyusun widget dalam satu baris atau kolom dalam membuat tata letak linear. 
Layout widget ini digunakan dalam Row atau Column, fungsinya untuk memberikan sautu widget ukuran dinamis, karena membantu mengatur proporsi yang sesuai dari sautu widget dan ruang yang tersedia. Widget ini sesuai ketika kita ingin menampilkan tampilan dinamis seperti pemberian proporsi ruang yang lebih luas untuk widget tertentu. 
- SizedBox
Merupakan widget yang dipakai untuk mengatur ukuran yang tepat terhadap suatu widget. Widget ini juga dapt memberikan white space di antara widget. Widget ini berguna ketika kita mau menentukan dimensi yang tepat dari suatu widget atau ketika kita mau memberikan white space di antara widget.

## 3. Sebutkan apa saja elemen input pada form yang kamu pakai pada tugas kali ini dan jelaskan mengapa kamu menggunakan elemen input tersebut!
Pada tugas ini saya emnggunakan elemen input:
- TextFormField
Elemen ini digunakan untuk memasukkan teks seperti nama item, harga item, jumlah item, dan harga item. Eleemn ini juga digunakan untuk melakukan validasi dan mendapatkan nilai dari pengguna. 
- ElevatedButton 
Elemen ini merupakan tombol, dalam tugas ini, tombo tersebut berguna untuk mengirimkan atau mengirimkan formulir. 
- AlertDialog
Elemen ini digunakan untuk menampilkan dialog dengan isi informasi detail produk setelah tombol Save ditekan (formulir tersimpan).

## 4. Bagaimana penerapan clean architecture pada aplikasi Flutter?
Clean architecture merupakan konsep arsitektur perangkat lunak yang bertujuan untuk memisahkan tanggung jawab antara komponen-komponen dalam suatu aplikasi. Dalam Flutter, konsep ini diterapkan dengan pembuatan aplikasi yang terdiri dari 3 layer, antara lain:
- Presentation 
Layer ini berguna untuk memisahkan antara logika interaski antara pengguna dan tampilan (UI) dengan logika aplikasi. Pada layer ini, kita akan menggunakan widget-widget Flutter seperti StatelessWidget atau StatefulWidget. 
- Domain  (Core)
Layer ini berguna untuk mengatur bisnis logic dari aplikasi. Layer ini mendefinisikan entitas (domain models), use case (berisi aksi atau tugas yang dapat dilakukan oleh aplikasi) dan repository(berisis implementasi repository interface).
- Data /Infrastructure
Layer ini berguna untuk pengimplementasian infrastrukutr seperti database, API, atau penyimpanan lokal. Layer ini dapat ebrkomunikasi dengan doamin layer melalui repository interface.

## 5. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial)
### Penambahan Drawer
- Penambahan drawer dilakukan dengan menambahkan berkas left_drawer.dart pada direktori widgets. Di dalam file tersebut, kita menggunakan ListView yang terdiri dari children yang berisikan format style dan child berupa Column, yang terdiri dari children lagi yagn berisikan widget ListTile. Di tugas ini, terdapat 3 ListTile, yakni halaman utama, tambah item, dan lihat item, yang disusun secara kolom (vertikal). Ketiga widget ListTile itu memiliki onTap() yang meroute ke halaman masing-masing. Penggunaan Navigator.pushReplacement juga digunakan untuk penambahan halaman stack dengan jenis menghapus halaman sebelumnya. 
- File ini kemduian diimpor pada halaman yang digunakan seperti MyHomePage dan ShopFormPage dan ditaruh di widget Scaffold
### Pembuatan model, Pembuatan Form Item, dan Penampilan Data List Item
- Pembuatan shoplist_form.dart pada direktori lib. Disni kita menambahkan widget Scaffold dengan AppBar dan juga left drawer yang sudah kita buat sebelumnya. 
- Kita juga membuat models di direktori models di lib. Pada models ini, kita membuat class Objek untuk produk dengan atribut, seperti nama, harga, jumlah, dan deskripsi. 
- Setelah itu, tambahkan widget form untuk wadah input user dan SingleChildScrollView untuk membuat form ini dapat digulir. 
- Pada bidang input, kita menggunakan elemen TextFormField. Kita juga memberikan padding dan column untuk memberikan tata letak yang rapi untuk elemen input. 
- Validasi input dilakukan dengan memberikan jenis validasi berupa :
  - Jika nama maka harus bertipe data string, tidak boleh kosong, dan tidak boleh mengantung angka dari 0 -9 
  - Deskripsi tidak boleh kosong
  - Baik jumlah item dan harga item harus bertipe data integer
- Ketika user sudah mengklik tombol Simpan dengan semua input sudah benar sesuai format yang ditetapkan, maka akan muncul AlertDialog yang berisikan data yang dimasukkan oleh user. Tampilan ini menggunakan showDialog. Setealh selesai dialog, formulir akan direset secara otomatis. 
### Melakukan Refactoring File melalui Pemindahan 
- Membuat direktori baru dengan anama screens, yang berisi shoplist_form.dart dan shop_card.dart. Pada shop_card.dart berisi ShopItem Class dan ShopCard Class. Kelas ShopItem merepresentasikan item yang ada di Toko Saras dengan tiap objek ShopItem memilki dua atribut yakni name dan icon. Kelas ShopCard memnafaatkan InkWell untuk memberikan respons ketika kartu ditekan, sedangkan material memberikan efek visual seperti warna latar belakang.
### note: ada pengerjaan bonus dengan membaut lihat produk page sesuai dengan atribut yang sudah ditaruh pada models item. 
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





## Nama: Sri Saraswati Widhisari
## Kelas: PBP E
## NPM : 2206812180
# Tugas 9

## 1.  Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?
Bisa, kita bisa melakuan pengambilan data JSON tanpa membuat model terlebih dahulu menggunakan fungsi decode() dari Dart. Fungsi dari fungsi ini adalah untku mendekode data JSON dan merubahnya menajdi sebuah objek DART. 
contoh penggunaan:
Map<String, dynamic> data = jsonDecode(dataJSON);
setelah berubah menjadi objek DART maka dapat dipanggil menjadi 
data["id"] //jika terdapat atribut id

Pemakaian ini dapat menjadi lebih baik atau lebik buruk, itu tergantung pada struktur data JSON yang kita gunakan. Jika data JSON memilki struktur sederhana, maka pengambilannya tanpa membuat model lebih baik, tetapi jika strukturnya kompleks, maka pembuatan model sebelum pengambilan data JSON lebih disarankan. Kedua, juga bedasarkan tujuan kita, jika tujuan kita untuk menggunakan data untuk melakuakn analisis lebih lanjut seperti meliar tren, prediksi pola, pembangunan model diperlukan.

## 2. Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.

CookieRequest merupakan kelas yang berfungsi untuk mengelola cookie di Flutter. Terdapat metode seperti mengakses, menyimpan dan menghapus cookie pada kelas ini.
CookieRequest perlu dibagikan ke semua komponen di aplikasi Flutter agar semua komponen dapat mengakses cookie secara konsisten, seperti untuk keperluan otentikasi pengguna, pengingat sesi, preferensi pengguna. Misalnya setSesssionCookie() yang digunakan untuk menyimpan cookie sesi dan hanya disimpan selama sesi pengguna aktif.

## 3. Jelaskan mekanisme pengambilan data dari JSON hingga dapat ditampilkan pada Flutter.
Mekanisme pengambilan data dari JSON hingga dapat ditampilkan pada Flutter terbagi menjadi 5 bagian, antara lain:
1. Mengakses data JSON
Akses data JSON bisa berasal dari file lokal atau server. Untuk file lokal, kita menggunakan fungsi readAsString() dari kelas File, dengan output mengembalikan data JSON sebagai string.
Sedangkan, kalau di server, kita menggunakan kelas HttpClient, yang menyediakan berbagai metode seperti melakukan permintaan HTTP (permintaan GET untuk mengambil data JSON).
2. Mendekode data JSON
Setelah berhasil mengakses data JSON, ktia melakuakn dekode data JSON menjadi objek Dart. Fungsi dekode dari kelas json digunakan untuk medekode data JSON menjadi objek DART. 
3. Membuat model (jika dirasa stuktur data JSON kompleks)
Jika data JSON kita memiliki struktur yang kompleks, kita bisa membuat model untuk memperlmudah kases dan pengolahan data. Contoh pembuatan model

class Ite,{
  int id;
  String namel
  String email;
  User({this.id, this.name, this.email});
}
4. Mengakses data JSON
Data JSON yang didekode menjadi DART selanjutnya data tersebut dapat diakses dengan menggunakan sintaks DART yang biasa. 
5. Menampilkan data JSON
Data yang sudah berhasil diakses, dapat ditampilkan pada flutter melalui widget seperti Text, Image, atau ListView.

## 4. Jelaskan mekanisme autentikasi dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.
Pertama kita membuat CookieRequest dan measukkan nya ke vairbale bernaa request
final request = context.watch<CookieRequest>();

Kedua, pengguna memasukkan data akun seperti username dan passowrd pada Flutter. 
final response = await request.login(
  "http://127.0.0.1:8000/auth/login/",
  {
    'username': username,
    'password': password
  }
);
Kemudian data tersebut akan dikirimkan ke Django melalui API menggunaan metode post() dari kelas http. Data akun dikirim dalam bentuk objek JSON. Django akan memproses data akun yang dikirimkan oleh Flutter. Jika akun valid, maka Django akan mengembalikan token autentikasi dan JsonResponse sukses. Token ini untuk mengidentifikasi pengguna yang berhasil melakukan autentikasi. Token ini kemudian disimpan di Flutter menggunakan kelas SharedPreferences. Setelah token autentikasi disimpan, pengguna akan ditampilkan atau dipindahkan ke halaman menu (yang hanya bisa diaskes oleh pengguna yang telah melakukan autentikasi), menggunakan metode push() dari kelas Navigator.
## 5. Sebutkan seluruh widget yang kamu pakai pada tugas ini dan jelaskan fungsinya masing-masing.
### Text 
    Untuk menampilkan teks detail produk ketika daftar produk ditekan.
### ElevatedButton
  Terdapat di bagian registrasi dan login ketika tombol submit ditekan, akan memberikan efek elevasi.
### SizeBox
  Untuk layouting, membuat ruang pemisah atua jarak antara Textfield satu dengan Textfield lainnya
### Listview.builder
  Untuk membuat daftar item sehingga bis scrollable, menampilan daftar item yang ada. 
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
## 6. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).
Untuk melakukan authentication, menambhakn django-cors-headers pada requirements.txt dan dijalankan dengan pip install -r requiremetns.txt. Saya juga menambahkan corsheader.middlewareCorsMiddleware pada setting.py pad apalikasi django dan variabel dibawah ini 
CORS_ALLOW_ALL_ORIGINS = True
CORS_ALLOW_CREDENTIALS = True
CSRF_COOKIE_SECURE = True
SESSION_COOKIE_SECURE = True
CSRF_COOKIE_SAMESITE = 'None'
SESSION_COOKIE_SAMESITE = 'None'

Di file djnago, membuat startapp baru bernama authentication, dengan di urls.py membuat path yang menguhubungkan ke login, logout, dan register. 

Pada file django, saya memasukkan  kode views.py seperti ini

from django.shortcuts import render
from django.contrib.auth import authenticate, login as auth_login
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
from django.contrib.auth import logout as auth_logout
from django.contrib.auth.forms import UserCreationForm

@csrf_exempt
def login(request):
    username = request.POST['username']
    password = request.POST['password']
    user = authenticate(username=username, password=password)
    if user is not None:
        if user.is_active:
            auth_login(request, user)
            # Status login sukses.
            return JsonResponse({
                "username": user.username,
                "status": True,
                "message": "Login sukses!"
                            }, status=200)
        else:
            return JsonResponse({
                "status": False,
                "message": "Login gagal, akun dinonaktifkan."
            }, status=401)

    else:
        return JsonResponse({
            "status": False,
            "message": "Login gagal, periksa kembali email atau kata sandi."
        }, status=401)

@csrf_exempt
def logout(request):
    username = request.user.username

    try:
        auth_logout(request)
        return JsonResponse({
            "username": username,
            "status": True,
            "message": "Logout berhasil!"
        }, status=200)
    except:
        return JsonResponse({
        "status": False,
        "message": "Logout gagal."
        }, status=401)
    
@csrf_exempt
def register(request):
        
    if request.method == "POST":
        form = UserCreationForm(request.POST)
        if form.is_valid():
            form.save()
            return JsonResponse({'message': 'User registered successfully'})
        else:
            return JsonResponse({'errors': form.errors}, status=400)
    return JsonResponse({'message': 'Invalid request'}, status=400)

Import path authentication pada file django urls.
Menambahkan creare_product_flutter method pada main.views.py, dengan kode seperti ini

@csrf_exempt
def create_product_flutter(request):
    if request.method == 'POST':
        data = json.loads(request.body)

        new_product = Item.objects.create(
            user = request.user,
            name = data["name"],
            amount = int(data["amount"]),
            description = data["description"]
        )

        new_product.save()

        return JsonResponse({"status": "success"}, status=200)
    
    else:
        return JsonResponse({"status": "error"}, status=401)


Pada projek flutter, menginstall package berupa provider dan pbp_django_auth

Login.dart pada screen menjadi ini
import 'package:toko_saras/screens/menu.dart';
import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

void main() {
    runApp(const LoginApp());
}

class LoginApp extends StatelessWidget {
const LoginApp({super.key});

@override
Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Login',
        theme: ThemeData(
            primarySwatch: Colors.blue,
    ),
    home: const LoginPage(),
    );
    }
}

class LoginPage extends StatefulWidget {
    const LoginPage({super.key});

    @override
    _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
    final TextEditingController _usernameController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();

    @override
    Widget build(BuildContext context) {
        final request = context.watch<CookieRequest>();
        return Scaffold(
            appBar: AppBar(
                title: const Text('Login'),
            ),
            body: Container(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        TextField(
                            controller: _usernameController,
                            decoration: const InputDecoration(
                                labelText: 'Username',
                            ),
                        ),
                        const SizedBox(height: 12.0),
                        TextField(
                            controller: _passwordController,
                            decoration: const InputDecoration(
                                labelText: 'Password',
                            ),
                            obscureText: true,
                        ),
                        const SizedBox(height: 24.0),
                        ElevatedButton(
                            onPressed: () async {
                                String username = _usernameController.text;
                                String password = _passwordController.text;

                                // Cek kredensial
                                // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
                                // Untuk menyambungkan Android emulator dengan Django pada localhost,
                                // gunakan URL http://10.0.2.2/
                                final response = await request.login("http://127.0.0.1:8000/auth/login/", {
                                'username': username,
                                'password': password,
                                });
                    
                                if (request.loggedIn) {
                                    String message = response['message'];
                                    String uname = response['username'];
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(builder: (context) => MyHomePage()),
                                    );
                                    ScaffoldMessenger.of(context)
                                        ..hideCurrentSnackBar()
                                        ..showSnackBar(
                                            SnackBar(content: Text("$message Selamat datang, $uname.")));
                                    } else {
                                    showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                            title: const Text('Login Gagal'),
                                            content:
                                                Text(response['message']),
                                            actions: [
                                                TextButton(
                                                    child: const Text('OK'),
                                                    onPressed: () {
                                                        Navigator.pop(context);
                                                    },
                                                ),
                                            ],
                                        ),
                                    );
                                }
                            },
                            child: const Text('Login'),
                        ),
                    ],
                ),
            ),
        );
    }
}

untuk menu.dart berisi ini (sudah ditambah Cookierequest dan provider)

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
unutk handle register, berikut kode saya
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:toko_saras/screens/menu.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
              ),
            ),
            const SizedBox(height: 12.0),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () async {
                String username = _usernameController.text;
                String password = _passwordController.text;
                // print("USERNAME $username");
                // print("PASSWORD $password");
                final response = await http
                    .post(Uri.parse("http://127.0.0.1:8000/register_flutter"),
                        headers: {"Content-Type": "application/json"},
                        body: jsonEncode(<String, String>{
                          'username': username,
                          'password': password,
                        }))
                        
                    .then((value) => jsonDecode(value.body));

                if (response["status"] == "success") {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Register Berhasil, silahkan login'),
                      actions: [
                        TextButton(
                          child: const Text('OK'),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Register Gagal, mohon coba lagi'),
                    ),
                  );
                }
              },
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}

list_produk.dart saya berisikan
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:toko_saras/models/product.dart';


import 'package:toko_saras/widgets/left_drawer.dart';

class ProductPage extends StatefulWidget {
    const ProductPage({Key? key}) : super(key: key);

    @override
    _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
Future<List<Product>> fetchProduct() async {
    // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
    var url = Uri.parse(
        'http://localhost:8000/json/');
    var response = await http.get(
        url,
        headers: {"Content-Type": "application/json"},
    );

    // melakukan decode response menjadi bentuk json
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    // melakukan konversi data json menjadi object Product
    List<Product> list_product = [];
    for (var d in data) {
        if (d != null) {
            list_product.add(Product.fromJson(d));
        }
    }
    return list_product;
}

@override
Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text('Product'),
        ),
        drawer: const LeftDrawer(),
        body: FutureBuilder(
            future: fetchProduct(),
            builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                    return const Center(child: CircularProgressIndicator());
                } else {
                    if (!snapshot.hasData) {
                    return const Column(
                        children: [
                        Text(
                            "Tidak ada data produk.",
                            style:
                                TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                        ),
                        SizedBox(height: 8),
                        ],
                    );
                } else {
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (_, index) => Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 12),
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                    Text(
                                    "${snapshot.data![index].fields.name}",
                                    style: const TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                    ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text("${snapshot.data![index].fields.price}"),
                                    const SizedBox(height: 10),
                                    Text(
                                        "${snapshot.data![index].fields.description}")
                                ],
                                ),
                            ));
                    }
                }
            }));
    }
}

Selain itu kita menambahkan kode user premision android internet untuk memperbolehjkan akses internet pada aplkasi flutter yang dibuat

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





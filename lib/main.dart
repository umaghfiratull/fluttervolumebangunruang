import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  TextEditingController panjangController = TextEditingController();
  TextEditingController tinggiController = TextEditingController();
  TextEditingController lebarController = TextEditingController();
  TextEditingController sisiKubusController = TextEditingController();
  TextEditingController luasAlasLimasController = TextEditingController();
  TextEditingController tinggiLimasController = TextEditingController();

  double volumeBalok = 0.0;
  double volumeKubus = 0.0;
  double volumeLimas = 0.0;

  void HitungVolumeBalok() {
    double panjang = double.tryParse(panjangController.text) ?? 0.0;
    double lebar = double.tryParse(lebarController.text) ?? 0.0;
    double tinggi = double.tryParse(tinggiController.text) ?? 0.0;

    double volume = (panjang * lebar * tinggi);

    setState(() {
      volumeBalok = volume;
    });
  }

  void HitungVolumeKubus() {
    double sisi = double.tryParse(sisiKubusController.text) ?? 0.0;

    double volume = sisi * sisi * sisi;

    setState(() {
      volumeKubus = volume;
    });
  }

  void hitungVolumeLimas() {
    double luasAlas = double.tryParse(luasAlasLimasController.text) ?? 0.0;
    double tinggi = double.tryParse(tinggiLimasController.text) ?? 0.0;

    double volume = (luasAlas * tinggi) / 3;

    setState(() {
      volumeLimas = volume;
    });
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[700], // Mengubah warna AppBar menjadi hijau army
        title: Text(widget.title),
      ),
      backgroundColor: Colors.green[200], // Mengubah warna latar belakang menjadi hijau army lebih muda
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Hitung Volume Bangun Ruang',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text('Volume Balok: $volumeBalok'),
            const SizedBox(height: 20),
            TextFormField(
              controller: panjangController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Panjang Balok',
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: lebarController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Lebar Balok',
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: tinggiController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Tinggi Balok',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: HitungVolumeBalok,
              child: const Text("Hitung Volume Balok"),
            ),
            const SizedBox(height: 40),
            Text('Volume Kubus: $volumeKubus'),
            const SizedBox(height: 20),
            TextFormField(
              controller: sisiKubusController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Sisi Kubus',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: HitungVolumeKubus,
              child: const Text("Hitung Volume Kubus"),
            ),
            const SizedBox(height: 40),
            Text('Volume Limas: $volumeLimas'),
            const SizedBox(height: 20),
            TextFormField(
              controller: luasAlasLimasController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Luas Alas Limas',
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: tinggiLimasController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Tinggi Limas',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: hitungVolumeLimas,
              child: const Text("Hitung Volume Limas"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _counter++;
          });
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
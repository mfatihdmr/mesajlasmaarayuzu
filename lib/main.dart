import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Temel Mesajlaşma Uygulaması",
      home: Iskele(),
    );
  }
}

class Iskele extends StatelessWidget {
  const Iskele({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mesajlaşma Uygulaması Arayüzü"),
      ),
      body: AnaEkran(),
    );
  }
}

class AnaEkran extends StatefulWidget {
  @override
  State<AnaEkran> createState() => _AnaEkranState();
}

class _AnaEkranState extends State<AnaEkran> {
  TextEditingController t1 = TextEditingController();

  List mesajListesi = [];

  mesajlariEkle(String metin) {
    setState(() {
      mesajListesi.insert(0, metin);
      t1.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(40),
      child: Column(
        children: [
          Flexible(
              child: ListView.builder(
            reverse: true,
            itemCount: mesajListesi.length,
            itemBuilder: (context, indeksNumarasi) =>
                Text(mesajListesi[indeksNumarasi]),
          )),
          Row(
            children: [
              Flexible(
                child: TextField(
                  onSubmitted: mesajlariEkle,
                  controller: t1,
                ),
              ),
              ElevatedButton(
                onPressed: mesajlariEkle(t1.text),
                child: Text("Gönder"),
              ),
            ],
          )
        ],
      ),
    );
  }
}

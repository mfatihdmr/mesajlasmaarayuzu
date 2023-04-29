import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Mesajlaşma Uygulaması Arayüzü",
      home: Iskele(),
    );
  }
}

class Iskele extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat Uygulaması"),
        backgroundColor: Color.fromARGB(255, 81, 217, 241),
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
  List<MesajBalonu> mesajListesi = [];

  listeyeEkle(String gelenMesaj) {
    setState(() {
      MesajBalonu mesajNesnesi = MesajBalonu(mesaj: gelenMesaj);
      mesajListesi.insert(0, mesajNesnesi);
      t1.clear();
    });
  }

  Widget metinGirisAlani() {
    return Container(
      margin: EdgeInsets.all(15),
      child: Row(
        children: [
          Flexible(
            child: TextField(
              controller: t1,
            ),
          ),
          IconButton(
              onPressed: () {
                listeyeEkle(t1.text);
              },
              icon: Icon(
                Icons.send,
              ))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Flexible(
          child: ListView.builder(
              itemCount: mesajListesi.length,
              itemBuilder: (_, indeksNumarasi) => mesajListesi[indeksNumarasi]),
        ),
        Divider(
          thickness: 1,
        ),
        metinGirisAlani(),
      ]),
    );
  }
}

String isim = "Kullanıcı";

class MesajBalonu extends StatelessWidget {
  String mesaj;

  MesajBalonu({required this.mesaj});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          CircleAvatar(
            child: Text(isim[0]),
          ),
          Column(
            children: [
              Text(isim),
              Text(mesaj),
            ],
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(AppBMI());
}

class AppBMI extends StatefulWidget {
  @override
  _AppBMIState createState() => _AppBMIState();
}

class _AppBMIState extends State<AppBMI> {
  double tinggi, berat, hasil;
  String status;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Kalkulator BMI")),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "Masukan berat anda : ",
              style: TextStyle(fontSize: 20),
            ),
            TextField(
              onChanged: (value) {
                berat = double.parse(value);
              },
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Masukan tinggi anda : ",
              style: TextStyle(fontSize: 20),
            ),
            TextField(onChanged: (value) {
              tinggi = double.parse(value);
            }),
            FlatButton(
              color: Colors.green,
              child: Text(
                "Hitung",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () {
                setState(() {
                  hasil = berat / ((tinggi / 100) * (tinggi / 100));
                  if (hasil < 15) {
                    status = "Anda Sangat Kurus";
                  } else if (hasil >= 15 && hasil < 18.5) {
                    status = "Anda Kurus";
                  } else if (hasil >= 18.5 && hasil < 23) {
                    status = "Anda Normal";
                  } else if (hasil >= 23 && hasil < 27.5) {
                    status = "Anda Gemuk";
                  } else if (hasil >= 27.5 && hasil < 40) {
                    status = "Anda Kegemukan";
                  } else {
                    status = "Anda Sangat Gemuk";
                  }
                });
              },
            ),
            Text(
              "Hasil : ${hasil.floor().toString()}",
              style: TextStyle(fontSize: 20),
            ),
            Text("Status : $status", style: TextStyle(fontSize: 20),)
          ],
        ),
      ),
    );
  }
}

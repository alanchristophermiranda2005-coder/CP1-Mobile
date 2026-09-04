import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final int capacidadeMax = 50;

  int count = 0;
  void decrement() {
    setState(() {
      if (count > 0) {
        count--;
      }
    });
  }

  void increment() {
    setState(() {
      if (count < capacidadeMax) {
        count++;
      }
    });
  }

  bool get isEmpty => count == 0;
  bool get isFull => count == capacidadeMax;
  bool get isAlmostFull => count >= (capacidadeMax * 0.8) && !isFull;

 String get mensagemSituacao {
    if (isFull) return 'A sala está lotada';
    if (isAlmostFull) return 'A Sala está quase cheia';
    return 'Pode entrar!!!';
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("SALA DE AULA",
        style: TextStyle(color: Colors.white,
        fontWeight: FontWeight.w600,
        fontSize: 26,
          ),
        ),
        backgroundColor: Colors.lightGreen,
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(isFull ? "assets/images/sala_lotada.jpg"  : "assets/images/sala_vazia.jpg"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withValues(alpha: 0.5),
              BlendMode.darken,
            )
          ),
        ), 
        child : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text(
              mensagemSituacao,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 12),

           
            Text(
              count.toString(),
              style: TextStyle(fontSize: 100, color: Colors.white),
            ),

            Text(
              'Capacidade máxima: $capacidadeMax pessoas',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: isEmpty ? null : decrement,
                  style: TextButton.styleFrom(
                    backgroundColor: isEmpty ? Colors.white.withAlpha(90) : Colors.white,
                    fixedSize: Size(100, 40),
                  ),
                  child: Text(
                    "Saiu",
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ),
                SizedBox(width: 16),
                TextButton(
                  onPressed: isFull ? null : increment,
                  style: TextButton.styleFrom(
                    backgroundColor: isFull ? Colors.white.withAlpha(90) : Colors.white,
                    fixedSize: Size(100, 40),
                  ),
                  child: Text(
                    "Entrou",
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
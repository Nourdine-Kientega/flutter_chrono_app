import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math' as math;
// import 'dart:ui';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// Home Page
class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness:
            Brightness.light, // 🎯 Icônes blanches sur fond bleu
      ),
      child: Scaffold(
        backgroundColor: const Color.fromARGB(221, 49, 48, 48),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(),
              const CircleWithDecorations(),
              const BottomActions(), // 👈 ajouté proprement ici
            ],
          ),
        ),
      ),
    );
  }
}

// Circles and Text
class CircleWithDecorations extends StatelessWidget {
  const CircleWithDecorations({super.key});

  @override
  Widget build(BuildContext context) {
    // 🔧 Paramètres faciles à modifier
    const int segments = 48; // ➜ 24, 48, 96…
    const double dashWidth = 2; // ➜ épaisseur du trait
    const double dashHeight = 6; // ➜ longueur du trait
    const double dashOffset = 30; // ➜ marge du haut pour les traits

    return SizedBox(
      width: 300, // cercle extérieur
      height: 300,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Cercle central transparent avec bordure blanche
          Container(
            width: 260,
            height: 260,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white24, width: 1),
            ),
            child: const Center(
              child: Text(
                '15:00',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 38,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 2,
                  fontFeatures: [
                    FontFeature.tabularFigures(),
                  ], // pour chiffres bien alignés
                ),
              ),
            ),
          ),

          // Cercle décoratif extérieur avec tirets
          ...List.generate(segments, (index) {
            final angleDeg = index * (360 / segments);
            return Transform.rotate(
              angle: angleDeg * math.pi / 180, // degrés → radians
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  margin: const EdgeInsets.only(top: dashOffset),
                  width: dashWidth,
                  height: dashHeight,
                  decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(dashWidth),
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}

// Bottom action bar
class BottomActions extends StatelessWidget {
  const BottomActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: () {
              // TODO: delete action
            },
            icon: const Icon(Icons.delete, color: Colors.white70, size: 32),
          ),
          IconButton(
            onPressed: () {
              // TODO: play action
            },
            icon: const Icon(Icons.play_arrow, color: Colors.white70, size: 40),
          ),
          IconButton(
            onPressed: () {
              // TODO: add action
            },
            icon: const Icon(Icons.add, color: Colors.white70, size: 32),
          ),
        ],
      ),
    );
  }
}

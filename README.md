#  Initiation Flutter

## Présentation du langage dart:
`cf lib/dart/*`

## Présentation de flutter:

Le fichier pubspec.yaml est le fichier de configuration, on y retrouve:
- le nom de l'application
- sa version
- la liste de ses dépendances


Dans le répertoire lib le fichier main.dart contient l'ensemble de l'application d'exemple

Le projet posséde une dépendance pour apporter les widgets de base pour la création d'une application

```dart 
import 'package:flutter/material.dart';
```

Au lancement, on lance la méthode run en précisant le widget root
```dart
void main() {
  runApp(const MyApp());
}
```
Le premier widget est un composant dit state less, il ne posséde pas de contenu dynamique (qui s'adapte en fonction des actions de l'utilisateur)

Il a son propre constructeur, il n'attend aucune donnée du widget parent.

Il faut surcharger la méthode build pour décrire notre widget
```dart
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   ...
  }
}
```
MaterialApp permet de créer une structure pour les applications avec le visuel android
On y gère le titre , le style général, les routes ou la page d'accueil

```dart
 return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 18, 18, 184)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
```
Le widget de la page est un widget state full. Sa structure est différente de celle du state less;
elle est composée de deux classes. Une principale avec le constructeur. Il récupére une propriété obligatoire du widget parent.

La methode createState fait appel la seconde classe qui sait géré le changement d'état.

```dart
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  @override
  Widget build(BuildContext context) {
   
  }
}
```
Le widget Scaffold, permet de créer un visuel rapidement avec une entete, un corps et un bas d'application

```dart
 return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
    
    );
```

Le changement de état de la propriété `_counter`se déclenche sur onPressed d'un bouton
```dart
floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
```
La méthode appelé va s'appuyer sur la méthode `setState` pour  rafraichir le composant et afficher le nouvel état de la propriété

```dart
int _counter = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
```
Lors du rafraichissement de l'état la variable `$_counter` sera mise à jour 
```dart
        Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
```

## Travaux pratique

### Préparer votre machine pour développer en flutter

[Documentation flutter](https://docs.flutter.dev/get-started/install)

[ ]  installation de flutter
[ ]  installation de android studio pour créer un émulateur et posséder le sdk android
[ ]  _et/ou_ installation xcode si vous travaillez sur mac avec un iphone
[ ]  installation de l'ide, vscode et ses plugins...

### Ma première application Programmation d’une bombe

Initier le starter de base flutter, nous allons le modifier pour créer une bombe.
Nous souhaitons démarrer à 10 notre compte à rebours, chaque clic sur le bouton fera décrémenter le compteur et arrivé à 0 nous changerons le texte pour afficher ‘BOOM’ en rouge et gras.
Pour être plus visuel nous changerons également le fond d’écran en ‘orange’.

Notre application est maintenant terminée nous pouvons retirer le mode debug.

Quelques éléments d’aide :
Le style d’un widget Text se définit de cette manière:

```dart

TextStyle _Ts = TextStyle color : Colors green , fontSize : 15
Text (
“Mon texte d’exemple”
style: _Ts
),

```
La banner debug se retire en ajoutant :
debugShowCheckedModeBanner : false , Dans le retour de la fonction build de MyApp

### Mon application évoluée
Créer une application flutter qui demande le nom de l'utilisateur dans un formulaire et lors que l'on clique sur un bouton, cela affiche bonjour {$nom_de_l_utilisateur}
Si le nom est égal à Voldemort, l'écran devient rouge avec un décompte... puis boom


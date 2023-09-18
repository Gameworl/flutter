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

- [ ]  installation de flutter
- [ ]  installation de android studio pour créer un émulateur et posséder le sdk android
- [ ]  _et/ou_ installation xcode si vous travaillez sur mac avec un iphone
- [ ]  installation de l'ide, vscode et ses plugins...

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
Créer une application flutter qui demande le nom de l'utilisateur dans un formulaire et lorsque l'on clique sur un bouton, cela affiche bonjour {$nom_de_l_utilisateur}
Si le nom est égal à Voldemort, l'écran devient rouge avec un décompte... puis boom

Pour réaliser ce tp, il faut mettre en place un formulaire avec un champs texte et un bouton

Pour récupérer, et utliser le contenu du champs nous allons utiliser un `TextEditingController`. Lors du clic, on va modifié une variable du state et afficher un champs texte .

On conditionne l'affichage pour ne pas voir le _'Hello'_ avant d'avoir saisi un nom

Deuxième condition à mettre en place. Si le nom est égale à voldemort alors on remplace le widget par un autre. 

Le deuxième widget doit être créé dans un autre fichier.

Pour lancer le compte à rebours, on va se baser sur la méthode initState que l'on va sur charger pour ajouter un `Timer.periodic` 

[Documentation Timer](https://api.flutter.dev/flutter/dart-async/Timer/Timer.periodic.html)

Pour afficher le compte à rebours, on va devoir mettre à jour le state. Penser à arréter le timer quand on est zéro.

L'effet du boom sera fait dans un troisième widget.

### Le retour du lead tech

Le leadtech n'est pas content!


Il a demandé de gérer lancement du compte à rebours dans une nouvelle page avec une gestion de la navigation _avec des routes nommées_ dans l'application.Et non en conditionnant l'affichage d'un widget.
  
[Documentation navigation](https://docs.flutter.dev/ui/navigation)


### Les retours du client

Suite à la mise en place de l'application, le client a remarqué qu'il souhaitait ajouter d'autres personnes dans la liste des personnes à faire disparaitre.

Mais il ne veut pas resaisir tous les noms au lancement de l'application, il faut les stocker en local dans l'application.

On va s'appuyer le système stockage `Shared preferences`

[Documentation Shared preferences](https://pub.dev/packages/shared_preferences)

**Quelque petites choses à savoir sur `Shared preferences`**

- La récupération d'instance est asynchrone
```dart   
final SharedPreferences prefs = await SharedPreferences.getInstance();
```
- L'écriture et la suppression aussi 

```dart
await prefs.setInt('counter', 10);
await prefs.remove('counter');
```
- La récupération de données est "nullable"
```dart
final double? decimal = prefs.getDouble('decimal');
```  
- On peut stocker des objets complexes en les sérialisant en JSON puis en utilisant le  `setString`. 


**Comment gérer l'asynchronisme dans DART?**

On gère un retour asynchrone grâce à l'objet `Future`. 
 - Soit on reste en mode itératif avec le mot clé `await` et `async`
```dart
 static late SharedPreferences prefs;
 Future init() async {
    prefs = await SharedPreferences.getInstance();
  }
```
- Soit on passe en mode fonctionnel avec l'appel de la méthode `then` qui va gérer le callback
  
```dart
 msgAdapter
        .saveMessage(Message(_author, msgCtrl.text))
        .then((value) => ...(value));
```

**Comment sérialiser/désérialiser un objet en JSON?**

- Soit en créant un construtor et methode de sérialisation pour implementer à la main le mapping
```dart
  Message.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? "";
    author = json['author'] ?? "";
    date = DateTime.parse(json['date'] ?? '');
    msg = json['msg'] ?? '';
  }
  Map<String, dynamic> toJson() {
    return {'id': id, 'author': author, 'date': date.toString(), 'msg': msg};
  }
  ```

- Soit en utilisant la library `json_serializable``
 [Documention json_serializable](https://pub.dev/packages/json_serializable)

**Comment afficher un menu burger dans MaterialUI?**
[Documentation Drawer](https://docs.flutter.dev/cookbook/design/drawer)

**Roadmap:**

- [ ] Créer une nouvelle page
- [ ] Cette page affiche la liste des noms sauvegardés, si aucun nom alors on a au moins _'Voldemort'_
- [ ] Cette page contient un formulaire pour ajouter un nom à la liste
- [ ] Cette liste est sauvegardée dans le `SharedPreferences`
- [ ] On accède à cette page par le Menu Burger du `MaterialUI`


**Objectif développeur du mois**

Pour impressionner le Leadtech vous décidez de:

 - avoir un seul widget commun pour le scaffold des deux pages
 - creer  un widget pour la liste et un pour le formulaire pour la page black list
 - utiliser une listview builder pour afficher les noms des blacklistés
 - utiliser une animation à l'ouverture de la page pour faire comme si elle venait de la droite.



### Ca n'en finira jamais

Le client revient vers nous car c'est trop pénible de saisir le nom un par un des étudiants

Il nous donne accès à une api avec l'ensemble des étudiants de son école:
`https://hp-api.onrender.com/api/characters/students`

Pour cela vous avez le choix entre la lib http ou http_request.

- [ ] Créer une nouvelle page, où l'on affiche la liste des étudiants.
- [ ] Si on slide sur un nom, il s'ajoute à la liste des bannis 
- [ ] On modifie l'ancienne page (où l'on visualise les bannis) pour que lorsque l'on slide sur un nom, on puisse le débanne l'étudiant



**Objectif bonus**

- [ ] Créer une page pour prendre une photo et l'afficher avec image_picker
- [ ] Donner une apparence IOS en plus de l'apparence Android avec cupertinopagescaffold enfonction de l'appareil sur lequel on se trouve avec `platform.isAndroid `
- [ ] Créer une page de chat avec chat_bubbles: ^1.5.0
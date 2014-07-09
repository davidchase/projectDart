import 'dart:html'; // DOM manipulation with this package
import 'dart:math' show Random; // import only Random from math package
import 'dart:convert' show JSON;
import 'dart:async' show Future;

// Top level variable
ButtonElement createMonster;


class Monster {
   // Static belongs to the class not the instance
   // final means it cannot be changed
    static final Random indexGen = new Random();

    static List<String> firstNames = [];
    static List<String> surnames = [];

    // private vars
    String _firstName;
    String _surName;

    // Constructor, same name as class definition
    Monster() {
        _firstName = firstNames[indexGen.nextInt(firstNames.length)];
        _surName = surnames[indexGen.nextInt(surnames.length)];
    }

     // if single item to be returned
     // 'fat' arrow can be used to shorten
     // instead of toString() { return monsterName }
     String toString() => monsterName;

     // '$' sign in front of a variable
     //  used for interpolation inside a string :)
     String get monsterName => '$_firstName $_surName';

    static Future getMonstersAsync() {
      String path = 'monsters.json';
      return HttpRequest.getString(path).then(_parseMonsters);
    }
    
    static void _parseMonsters(String jsonString) {
      Map monsterNames = JSON.decode(jsonString);
      firstNames = monsterNames['firstNames'];
      surnames = monsterNames['surnames'];
    }

}

void getMonsterName(Event e) { 
    Monster.getMonstersAsync()
           .then((_) {
                showMonster(new Monster());
           })
           .catchError((err){
                // print is the same as console.log in js
                print('Something went wrong $err');
           });
}

void showMonster(Monster newMonster) {
    ParagraphElement monsterContainer = querySelector('.monster-name');
    monsterContainer.text = newMonster.monsterName;
}

void main() {
    createMonster = querySelector('#create-monster-btn');
    createMonster.onClick.listen(getMonsterName);
}

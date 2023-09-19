class Character {
  String name;
  int hp;
  int defense;
  
  Character({required this.name, required this.hp, required this.defense});
}

class Student {
  String sid;
  String name;

  Student({required this.sid, required this.name});

  @override
  String toString() {
    return 'Student(sid: $sid, name: $name)';
  }
}

mixin Magic on Character {
  int magicDamage = 0;
  int mana = 0;

  int castSpell(Character target) {
    if (mana >= 10) {
      int damage = magicDamage - target.defense;
      if (damage > 0) {
        target.hp -= damage;
        mana -= 10;
        return damage;
      } else {
        return 0;
      }
    } else {
      return 0;
    }
  }
}

mixin Melee on Character {
  int attackPower = 0;
  int stamina = 0;

  int attack(Character target) {
    if (stamina >= 10) {
      int damage = attackPower - target.defense;
      if (damage > 0) {
        target.hp -= damage;
        stamina -= 10;
        return damage;
      } else {
        return 0; 
      }
    } else {
      return 0; 
    }
  }
}

class Player extends Character with Magic {
  Player({name, hp, magicDamage, mana, defense}) 
            : super(name: name, hp: hp, defense: defense) {
    this.mana = mana;
    this.magicDamage = magicDamage;
  }
}

class Enemy extends Character with Melee {
  Enemy({name, hp, attackPower, stamina, defense}) 
           : super(name: name, hp: hp, defense: defense) {
    this.stamina = stamina;
    this.attackPower = attackPower;
  }
}



void main() {
  List<double> grades = [85.5, 92.0, 78.5, 60.0, 45.5];

  List<double> scaledGrades = grades.map((grade) => (grade / 100) * 30 + 2).toList();

  print(scaledGrades);
  
  List<int> numbers = [1, 2, 3, 4, 5];

  List<Student> students = numbers.map((number) => Student(
        sid: (100000000 + number).toString(),
        name: 'Student #$number',
      )).toList();

  students.forEach((student) => print(student));
  Enemy enemy = Enemy(
    name: 'Boss',
    hp: 100,
    attackPower: 15,
    stamina: 50,
    defense: 8,
  );

  Player player = Player(
    name: 'Player',
    hp: 80,
    magicDamage: 20,
    mana: 40,
    defense: 5,
  );

  int enemyDamage = enemy.attack(player);
  int playerDamage = player.castSpell(enemy);

  print('${enemy.name} hits ${player.name} for $enemyDamage points of damage!');
  print('${player.name} hits ${enemy.name} for $playerDamage points of damage!');
}

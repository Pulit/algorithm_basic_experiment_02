//Humanを管理するlistクラスを作ることがポイント

int[] ages = {12, 34, 19, 22, 11, 29, 1, 3, 22, 48};
String[] names = {"jon", "maria", "ken", "mike", "emma", "emily", "charlotte", "jackson", "bob", "ben"};

class HumanList {
  Human head;
  HumanList() {
    head = null;
  }

  void add(Human h) {
    Human cur = head;
    if (cur == null) {
      head = h;
      return;
    }

    while (cur.next != null) cur = cur.next;
    cur.next = h;
  }

  void insert(Human h, int index) {
    if ( index == 0 ) {
      h.next = head;
      head = h;
      return;
    }

    Human cur = head;    
    for (int i = 0; i < index - 1; i++) {
      cur = cur.next;
    }
    Human tmp = cur.next;

    cur.next = h;
    h.next = tmp;
  }

  void delete(int index) {
    if (index == 0){
     head = head.next;
     return;
    }
    
    Human cur = head;
    for (int i = 0; i < index - 1; i++)
      cur = cur.next;

    cur.next = cur.next.next;
  }

  String toString() {
    String str = "";
    Human cur = head;
    while (cur != null) {
      str += cur.name + " : " + cur.age + "\n";
      cur = cur.next;
    }
    return str;
  }
}

class Human {
  Human next;
  int age;
  String name;
  Human(int _age, String _name) {
    age = _age;
    name = _name;
    next = null;
  }
}

HumanList l = new HumanList();
void setup() {
  for (int i = 0; i < 10; i++)
    l.add(new Human(ages[i], names[i]));
  println(l);

  l.insert(new Human(10, "Meijiro"), 5);
  println(l);
  
  l.delete(0);
  println(l);
}
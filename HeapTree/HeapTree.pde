//解説できるほどよくわかってないけど
//とりあえず線形リストっぽいもので作れた
//色々再帰しまくりなので察してください

class Heap {
  Node root;
  int count;

  Heap() {
    count = 0;
  }

  void add(int value) {
    Node n = new Node(value);
    if (count == 0) {
      root = n;
      count++;
      return;
    }

    n.parent = getParent(count);

    if (count % 2 == 1) n.parent.left  = n;
    else                n.parent.right = n;
    check(n);
    count++;
  }

  Node getParent(int i) {
    return getNode((i + 1) / 2, root);
  }

  Node getNode(int i) {
    return getNode((i + 1), root);
  }
  Node getNode(int i, Node cur) {
    if (i == 1) return cur;
    cur = getNode(i/2, cur);

    if ( i % 2 == 0) return cur.left;
    else             return cur.right;
  }

  int delete() {
    if(count == 0)return 0;
    int v = root.value;

    if(count == 1){
     root = null;
     count--;
     return v;
    }
    
    count--;
    Node nr = getNode( count );

    root.value = nr.value;

    if ( count % 2 == 1) nr.parent.left  = null;
    else                 nr.parent.right = null;
    nr = null;
    check(root);
    return v;
  }

  void check(Node n) {
    if (n.left != null && n.left.value > n.value ) {
      int swp = n.value;
      n.value = n.left.value;
      n.left.value = swp;
      check(n.left);
      return;
    }

    if (n.right != null && n.right.value > n.value) {
      int swp = n.value;
      n.value = n.right.value;
      n.right.value = swp;
      check(n.right);
      return;
    }

    if (n == root)return;
    check(n.parent);
  }

  void show() {
    if (root != null) root.show(0, 0);
  }
}

class Node {
  int value;
  Node left, right, parent;
  Node(int _v) {
    value = _v;
    left = null;
    right = null;
    parent = null;
  }

  void show(int n, float offset) {
    float centerX = width / 2 + offset;
    float centerY = 60 + n * 150;

    if (left != null) {
      float next_offset = offset + -width / pow(2, n + 2);
      line(centerX, centerY, width / 2 + next_offset, 60 + (n + 1) * 150);
      left.show(n + 1, next_offset);
    }
    if (right != null) {
      float next_offset = offset + width / pow(2, n + 2);
      line(centerX, centerY, width / 2 + next_offset, 60 + (n + 1) * 150);     
      right.show(n + 1, next_offset);
    }

    fill(200, 200, 255);
    ellipse(centerX, centerY, 60, 60);
    fill(0);
    text(value, centerX, centerY);
  }
}

Heap h;
void setup() {
  size(1000, 1000);
  h = new Heap();
  textAlign(CENTER);
  textSize(20);
}

void draw() {
  background(255);
  h.show();
}

void keyPressed() {
  switch(key) {
  case 'i':
    h.add((int)random(100));
    break;

  case 'd':
    println(h.delete());
    break;
  }
}
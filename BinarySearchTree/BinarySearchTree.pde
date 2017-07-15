//削除はそこそこ難しいから作り方をググったほうが良い
//今回はrootを削除している

class BinaryTree {
  Node root;

  BinaryTree() {
    root = null;
  }

  void add(int value) {
    Node n = new Node(value);
    if (root == null) {
      root = n;
      return;
    }
    Node cur = root;
    while (true) {
      if ( cur.value > value ) {
        if (cur.right == null) {
          n.parent = cur;
          cur.right = n;
          break;
        }
        cur = cur.right;
      } else {
        if (cur.left == null) {
          n.parent = cur;
          cur.left = n;
          break;
        }
        cur = cur.left;
      }
    }
  }

  int delete() {
    if (root == null) return 0;
    int v = root.value;
    Node swp = delete(root, root);
    if (swp != null) {
      swp.right = root.right;
      swp.left  = root.left;
    }
    root = swp; 
    return v;
  }

  Node delete(Node par, Node cur) {
    if ( cur.right != null && cur.left != null) {    
      if (root.value < cur.value) return delete(cur, cur.right);
      return delete(cur, cur.left);
    }

    if (cur.right != null) {
      if (cur == root) {
        root = cur.right;
        return cur.right;
      }
      if (par.value > cur.value && cur.value < cur.right.value ) {
        par.right = cur.right;
        return cur;
      }
      return delete(cur, cur.right);
    }

    if (cur.left != null) {
      if (cur == root) {
        root = cur.left;
        return cur.left;
      }

      if (par.value <= cur.value &&  cur.value < cur.left.value){
        par.left = cur.left;
        return cur;
      }
      return delete(cur,cur.left);
    }

    if (cur == root) {
      return null;
    }

    if (par.value > cur.value) par.right = null;
    else                      par.left  = null;

    return cur;
  }


  void show() {
    if (root != null) root.show(0, 0);
  }
}


class Node { 
  int value;
  Node left, right, parent;

  Node(int _v) {
    left  = null;
    right = null;
    parent = null;
    value = _v;
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

BinaryTree b;
void setup() {
  size(1000, 1000);
  b =  new BinaryTree();
  textAlign(CENTER);
  textSize(20);
}

void draw() {
  background(255);
  b.show();
}

void keyPressed() {
  switch(key) {
  case 'i':
    b.add((int)random(100));
    break;

  case 'd':
    println(b.delete());
    break;
  }
}
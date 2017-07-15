//10進数のint型を2進数を表すString型に変換
int dec = 100;

void setup() {
  //String型を返してくれる基数変換
  println(Sbin(dec));
  
  //値をそのままprintしてくれる関数
  Pbin(dec); println();

  //（おまけ）わざわざ実装しなくてもこんなのも標準であるよ
  println(dec + " : " + Integer.toBinaryString(dec));
}

//Stringのデフォルト値を決めたかったのでOverload
String Sbin(int n) {
  return Sbin(n, "");
}

//0だったらそのまま返してそれ以外ならn%2を前に追記してその次に
String Sbin(int n, String bin) {
  if (n == 0)return bin;
  return Sbin(n / 2, n % 2 + bin);
}

//再帰させるのをprintする前にすることによって
//一番上の桁が一番最初に表示されることがポイント
void Pbin(int n) {
  if (n == 0)return;
  Pbin(n/2);
  print(n%2);
}
//シダ植物を描画
final int RATIO = 59;

void setup() {
  size(600, 600);
  background(0);
  stroke(255, 255, 128, 255);
}

void draw(){
 Sida(0,0,100); 
}

//再帰することによって引数として新しい x, yを作ることができるので、
//バッファーを設ける必要性がない部分がポイント
void Sida(float x, float y, int n) {
  if (n-- == 0)return;
  point(( x * RATIO) + width / 2 - 50, height - y * RATIO);

  float sw = random(100);
  if      (sw > 15)  Sida(0.85 * x + 0.04 * y, -0.04 * x + 0.85 * y + 1.6, n);
  else if (sw > 8)   Sida(-0.15 * x + 0.28 * y, 0.26 * x + 0.24 * y + 0.44, n);
  else if (sw > 1)   Sida(0.2 * x - 0.26 * y, 0.23 * x + 0.22 * y + 1.6, n);
  else               Sida(0, y * 0.16, n);
}
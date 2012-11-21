// Breadboarders Arduino POV by Musashinodenpa

#define LEDPIN 2  // どのピンから使用したか(今回は2から9)
#define DELAYMS 4  // 点滅間隔(ミリ秒で指定)
#define BITMAPLEN 15  // ビットマップの大きさ(行数に同じ)

// ビットマップ(画像)を定義 (最大8ドット×256行)
// "ニャ"
byte bitmap[] = {
  0b01000000,
  0b01000010,
  0b01000010,
  0b01000010,
  0b01000000,
  0b00000000,
  0b00000000,
  0b00001000,
  0b11111110,
  0b00001000,
  0b00101000,
  0b00011000,
  0b00000000,
  0b00000000,
  0b00000000
};

unsigned char pos = 0; // 表示位置

void setup() {
  // LEDが接続されたピンを出力に設定します
  for(int i=LEDPIN; i<LEDPIN + 7; i++) {
    pinMode(i, OUTPUT);
  }
}

void loop() {
  for(int i=0; i<8; i++) {
    digitalWrite(LEDPIN + i, (bitmap[pos] >> i) & 0b00000001);
  }
  if(++pos == BITMAPLEN) pos = 0;
  delay(DELAYMS);
}



// Breadboarders Arduino POV by Musashinodenpa

#define LEDPIN 2  // �ǂ̃s������g�p������(�����2����9)
#define DELAYMS 4  // �_�ŊԊu(�~���b�Ŏw��)
#define BITMAPLEN 15  // �r�b�g�}�b�v�̑傫��(�s���ɓ���)

// �r�b�g�}�b�v(�摜)���` (�ő�8�h�b�g�~256�s)
// "�j��"
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

unsigned char pos = 0; // �\���ʒu
unsigned char i;

void setup() {
  // LED���ڑ����ꂽ�s�����o�͂ɐݒ肵�܂�
  int i;
  for(i=LEDPIN; i<LEDPIN + 7; i++) {
    pinMode(i, OUTPUT);
  }
}

void loop() {
  for(i=0; i<8; i++) {
    digitalWrite(LEDPIN + i, (bitmap[pos] >> i) & 0b00000001);
  }
  if(pos++ == BITMAPLEN) pos = 0;
  delay(DELAYMS);
}


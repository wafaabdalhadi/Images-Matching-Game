class Game{
  final String hiddenCardpath = 'images/hiddenn.png';
  List<String>? gameImg;

  final List<String> card_list = [
    "images/sheep.png",
    "images/insect.png",
    "images/caw.png",
    "images/leon.png",
    "images/elephant.png",
    "images/deer.png",
    "images/elephant.png",
    "images/sheep.png",
    "images/caw.png",
    "images/insect.png",
    "images/leon.png",
    "images/deer.png",
  ];

  List<Map<int, String>> matchCheck= [];

  final int cardCount = 12;

  void initGame(){
    gameImg = List.generate(cardCount, (index) => hiddenCardpath);
  }
}
import 'package:flutter/material.dart';
import 'package:memory_game/utils/game_logic.dart';
import 'package:memory_game/widgets/score_board.dart';
import 'widgets/dialog.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Game _game = Game();

  int tries = 0;
  int score = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _game.initGame();
  }

  @override
  Widget build(BuildContext context) {
    double screen_width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor:  Color(0xFD177F7D),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "Memory Game", style: TextStyle(
              fontSize: 48.0,
              fontFamily: 'Pacifico',
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              scoreBoard("Tries", "${tries}"),
              scoreBoard("Score", "${score}"),
            ],
          ),
          SizedBox(height:  screen_width+100,
            width: screen_width,
            child: GridView.builder(
                itemCount: _game.gameImg!.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 8.0
                ),
                padding: EdgeInsets.all(16.0),
                itemBuilder: (context, index){
                  return GestureDetector(
                  onTap: (){
                      print(_game.card_list[index]);
                      setState(() {
                          tries++;
                          _game.gameImg![index] = _game.card_list[index];
                          _game.matchCheck.add({index: _game.card_list[index]});
                      });
                      if(_game.matchCheck.length==2){
                        if(_game.matchCheck[0].values.first == _game.matchCheck[1].values.first){
                          print("true");
                          score += 100;
                          _game.matchCheck.clear();
                          if(score==600){
                            showAlertDialog(context);
                          }

                        }else{
                          print(false);
                          Future.delayed(Duration(milliseconds: 500),(){
                            print(_game.gameImg);
                            setState(() {
                              _game.gameImg![_game.matchCheck[0].keys.first] = _game.hiddenCardpath;
                              _game.gameImg![_game.matchCheck[1].keys.first] = _game.hiddenCardpath;
                              _game.matchCheck.clear();
                            });
                          });
                        }
                        }
                  },
                  child: Container(
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Color(0xC1C4e18e),
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                          image: AssetImage(_game.gameImg![index]),
                          fit: BoxFit.scaleDown,
                      ),
                    ),
                  ));
                }),
          ),
        ],
      ),
    );
  }
}

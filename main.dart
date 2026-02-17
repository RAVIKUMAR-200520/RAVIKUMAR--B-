import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Mainpage()
  ));
}
class Mainpage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Colors.blueAccent,
            height: MediaQuery.of(context).size.height/2,
            width: double.infinity,
             child: Center(
              child:   MaterialButton(onPressed: (){
                Navigator.push(context,MaterialPageRoute(builder: (context)=>game()));
              },
            child: Text('START'),
            color: Colors.white,
            shape: CircleBorder(),
            height: 150,minWidth: 150,),)
          ),
          Container(
            color: Colors.redAccent,
            height: MediaQuery.of(context).size.height/2,
            width: double.infinity,
            child: Center(
              child:   MaterialButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>game()));
              },
            child: Text('START'),
            color: Colors.white,
            shape: CircleBorder(),
            height: 150,minWidth: 150,),)
          )
        ],
      ),

    );
  }
}
class game extends StatefulWidget{
  @override
  State<game> createState() => _gameState();
}

class _gameState extends State<game> {
double bluecard=0;
double redcard=0;
bool initial=false;
int PlayerAScore=0;
int PlayerBScore=0;

  @override
  Widget build(BuildContext context) {

    if(initial==false){

bluecard=MediaQuery.of(context).size.height/2;
redcard=MediaQuery.of(context).size.height/2;

initial=true;
    }

    return Scaffold(
body: Column(
  children: [
    MaterialButton(
      onPressed: (){
        print(bluecard);

        setState(() {
          bluecard=bluecard+30;
          redcard=redcard-30;
          PlayerAScore=PlayerAScore+5;
        });
        double Screen=MediaQuery.of(context).size.height;
        double maxheight=MediaQuery.of(context).size.height-350;
        print(bluecard);
        print(maxheight);
        if(bluecard>maxheight){
          Navigator.push(context,MaterialPageRoute(builder: (context)=>result(PlayerAScore,'A')));
        }
      },
      padding: EdgeInsets.zero,
      child: Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.all(10),
        width: double.infinity,
        height: bluecard,
        //MediaQuery.of(context).size.height/2,
        color: Colors.blueAccent,
        child: Row(children: [
          Expanded(child:   Text('PLAYER A',style: TextStyle(
            fontSize: 25,fontWeight: FontWeight.bold),)
          ),
          Text(PlayerAScore.toString(),style: TextStyle(
            fontSize: 25,fontWeight: FontWeight.bold),)
        ],),
      ),
    ),
     MaterialButton(
      onPressed: (){
        setState(() {
           redcard=redcard+30;
        bluecard=bluecard-30;
        PlayerBScore=PlayerBScore+5;
        });
        double Screen=MediaQuery.of(context).size.height;
       double maxheight=MediaQuery.of(context).size.height-350;
       print(redcard);
       print(maxheight);
       if(redcard>maxheight){
        Navigator.push(context,MaterialPageRoute(builder: (context)=>result(PlayerBScore,'B')));
       }
      },
      padding: EdgeInsets.zero,
       child: Container(
        alignment: Alignment.bottomLeft,
        padding: EdgeInsets.all(10),
        width: double.infinity,
        height: redcard,
        //MediaQuery.of(context).size.height/2,
        color: Colors.redAccent,
        child: Row(children: [
          Expanded(child:   Text('PLAYER B',style: TextStyle(
            fontSize: 25,fontWeight: FontWeight.bold),)
          ),
          Text(PlayerBScore.toString(),style: TextStyle(
            fontSize: 25,fontWeight: FontWeight.bold),)
        ],),
           ),
     )
  ],
),
    );
  }
}

class result extends StatelessWidget{
  int score=0;
  String player='';
  result(this.score,this.player);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:player=='A'?Colors.blueAccent : Colors.redAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(score.toString(),style: TextStyle(fontSize: 60,fontWeight: FontWeight.bold),),
            Text(player=='A'?'PLAYER A WON':'PLAYER B WON',
            style: TextStyle(fontSize: 35),),
            MaterialButton(onPressed: (){
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: Text('Restart Game'),
            color: Colors.white,)
          ],
        ),
      ),

    );
  }
}
import 'package:flutter/material.dart';

class Compitition extends StatefulWidget {
  const Compitition({Key? key}) : super(key: key);

  @override
  _CompititionState createState() => _CompititionState();
}

class _CompititionState extends State<Compitition> {
  var _scoreRed = [];
  var _scoreBlue = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("สวัสดีครับ"),
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
                child: Image.asset(
              'assets/images/Tokyo.png',
              height: 80.0,
            )),
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                    color: Colors.black,
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Center(
                          child: Text(
                        "Women's light (57-60 kg) Semi-Final",
                        style: TextStyle(color: Colors.white),
                      )),
                    )),
              ),
            ],
          ),
          _IRELAND(),
          _Thailand(),
          button(),
          Expanded(
              child: Column(
            children: [
              for (int i = 0; i < _scoreBlue.length; i++) _buildScoreRabel(i),
              if (_scoreRed.length == 3)
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "TotalScore",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Center(
                                child: Text(
                          "${Totalscore(true)}",
                          style: TextStyle(fontSize: 40),
                        ))),
                        Expanded(
                            child: Center(
                                child: Text(
                          "${Totalscore(false)}",
                          style: TextStyle(fontSize: 40),
                        ))),
                      ],
                    ),
                    const Divider(
                      thickness: 1.0,
                    ),
                  ],
                ),
            ],
          )),
          Blackbotton(),
        ],
      ),
    );
  }

  Row _Thailand() {
    return Row(
          children: [
            const Icon(
              Icons.person,
              size: 80.0,
              color: Colors.blue,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        "assets/images/thailand.png",
                        height: 30.0,
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Thailand",
                          style: TextStyle(fontSize: 15.0),
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text(
                      "Chawakorn Prajak",
                      style: TextStyle(fontSize: 20.0),
                    ),
                  )
                ],
              ),
            ),
            if(Totalscore(false)>Totalscore(true)&&_scoreRed.length==3)
              Icon(Icons.check,size: 80.0,color: Colors.green,),
          ],
        );
  }

  Row _IRELAND() {
    return Row(
          children: [
            const Icon(
              Icons.person,
              size: 80.0,
              color: Colors.red,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        "assets/images/Itali.png",
                        height: 30.0,
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("IRELAND"),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text(
                      "Herrington Hazaki Yasuo",
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                ],
              ),
            ),
            if(Totalscore(true)>Totalscore(false)&&_scoreRed.length==3)
              Icon(Icons.check,size: 80.0,color: Colors.green,),
          ],
        );
  }

  Row Blackbotton() {
    return Row(
      children: _scoreBlue.length == 3
          ? [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.black, minimumSize: Size(50, 50)),
                      onPressed: () {
                        setState(() {
                          _scoreBlue.clear();
                          _scoreRed.clear();
                        });
                      },
                      child: Icon(
                        Icons.clear,
                        color: Colors.white,
                      )),
                ),
              ),
            ]
          : [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.red, minimumSize: Size(50, 50)),
                      onPressed: () {
                        _countscore(true);
                      },
                      child: Icon(
                        Icons.person,
                        color: Colors.white,
                      )),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.blue, minimumSize: Size(50, 50)),
                      onPressed: () {
                        _countscore(false);
                      },
                      child: Icon(
                        Icons.person,
                        color: Colors.white,
                      )),
                ),
              )
            ],
    );
  }

  Row button() {
    return Row(
      children: [
        Expanded(
            child: Container(
          color: Colors.red,
          height: 6.0,
        )),
        Expanded(
            child: Container(
          color: Colors.blue,
          height: 6.0,
        )),
      ],
    );
  }

  Widget _buildScoreRabel(int index) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "Round ${index + 1}",
            style: TextStyle(fontSize: 20),
          ),
        ),
        Row(
          children: [
            Expanded(
                child: Center(
                    child: Text(
              "${_scoreRed[index]}",
              style: TextStyle(fontSize: 40),
            ))),
            Expanded(
                child: Center(
                    child: Text(
              "${_scoreBlue[index]}",
              style: TextStyle(fontSize: 40),
            ))),
          ],
        ),
        const Divider(
          thickness: 1.0,
        ),
      ],
    );
  }

  void _countscore(bool isRed) {
    setState(() {
      if (_scoreRed.length < 3) {
        _scoreRed.add(isRed ? 10 : 9);
        _scoreBlue.add(isRed ? 9 : 10);
      }
    });
  }
  int Totalscore(bool isRed)
  {
    int sum =0;
    for(int score in isRed ? _scoreRed : _scoreBlue)
      sum+=score;
    return sum;
  }

}

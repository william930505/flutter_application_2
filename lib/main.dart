import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[200], // 改成灰色背景
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey[200],
          surfaceTintColor: Colors.transparent,
          elevation: 0,
        ),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 10, 
        backgroundColor: Colors.grey[200],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.white, // 設定背景為白色
              child: Column(
                children: [
                  SizedBox(height: 20), // 調整間距
                  // 加入 mlb logo 圖片並縮小
                  SizedBox(
                    height: 30, // 設定高度
                    child: Image.asset('assets/mlblogo.png'),
                  ),
                  SizedBox(height: 10),
                  Divider(color:Colors.grey[300],thickness: 1), // 加入一條線
                  GameInfo(),
                  Divider(color:Colors.grey[300],thickness: 1),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,  // 改為 spaceEvenly
                    children: [
                      Container(
                        width: 130,  // 加寬
                        alignment: Alignment.centerRight,
                        child: Text('Gameday', 
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      ),
                      Container(
                        width: 100,
                        alignment: Alignment.center,
                        child: Text('Tickets', 
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      ),
                      Container(
                        width: 100,
                        alignment: Alignment.centerLeft,
                        child: Text('Story', 
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      ),
                    ],
                  ),
                  SizedBox(height: 10), // 加入更多間距
                ],
              ),
            ),
            TopStory(),
            // 添加更多內容來測試滾動效果
            SizedBox(height: 60), // 確保底部導航欄不會遮擋內容
          ],
        ),
      ),
      bottomNavigationBar: Stack(
        children: [
          BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.grid_on),
                label: 'Scores',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.tv),
                label: 'Watch',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.flag),
                label: 'Standings',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.article),
                label: 'News',
              ),
            ],
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: FloatingActionButton(
              onPressed: () {},
              child: Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }
}

class GameInfo extends StatelessWidget {
  const GameInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white, // 設定背景為白色
      padding: const EdgeInsets.all(1.0),
      child: Column(
        children: [
          // 第一行: Logo + 比賽資訊 + 日曆
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Image.asset('assets/padreslogo1.png', height: 40),
              ),
              // 使用自訂的 BoxedColumn 讓三個區塊加上不同顏色的外框
              BoxedColumn('星期六     15', 'TEX', 'W 9-8',
                  borderColor: Colors.grey[300]!, borderWidth: 1), // TEX 灰色外框
              BoxedColumn('星期日     16', '@SEA', '4:10 上午',
                  borderColor: Colors.black, borderWidth: 3), // SEA 黑色外框
              BoxedColumn('星期一     17', '@LAA', '4:10 上午',
                  borderColor: Colors.grey[300]!, borderWidth: 1), // LAA 灰色外框
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Image.asset('assets/calendar.png', height: 40),
              ),
            ],
          ),
          Divider(color:Colors.grey[300],thickness: 1),
          const SizedBox(height: 5.0),
          // 第二行: 戰績與比賽時間
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 40.0),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/padreslogo2.png',
                      height: 50,
                      width: 50,
                    ),
                    Text('6-14'),
                  ],
                ),
              ),
              Column(
                children: const [
                  Text('週日 3/16', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('4:10 上午 GMT+08:00', style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 40.0),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/marinerslogo.png',
                      height: 50,
                      width: 50,
                    ),
                    Text('6-14'),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          Divider(color:Colors.grey[300],thickness: 1),
          Text('Watch on: SDPA', style: TextStyle(color: Colors.grey[800])),
          Divider(color:Colors.grey[300],thickness: 1),
          // 第三行: 投手資訊
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 40.0),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.yellow[600],
                        shape: BoxShape.circle,
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          'assets/king.png',
                          height: 40,
                          width: 40,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'King ',
                                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                              ),
                              TextSpan(text: 'RHP'),
                            ],
                          ),
                        ),
                        Text('0-1|5.79 ERA'),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 40.0),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.indigo[900],
                        shape: BoxShape.circle,
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          'assets/castillo.png',
                          height: 40,
                          width: 40,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Castillo ',
                                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                              ),
                              TextSpan(text: 'RHP',
                              ),
                            ],
                          ),
                        ),
                        Text('1-0|3.38 ERA',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class BoxedColumn extends StatelessWidget {
  final String day;
  final String team;
  final String result;
  final Color borderColor; // 新增邊框顏色參數
  final double borderWidth; // 邊框粗細

  const BoxedColumn(this.day, this.team, this.result,
      {super.key, required this.borderColor, this.borderWidth = 1});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: borderWidth), // 使用傳入的顏色設定外框
        borderRadius: BorderRadius.circular(5), // 設定圓角
      ),
      child: Column(
        children: [
          Text(day),
          Text(team, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          Text(result),
        ],
      ),
    );
  }
}

class TopStory extends StatelessWidget {
  const TopStory({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(0, -2), // 向上的陰影
          ),
        ],
      ),
      width: double.infinity,
      child: Container(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30), // 加入這行來增加上方間距
            Text(
              'Top Story',
              style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontFamily:"MyCustomFont",),
            ),
            SizedBox(height: 5.0),
            ClipRRect(
              borderRadius: BorderRadius.circular(10), // 四個角落變成圓滑的
              child: Column(
                children: [
                  Image.asset('assets/news.png'),
                  Container(
                    color: Colors.white,
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'De Vries, Salas show why they\'re top prospects at Spring Breakout',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontFamily:"MyCustomFont",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
//
//별자리 추가하는 부분 (jason 하드코딩)
  List<Photo> getPhotos() {
    return [
      Photo(
        id: 1,
        imageUrl:
            'https://www.shutterstock.com/image-vector/aries-zodiac-sign-zentangle-coloring-600w-1358582228.jpg',
      ),
      Photo(
        id: 2,
        imageUrl:
            'https://www.shutterstock.com/image-vector/gemini-zodiac-sign-zentangle-coloring-600w-1358582231.jpg',
      ),
      Photo(
        id: 3,
        imageUrl:
            'https://www.shutterstock.com/image-vector/capricorn-zodiac-sign-zentangle-coloring-600w-1358582234.jpg',
      ),
      Photo(
        id: 4,
        imageUrl:
            'https://www.shutterstock.com/image-vector/cancer-zodiac-sign-zentangle-coloring-600w-1358582237.jpg',
      ),
      Photo(
        id: 5,
        imageUrl:
            'https://www.shutterstock.com/image-vector/taurus-zodiac-sign-zentangle-coloring-600w-1358582243.jpg',
      ),
      Photo(
        id: 6,
        imageUrl:
            'https://www.shutterstock.com/image-vector/libra-zodiac-sign-zentangle-coloring-600w-1358582249.jpg',
      ),
      Photo(
        id: 7,
        imageUrl:
            'https://www.shutterstock.com/image-vector/leo-zodiac-sign-zentangle-coloring-600w-1358582252.jpg',
      ),
      Photo(
        id: 8,
        imageUrl:
            'https://www.shutterstock.com/image-vector/pisces-zodiac-sign-zentangle-coloring-600w-1358582258.jpg',
      ),
      Photo(
        id: 9,
        imageUrl:
            'https://www.shutterstock.com/image-vector/virgo-zodiac-sign-zentangle-coloring-600w-1358582246.jpg',
      ),
      Photo(
        id: 10,
        imageUrl:
            'https://www.shutterstock.com/image-vector/aquarius-zodiac-sign-zentangle-coloring-600w-1358582261.jpg',
      ),
    ];
  }

//
//Appbar
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(65),
          child: Container(
            padding: const EdgeInsets.only(top: 5), // 위쪽에 패딩을 추가합니다.
            color: Colors.transparent,
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title: const Text(
                '마이페이지',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                ),
              ),
              actions: [
                IconButton(
                  iconSize: 30,
                  color: Colors.white,
                  onPressed: () {},
                  icon: const Icon(Icons.settings),
                ),
              ],
            ),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 12, 19, 79),
        body: SingleChildScrollView(
          child: Column(
            children: [
//
//프로필 카드
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 29, 39, 125),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          IconButton(
                            iconSize: 100,
                            color: Colors.white,
                            onPressed: () {},
                            icon: const Icon(Icons.account_circle),
                          ),
                          const SizedBox(width: 10),
                          Column(
                            children: [
                              Row(
                                children: [
                                  const Text(
                                    '등급표시',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                  ),
                                  IconButton(
                                    color: Colors.white,
                                    iconSize: 15,
                                    onPressed: () {},
                                    icon: const Icon(Icons.help_rounded),
                                  ),
                                ],
                              ),
                              const Text(
                                '닉네임 부분',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(width: 1),
                          Column(
                            children: const [
                              Text(
                                '받은 좋아요',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                '456',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          const Text(
                            '│',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          Column(
                            children: const [
                              Text(
                                '별 개수',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                '1,234',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          const Text(
                            '│',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          Column(
                            children: const [
                              Text(
                                '이어진 은하',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                '18',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 1),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),
//
//별자리 모음
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 29, 39, 125),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Text(
                            '별자리',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      StaggeredGridView.countBuilder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 3,
                        itemCount: getPhotos().length,
                        itemBuilder: (context, index) {
                          final photo = getPhotos()[index];
                          return ClipOval(
                            child: Image.network(
                              photo.imageUrl,
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                        staggeredTileBuilder: (index) =>
                            const StaggeredTile.fit(1),
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Photo {
  final int id;
  final String imageUrl;

  Photo({
    required this.id,
    required this.imageUrl,
  });
}

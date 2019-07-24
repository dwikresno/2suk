import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share/share.dart';
import 'package:toast/toast.dart';
import 'package:twosuk/page/widget.dart';

class Hot extends StatefulWidget {
  Hot({Key key}) : super(key: key);

  _HotState createState() => _HotState();
}

class _HotState extends State<Hot> {
  List feeds = [
    {
      'name': 'dwikresno11',
      'desc':
          'Prada merupakan brand asal Italia yang didirikan oleh Mario Prada di tahun 1913\. Tidak hanya tas\, salah merk favorit para selebriti dunia ini juga mengeluarkan produk sepatu\, pakaian\, kosmetik dan perhiasan\. Tas keluaran Prada diakui sebagai salah satu yang terbaik di dunia\.Tas yang diproduksi terbuat dari bahan kulit asli berkualitas tinggi\. Harga satu tasnya bahkan bisa mencapai ribuan dollar\, atau mencapai belasan hingga puluhan juta rupiah lho\. Prada Saffiano merupakan salah satu tas keluaran Prada yang paling populer dan menjadi favorit para wanita\.Harga Prada Saffiano dibanderol sekitar US\$2\,200 atau sekitar Rp 29 juta\.',
      'image': 'assets/images/avatar-6.jpg',
      'image1': 'assets/images/c1.jpg',
      'liked': 'N',
      'following': 'N',
      'liked_count': 200,
      'disliked': 'N',
      'time': '1 hour ago'
    },
    {
      'name': 'dwikresno11',
      'desc':
          'Brand ini mungkin tidak sepopuler Prada di Indonesia, namun selebriti dunia seperti Angelina Jolie dan Kate Winslet ternyata sangat menyukai tas-tas keluaran brand yang diproduksi di Italia ini\. Salah satu tas iconic yang pernah dijual Lana Marks adalah Cleopatra clutch yang bertabur 1.500 berlian dan dilelang dengan harga US\$100\,000 atau sekitar Rp1\,3 miliar rupiah\!Wow\,harga yang sangat fantastis untuk sebuah tas bukan\? Lana Marks juga terkenal karena memiliki berbagai koleksi tas dengan 100 ranger warna yang berasal dari kulit aligator, buaya, burung unta dan kadal\.',
      'image': 'assets/images/avatar-6.jpg',
      'image1': 'assets/images/c1.jpg',
      'liked': 'N',
      'following': 'N',
      'liked_count': 200,
      'disliked': 'N',
      'time': '1 hour ago'
    },
    {
      'name': 'dwikresno11',
      'desc':
          'Founder brand asal Amerika Serikat ini merupakan mantan creative director Louis Vuitton\, sebelum akhirnya mendirikan brand dengan namanya sendiri\. Marc Jacobs terkenal dengan desain tasnya yang elegan dan simpel\. Salah satu handbagnya yang paling terkenal adalah Carolyn Crocodile handbag yang terbuat dari kulit buaya dan dijual dengan harga US\$50\,000 atau sekitar Rp650 juta\.',
      'image': 'assets/images/avatar-6.jpg',
      'image1': 'assets/images/c1.jpg',
      'liked': 'N',
      'following': 'N',
      'liked_count': 200,
      'disliked': 'N',
      'time': '1 hour ago'
    },
    {
      'name': 'dwikresno11',
      'desc':
          'Didirikan oleh Coco Chanel di tahun 1909\, Chanel telah membuktikan eksistensinya di dunia fashion selama ratusan tahun\. Terkenal karena parfum legendaris Chanel number 5\, brand yang kini tengah menggandeng Willow Smith sebagai brand ambassador ini juga terkenal dengan koleksi tasnya yang mewah dan timeless\. Chanel Boy Bag merupakan salah satu tas produksi Chanel yang paling banyak peminatnya\. Rata-rata tas chanel dipasarkan mulai dari harga Rp 30 jutaan\. Tas termahal yang pernah di produksi Chanel merupakan tas \'Diamond Forever\' yang bertabur emas dan berlian yang dijual dengan harga US\$261\,000 atau sekitar Rp 3\,4 miliar\!',
      'image': 'assets/images/avatar-6.jpg',
      'image1': 'assets/images/c1.jpg',
      'liked': 'N',
      'following': 'N',
      'liked_count': 200,
      'disliked': 'N',
      'time': '1 hour ago'
    },
    {
      'name': 'dwikresno11',
      'desc':
          'Louis Vuitton (LV) memang selalu identik dengan kemewahan\. Brand asal Paris\, Prancis dan telah eksis di dunia fashion sejak tahun 1854 ini mendapatkan penghargaan sebagai \'The Most Valuable Brand\' selama 6 tahun berturut-turut\. Selain karena modelnya yang timeless\, kualitas bahan yang sangat berharga dan waterproof semakin membuat tas-tas keluaran LV dicintai banyak orang\, terutama para wanita\. Handbag termahal yang pernah di produksi LV adalah Urban Satchel Bag yang dijual dengan harga US\$150\,000\, atau sekitar Rp 1,9 miliar\. Uniknya\, tas ini terbuat dari sampah lho\.',
      'image': 'assets/images/avatar-6.jpg',
      'image1': 'assets/images/c1.jpg',
      'liked': 'N',
      'following': 'N',
      'liked_count': 200,
      'disliked': 'N',
      'time': '1 hour ago'
    },
    {
      'name': 'dwikresno11',
      'desc':
          'Louis Vuitton (LV) memang selalu identik dengan kemewahan\. Brand asal Paris\, Prancis dan telah eksis di dunia fashion sejak tahun 1854 ini mendapatkan penghargaan sebagai \'The Most Valuable Brand\' selama 6 tahun berturut-turut\. Selain karena modelnya yang timeless\, kualitas bahan yang sangat berharga dan waterproof semakin membuat tas-tas keluaran LV dicintai banyak orang\, terutama para wanita\. Handbag termahal yang pernah di produksi LV adalah Urban Satchel Bag yang dijual dengan harga US\$150\,000\, atau sekitar Rp 1,9 miliar\. Uniknya\, tas ini terbuat dari sampah lho\.',
      'image': 'assets/images/avatar-6.jpg',
      'image1': 'assets/images/c1.jpg',
      'liked': 'N',
      'following': 'N',
      'liked_count': 200,
      'disliked': 'N',
      'time': '1 hour ago'
    },
    {
      'name': 'dwikresno11',
      'desc':
          'Louis Vuitton (LV) memang selalu identik dengan kemewahan\. Brand asal Paris\, Prancis dan telah eksis di dunia fashion sejak tahun 1854 ini mendapatkan penghargaan sebagai \'The Most Valuable Brand\' selama 6 tahun berturut-turut\. Selain karena modelnya yang timeless\, kualitas bahan yang sangat berharga dan waterproof semakin membuat tas-tas keluaran LV dicintai banyak orang\, terutama para wanita\. Handbag termahal yang pernah di produksi LV adalah Urban Satchel Bag yang dijual dengan harga US\$150\,000\, atau sekitar Rp 1,9 miliar\. Uniknya\, tas ini terbuat dari sampah lho\.',
      'image': 'assets/images/avatar-6.jpg',
      'image1': 'assets/images/c1.jpg',
      'liked': 'N',
      'following': 'N',
      'liked_count': 200,
      'disliked': 'N',
      'time': '1 hour ago'
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
        body: CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: story(),
        ),
        SliverToBoxAdapter(
          child: feed(),
        )
      ],
    ));
  }

  Widget story() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: Colors.black12,
          ),
        ),
      ),
      height: 100,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: feeds.length,
          itemBuilder: (context, index) {
            return Row(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      // padding: EdgeInsets.all(50),
                      margin: EdgeInsets.fromLTRB(10, 10, 10, 5),
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            stops: [
                              0.1,
                              0.4,
                              0.6,
                              0.9
                            ],
                            colors: [
                              Colors.yellow,
                              Colors.red,
                              Colors.blue,
                              Colors.green[600]
                            ]),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(2),
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage(feeds[index]['image']),
                        ),
                      ),
                    ),
                    Text(feeds[index]['name'].substring(0, 9))
                  ],
                )
              ],
            );
          }),
    );
  }

  Widget feed() {
    return Container(
      height: MediaQuery.of(context).size.height * 3.3,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: feeds.length,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: ListTile(
                  leading: Container(
                    // padding: EdgeInsets.all(50),
                    margin: EdgeInsets.all(5),
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          stops: [
                            0.1,
                            0.4,
                            0.6,
                            0.9
                          ],
                          colors: [
                            Colors.yellow,
                            Colors.red,
                            Colors.blue,
                            Colors.green[600]
                          ]),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(2),
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage(feeds[index]['image']),
                      ),
                    ),
                  ),
                  title: Row(
                    children: <Widget>[
                      Text(
                        feeds[index]['name'],
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if (feeds[index]['following'] == 'N') {
                              feeds[index]['following'] = 'Y';
                              Toast.show(
                                  "You now following ${feeds[index]['name']}",
                                  context,
                                  duration: Toast.LENGTH_LONG,
                                  gravity: Toast.BOTTOM);
                            } else {
                              _asyncConfirmDialog(index);
                            }
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.fromLTRB(15, 3, 15, 3),
                          // height: ,
                          child: feeds[index]['following'] == 'N'
                              ? Icon(Icons.add_circle, color: Colors.blue)
                              : Icon(Icons.people, color: Colors.green),
                        ),
                      ),
                    ],
                  ),
                  trailing: GestureDetector(
                    onTap: () {
                      showMoreVert(context);
                    },
                    child: Icon(Icons.more_vert),
                  ),
                ),
              ),
              GestureDetector(
                onDoubleTap: () {
                  setState(() {
                    if (feeds[index]['liked'] == 'N') {
                      feeds[index]['liked'] = 'Y';
                      feeds[index]['disliked'] = 'N';
                    } else {
                      feeds[index]['liked'] = 'N';
                    }
                  });
                },
                child: Container(
                  // margin: EdgeInsets.only(top: 10),
                  // height: 200,
                  color: Colors.black,
                  child: Image.asset(feeds[index]['image1']),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 20),
                height: 50,
                child: Row(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          if (feeds[index]['liked'] == 'N') {
                            feeds[index]['liked'] = 'Y';
                            feeds[index]['disliked'] = 'N';
                          } else {
                            feeds[index]['liked'] = 'N';
                          }
                        });
                      },
                      child: Padding(
                        padding: EdgeInsets.only(left: 0, right: 5),
                        child: feeds[index]['liked'] == 'N'
                            ? Icon(FontAwesomeIcons.smile)
                            : Icon(
                                FontAwesomeIcons.solidSmile,
                                color: Colors.yellow[700],
                              ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 0, right: 10),
                      child: Text(
                        feeds[index]['liked_count'].toString(),
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          if (feeds[index]['disliked'] == 'N') {
                            feeds[index]['disliked'] = 'Y';
                            feeds[index]['liked'] = 'N';
                          } else {
                            feeds[index]['disliked'] = 'N';
                          }
                        });
                      },
                      child: Padding(
                        padding: EdgeInsets.only(left: 5, right: 5),
                        child: feeds[index]['disliked'] == 'N'
                            ? Icon(FontAwesomeIcons.frown)
                            : Icon(FontAwesomeIcons.solidFrown),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 0, right: 10),
                      child: Text(
                        feeds[index]['liked_count'].toString(),
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5, right: 10),
                      child: Icon(FontAwesomeIcons.commentDots),
                    ),
                    // 
                    GestureDetector(
                      onTap: (){
                        Share.share('https://google.com');
                      },
                      child: Padding(
                      padding: EdgeInsets.only(left: 5, right: 5),
                      child: Icon(Icons.share),
                    ),
                    )
                  ],
                ),
              ),
              Container(
                  padding: EdgeInsets.only(left: 20),
                  height: 30,
                  child: Text(
                    feeds[index]['time'],
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.black54,
                    ),
                    textAlign: TextAlign.start,
                  ))
            ],
          );
        },
      ),
    );
  }

  void _asyncConfirmDialog(int index) async {
    return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button for close dialog!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm?'),
          content: Text(
            'Are you sure to stop following this one?',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          actions: <Widget>[
            OutlineButton(
              child: const Text(
                'YES',
                style: TextStyle(color: Colors.green),
              ),
              onPressed: () {
                setState(() {
                  feeds[index]['following'] = 'N';
                  Toast.show(
                      "You stop following ${feeds[index]['name']}", context,
                      duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
                });
                Navigator.of(context).pop(context);
              }, //callback when button is clicked
              borderSide: BorderSide(
                color: Colors.green, //Color of the border
                style: BorderStyle.solid, //Style of the border
                width: 0.8, //width of the border
              ),
            ),
            FlatButton(
              color: Colors.green,
              child: const Text(
                'NO',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.of(context).pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  void showMoreVert(context) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        elevation: 1,
        isScrollControlled: true,
        context: context,
        builder: (BuildContext bc) {
          return Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15))),
            child: new Wrap(
              children: <Widget>[
                WidgetCustom(),
                new ListTile(
                  leading: new Icon(Icons.link),
                  title: new Text('Copy Link'),
                  onTap: () => {},
                ),
                new ListTile(
                    leading: new Icon(Icons.report),
                    title: new Text('Report'),
                    onTap: () => {}),
              ],
            ),
          );
        });
  }
}

import 'package:flutter/material.dart';

class Post extends StatefulWidget {
  Post({Key key}) : super(key: key);

  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  List bags = [
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
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: GridView.count(
          physics: NeverScrollableScrollPhysics(),
          mainAxisSpacing: 0.0,
          childAspectRatio: 1,
          crossAxisSpacing: 0.0,
          crossAxisCount: 3,
          children: List<Widget>.generate(bags.length, (index) {
            return Container(
              margin: EdgeInsets.all(1),
              child: Image.asset(bags[index]['image1']),
            );
          }),
        ),
      ),
    );
  }
}

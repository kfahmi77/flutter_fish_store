import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proyek_akhir/models/model_ikan.dart';
import 'package:proyek_akhir/pages/detail_product.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Icon _searchIcon = Icon(
    Icons.search,
  );
  bool isSearchClicked = false;
  final TextEditingController _filter = new TextEditingController();

  List<String> itemList = [];

  @override
  void initState() {
    super.initState();
    for (int count = 0; count < 50; count++) {
      itemList.add("Item $count");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxScrolled) {
            return <Widget>[createSilverAppBar()];
          },
          body: GridView.count(
            primary: false,
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            children: listIkan.map((dataList) {
              return InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return DetailProduct(ikan: dataList);
                  }));
                },
                child: Card(
                  child: Column(
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [FavoriteButton()]),
                      Expanded(
                        child: Image.asset(
                          dataList.gambarIkan,
                          fit: BoxFit.fill,
                          width: double.infinity,
                        ),
                      ),
                      SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          dataList.namaIkan,
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
                        child: Text(
                          dataList.harga,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          )),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue[50],
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket_outlined),
            label: 'Keranjang',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Akun',
          ),
        ],
      ),
    );
  }

  SliverAppBar createSilverAppBar() {
    return SliverAppBar(
      actions: <Widget>[
        RawMaterialButton(
          elevation: 0.0,
          child: _searchIcon,
          onPressed: () {
            _searchPressed();
          },
          constraints: BoxConstraints.tightFor(
            width: 56,
            height: 56,
          ),
          shape: CircleBorder(),
        ),
      ],
      expandedHeight: 10,
      floating: true,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.only(bottom: 15),
        centerTitle: true,
        title: isSearchClicked
            ? Container(
                padding: EdgeInsets.only(bottom: 2),
                constraints: BoxConstraints(minHeight: 40, maxHeight: 40),
                width: 220,
                child: CupertinoTextField(
                  controller: _filter,
                  keyboardType: TextInputType.text,
                  placeholder: "Cari",
                  placeholderStyle: TextStyle(
                    color: Color(0xffC4C6CC),
                    fontSize: 14.0,
                    fontFamily: 'Krabby Patty',
                  ),
                  prefix: Padding(
                    padding: const EdgeInsets.fromLTRB(9.0, 6.0, 9.0, 6.0),
                    child: Icon(
                      Icons.search,
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.white,
                  ),
                ),
              )
            : Text(
                'IwakKu',
                style: TextStyle(
                  fontFamily: 'Krabby Patty',
                  fontSize: 50,
                  shadows: <Shadow>[
                    Shadow(
                      offset: Offset(1.0, 1.0),
                      blurRadius: 3.0,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                    Shadow(
                      offset: Offset(1.0, 1.0),
                      blurRadius: 8.0,
                      color: Color.fromARGB(125, 0, 0, 255),
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  void _searchPressed() {
    setState(() {
      if (this._searchIcon.icon == Icons.search) {
        this._searchIcon = Icon(
          Icons.close,
        );
        isSearchClicked = true;
      } else {
        this._searchIcon = Icon(
          Icons.search,
        );
        isSearchClicked = false;
        _filter.clear();
      }
    });
  }
}

class FavoriteButton extends StatefulWidget {
  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: Colors.red,
      ),
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      },
    );
  }
}

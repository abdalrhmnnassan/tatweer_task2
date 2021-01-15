import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:storeaksdk/models/Inventory/ProductModel.dart';
import 'package:storeaksdk/models/Inventory/ProductsPageModel.dart';

import 'package:tast_b/screens/Details/details.dart';

import 'componants/feature_items.dart';
import 'componants/newest_items.dart';
class HomePage extends StatefulWidget {
  final List<Product> dataF;
  final List<Product> data;
  String name;
  @override
  _HomePageState createState() => _HomePageState();

  HomePage({Key key, this.dataF , this.data , this.name}) : super (key:key);
}

class _HomePageState extends State<HomePage> {
  List<PaletteColor> colors;

  Future _paletteColors() async {
    for (int i = 0; i < widget.data.length; i++) {
      String url = widget.data[i].picturePath;
      // PaletteGenerator generator =
      //     await PaletteGenerator.fromImageProvider(NetworkImage(url));
      // colors.add(generator.lightVibrantColor != null
      //     ? generator.lightVibrantColor
      //     : PaletteColor(Colors.grey[200], 1));
    }
    return colors;
  }

  @override
  void initState() {
    // TODO: implement initState
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    super.initState();
    colors = [];
    _paletteColors();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        shrinkWrap: true,
        children: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              FocusScope.of(context).requestFocus(new FocusNode());
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: SafeArea(
                top: true,
                child: Container(
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: IconButton(
                                icon: Icon(Icons.menu),
                              )),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: IconButton(
                              alignment: Alignment.centerRight,
                              icon: Icon(Icons.shopping_cart_outlined)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                  const EdgeInsets.only(left: 20.0, top: 12, bottom: 0),
                  child: Text(
                    'Hi ${widget.name}',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Padding(
                  padding:
                  const EdgeInsets.only(left: 20.0, top: 12, bottom: 8),
                  child: Text(
                    'Find your daily goods',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey[200],
              ),
              child: TextField(
                decoration: InputDecoration(
                  // fillColor: Colors.grey[200],
                  // filled: true,
                  hintText: 'Search here',
                  prefixIcon: Icon(Icons.search),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(16),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left:12.0,right: 12),
            child: Container(
              height: 170,
              child: FutureBuilder(
                future: _paletteColors(),
                builder: (_, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Container(
                        width: 50,
                        height: 50,
                        child: Center(child: CircularProgressIndicator()));
                  } else if (snapshot.hasError) {
                    return Container();
                  } else {
                    return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: widget.dataF.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: (){
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) => Details(data:widget.dataF,index:index,isFut:"f")));

                              },
                              child: Container(
                                child: featureItems(widget.dataF[index]),
                              ),
                            ),
                          );
                        });
                  }
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right:20.0,left:20,),
            child: GridView.builder(
                padding: EdgeInsets.only(top: 0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 8,
                    crossAxisCount: 2,
                    mainAxisSpacing: 8,
                    childAspectRatio: (MediaQuery.of(context).size.width/2)/250
                ),
                shrinkWrap: true,
                itemCount: widget.data.length,
                physics: ScrollPhysics(),
                itemBuilder: (_, int index) {
                  return InkWell(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => Details(data:widget.data,index:index,isFut:"n")));
                    },
                    child: newestItems(widget.data[index]),
                  );
                }),
          ),
        ],
      ),
    );
  }
}

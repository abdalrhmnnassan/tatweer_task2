import 'package:flutter/material.dart';
import 'package:storeaksdk/models/Inventory/ProductModel.dart';
import 'package:tast_b/screens/Cart/cart.dart';


class Details extends StatefulWidget {
  final List<Product> data;
  int index;
  final String isFut;
  @override
  _DetailsState createState() => _DetailsState();
  Details({Key key , this.data , this.index,this.isFut}) : super (key:key);
}
Color _favIconColor = Colors.grey;
int numOfItems = 1;
class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: size.height * 0.3),
              padding: EdgeInsets.only(
                top: size.height * 0.12,
                left: 20.0,
                right: 20.0,
              ),
              // height: 500,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
            ),
            Container(
              height: 200,
              padding: EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(18),
                  bottomRight: Radius.circular(18),
                ),
              ),

            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 50),
                    alignment: Alignment.center,
                    child: Hero(
                      tag: "${widget.isFut}${widget.data[widget.index].picturePath}",
                      child: Image.network(
                        "${widget.data[widget.index].picturePath}",
                        height: 250,
                        width: 250,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    widget.data[widget.index].name.toString(),
                    style: TextStyle(
                        fontSize: 27, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.data[widget.index].subDescription.toString(),
                    style: TextStyle(fontSize: 27),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "${widget.data[widget.index].unitInfo.value} ${ widget.data[widget.index].unitInfo.name}",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        icon: Icon( widget.data[widget.index].isLiked.toString()=="true" ? Icons.favorite:Icons.favorite_outline_rounded ),
                        iconSize: 30,
                        color: widget.data[widget.index].isLiked.toString()=="true" ? Colors.red : Colors.grey,
                       /* color: _favIconColor,
                        onPressed: () {
                          setState(() {
                            if(widget.data[widget.index].isLiked && _favIconColor == Colors.grey){
                              _favIconColor = Colors.red;
                            }else{
                              _favIconColor = Colors.grey;
                            }
                          });
                        },*/
                      ),
                      Text("${widget.data[widget.index].currency.symbol} " " ${widget.data[widget.index].price}" ,style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold), ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("About the product" ,style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  SizedBox(
                    height: 10,
                  ),
                  Text("${widget.data[widget.index].description}",style: TextStyle(color: Colors.grey)),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: <Widget>[
                          buildOutlineButton(
                            icon: Icons.remove,
                            press: () {
                              if (numOfItems > 1) {
                                setState(() {
                                  numOfItems--;
                                });
                              }
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              numOfItems.toString(),
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ),
                          buildOutlineButton(
                              icon: Icons.add,
                              press: () {
                                setState(() {
                                  numOfItems++;
                                });
                              }),
                        ],
                      ),
                      FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)),
                        color: Colors.black,
                        onPressed: () {},
                        child: Text(
                          "Add to cart",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18)),
                    color: Colors.black,
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => cartView()));

                    },
                    child: Text(
                      "To do ",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  // to do button sheet state management
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 35 , left: 10),
              child: buildOutlineButton(
                  icon:Icons.arrow_back_ios_outlined ,
                  colors: Colors.white,
                  press: () {setState(() {
                    Navigator.pop(context);
                  });}),
            ),
          ],
        ),
      ),
    );
  }
  SizedBox buildOutlineButton({IconData icon, Function press , Color colors}) {
    return SizedBox(
      width: 40,
      height: 32,
      child: OutlineButton(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13),
        ),
        onPressed: press,
        child: Icon(icon , color: colors,),
      ),
    );
  }
}


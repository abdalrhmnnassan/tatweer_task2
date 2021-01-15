import 'package:flutter/material.dart';
import 'package:storeaksdk/models/Inventory/ProductModel.dart';

class newestItems extends StatefulWidget {
  final Product data;
  @override
  _newestItemsState createState() => _newestItemsState();

  newestItems(this.data);
}

class _newestItemsState extends State<newestItems> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width:MediaQuery.of(context).size.width/2,
          height: 250,
        ),
        Align(
          alignment:Alignment.bottomCenter,
          child: Container(
            width:(MediaQuery.of(context).size.width/2),
            height: 190,
            decoration:BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top:70,bottom: 8.0,left: 16),
                  child: Container(
                    width: 75,
                    child: Text(
                      '${widget.data.name}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left:16.0),
                  child: Container(
                    width: 75,
                    child: Text(
                      '${widget.data.currency.symbol} ${widget.data.price}',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child:Padding(
            padding: const EdgeInsets.only(bottom:100.0),
            child: Hero(
                tag :"n${widget.data.picturePath}",
                child:
                Image.network("${widget.data.picturePath}",height: 120,)),
          ),
        ),
        ],
    );
  }
}

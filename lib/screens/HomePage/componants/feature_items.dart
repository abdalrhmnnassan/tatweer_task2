import 'package:flutter/material.dart';
import 'package:storeaksdk/models/Inventory/ProductModel.dart';

class featureItems extends StatefulWidget {
  final Product data;
  @override
  _featureItemsState createState() => _featureItemsState();

  featureItems(this.data);
}
class _featureItemsState extends State<featureItems> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 170,
        ),
        Center(
          child: Container(
            height: 145,
            width: 275,
            child: Container(
              width: 60,
              child: Column(
                mainAxisAlignment:
                MainAxisAlignment.center,
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                    const EdgeInsets.all(8.0),
                    child: Text(
                      '${widget.data.name}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.all(8.0),
                    child: Text(
                      '${widget.data.currency.symbol} ${widget.data.price}',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 170,
            ),
            child: Hero(
              tag:"f${widget.data.picturePath}" ,
              child: Container(
                  height: 170,
                  child: Image.network("${widget.data.picturePath.toString()}", fit: BoxFit.cover,)
              ),
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';


class cartView extends StatefulWidget {
  @override
  _cartViewState createState() => _cartViewState();
}

class _cartViewState extends State<cartView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(

        body: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_ios_rounded, color: Colors.white ),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
                SizedBox(height: 10,),
                Text(
                  "Cart",
                  style: TextStyle(
                      fontSize: 35, fontWeight: FontWeight.bold),
                ),

                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount:5,
                    itemBuilder: (context,index){
                      return  Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 65,
                                    height: 65,

                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7),
                                      color: Colors.white,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Image.network("https://www.storeakmedia.com/oldstoreak-test/images/items/238/846/441/67306a15-af5c-4f2b-a82e-b38892933d64_View.png", alignment: Alignment.center,),
                                    ),
                                  ),
                                  SizedBox(width: 10,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Lay\'s' ,style: TextStyle( fontWeight: FontWeight.bold), ),
                                      Text('Lemon & Lime 500ml')
                                    ],),
                                ],
                              ),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text('1x'),
                                  Text('\$2.25',style: TextStyle( fontWeight: FontWeight.bold),)
                                ],),
                            ],
                          ),
                          SizedBox(height: 15,)
                        ],
                      );
                    }),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    color: Colors.grey,
                  ),
                  child: ListTile(
                    leading: Icon(Icons.delivery_dining , size: 50,),
                    title: Text("Our delivery"),
                    subtitle: Text("is always free"),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                ),
                SizedBox(height: 15,),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Total" , style: TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold), ),
                    Text("\$6.25" , style: TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold), ),
                  ],
                ),
                SizedBox(height: 20,),
                Container(
                  child: Material(
                    color: Colors.deepPurple[300],
                    elevation: 6,
                    borderRadius: BorderRadius.circular(30),
                    child: MaterialButton(
                      onPressed: () {
                      },
                      minWidth: (MediaQuery.of(context).size.width),
                      height: 45,
                      child: Text("Checkout" , style: TextStyle(color: Colors.white),),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),/*ListView(
          children: [

            ListView.builder(
              itemCount: 10,
              itemBuilder: (_,snap){
                return ListTile(
                  title: Text("hjjh,"),
                );
              },

            ),
          ],
        )*/
      ),
    );
  }
}

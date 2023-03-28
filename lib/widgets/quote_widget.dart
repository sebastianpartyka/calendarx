import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';

class QuoteWidget extends StatelessWidget {
  var quote = "";
  var author = "";
  QuoteWidget(
  this.quote, this.author, {super.key}
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      width: 380,
      //MediaQuery.of(context).size.width, //cała szerokość ekranu
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
            bottomLeft: Radius.circular(50),
            bottomRight: Radius.circular(50),
          )),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisSize: MainAxisSize.max,
        //  mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 50,
          ),
          Container(
            padding: const EdgeInsets.only(right: 300),
            child: const Image(
              image: AssetImage('assets/images/quote.png'),
              height: 30,
              width: 30,
              color: Colors.white,
              alignment: Alignment.topLeft,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Text(
           quote,
            //'Tell me and I forget. Teach me and I remember. Involve me and I learn.',
            textAlign: TextAlign.center,
            style: GoogleFonts.ubuntu(
                textStyle: const TextStyle(color: Colors.white, fontSize: 20)),
            // style: TextStyle(
            //     fontSize: 20,
            //     color: Colors.white,
            //     // fontFamily: 'Ubuntu-Regular',
            //     fontFamily: 'Ubuntu-Medium',
            //     fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 50,
          ),
          Center(
            child: Text(
              author,
             // 'Benjamin Franklin',
              style: GoogleFonts.ubuntu(
                  textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
            ),
          )
        ],
      ),
    );
  }
}

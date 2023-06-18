import 'package:flutter/material.dart';

class Sukorambi extends StatelessWidget {
  const Sukorambi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        // alignment: Alignment.center,
        children: [
          Container(
            padding: EdgeInsets.only(
                  left: 16.0,
                  right: 16.0,
                ),
            height: kToolbarHeight + MediaQuery.of(context).padding.top + 120.0,
            decoration: BoxDecoration(
              color: Color(0xff19A7CE),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50.0),
                bottomRight: Radius.circular(50.0),
              )
            ),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Padding(padding: EdgeInsets.only(top: 30.0),
                    child: Image.asset(
                      'images/Splash_screen.png',
                      width: 100.0,
                      height: 100.0,
                    ),),
                  ],
                )
              ],
            ),
          ),

          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(margin: EdgeInsets.only(top: 160.0),
                width: 340.0,
                height: 520.0,
                decoration: BoxDecoration(
                  color: Color(0xffB4E9FF),
                  borderRadius: BorderRadius.circular(30.0)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(padding: EdgeInsets.only(top: 30.0),
                    child:  Image.asset('images/sukorambi.png',
                    width: 300.0,
                    height: 140.0,),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(padding: EdgeInsets.only(top: 20.0),
                          child: Title(color: Colors.black, child: Text(
                            'Sukorambi Botanical Garden',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          ),
                          ),
                        ],
                      ),
                    ),
                    Container(child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(padding: EdgeInsets.only(top: 20.0,
                        left: 20.0,right: 20.0),
                        child: Text(
                          'Sukorambi Botanical Garden adalah taman botani yang terletak di Kabupaten Jember, Jawa Timur. Taman ini menawarkan keindahan alam dan berbagai koleksi tumbuhan langka yang dapat menggugah minat pengunjung yang tertarik keanekaragaman hayati. Taman ini cocok untuk keluarga, teman, maupun perorangan yang ingin menikmati keindahan alam dan belajar lebih banyak tentang tumbuhan dan lingkungan sekitar.',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.normal
                          ),
                        ),
                        )
                      ],
                    ),),
                  ],
                ),
                ),
                
              ],
            ),
          ),

          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 760.0),
                  width: 330.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                    color: Color(0xff19A7CE),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  padding: EdgeInsets.only(left: 30.0),
                  child: Material(
                    color: Colors.transparent,
                    child: Ink(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(20.0),
                        onTap: () {
                          // Aksi yang dijalankan saat tombol diklik
                          Navigator.pop(context);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            "Kembali       ",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';

import 'package:dunkcoffeeco/constants/colors.dart';
import 'package:dunkcoffeeco/sections/hero_section.dart';
import 'package:dunkcoffeeco/sections/why_dunk_section.dart';
import 'package:dunkcoffeeco/sections/precision_demanding_section.dart';
import 'package:dunkcoffeeco/sections/social_gallery_section.dart';
import 'package:dunkcoffeeco/sections/footer_section.dart';
import 'package:dunkcoffeeco/sections/full_menu_page.dart';
import 'package:dunkcoffeeco/sections/cold_dessert_section.dart';


void main() {
  runApp(const DunkCoffeeApp());
}


class DunkCoffeeApp extends StatefulWidget {
  const DunkCoffeeApp({super.key});

  @override
  State<DunkCoffeeApp> createState() => _DunkCoffeeAppState();
}


class _DunkCoffeeAppState extends State<DunkCoffeeApp> {

  ThemeMode themeMode = ThemeMode.light;


  void changeTheme() {
    setState(() {
      themeMode = themeMode == ThemeMode.light
          ? ThemeMode.dark
          : ThemeMode.light;
    });
  }


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Dunk Coffee Roasters",

      themeMode: themeMode,

      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: AppColors.lightBg,

        cardColor: Colors.white,

        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.lightBg,
          elevation: 0,
        )
      ),

      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xff121212),

        cardColor: AppColors.darkCard,

        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xff121212),
          elevation: 0,
        )
      ),

      home: DunkMainPage(
        changeTheme: changeTheme,
        themeMode: themeMode,
      ),
    );
  }
}



class DunkMainPage extends StatefulWidget {

  final VoidCallback changeTheme;
  final ThemeMode themeMode;


  const DunkMainPage({
    super.key,
    required this.changeTheme,
    required this.themeMode,
  });


  @override
  State<DunkMainPage> createState() => _DunkMainPageState();

}



class _DunkMainPageState extends State<DunkMainPage> {


  int activePageIndex = 0;


  final ScrollController _scrollController =
      ScrollController();


  final GlobalKey galleryKey = GlobalKey();



  @override
  Widget build(BuildContext context) {


    return Scaffold(


      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),

        child: Container(

          padding: const EdgeInsets.symmetric(
            horizontal: 80,
            vertical: 20,
          ),

          child: Row(

            mainAxisAlignment:
                MainAxisAlignment.spaceBetween,


            children: [


              InkWell(

                onTap: () {
                  setState(() {
                    activePageIndex = 0;
                  });
                },


                child: const Text(
                  "DUNK COFFEE",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryRed,
                  ),
                ),
              ),



              Row(
                children: [


                  _buildNavButton(
                    title: "Ana Sayfa",
                    index: 0,
                  ),


                  _buildNavButton(
                    title: "Menü",
                    index: 1,
                  ),



                  const SizedBox(width: 20),



                  IconButton(

                    onPressed: widget.changeTheme,

                    icon: Icon(
                      widget.themeMode == ThemeMode.light
                          ? Icons.dark_mode
                          : Icons.light_mode,

                      color: AppColors.primaryRed,
                    ),
                  ),



                  const SizedBox(width: 20),



                  ElevatedButton(

                    onPressed: () {

                      showDialog(

                        context: context,

                        builder: (context) {

                          return AlertDialog(

                            title:
                                const Text(
                                  "İletişim Bilgileri",
                                ),


                            content:
                                const Column(

                                  mainAxisSize:
                                      MainAxisSize.min,

                                  children: [

                                    Text(
                                      "📍 Darıca, Kocaeli",
                                    ),

                                    Text(
                                      "📞 +90 555 123 45 67",
                                    ),

                                    Text(
                                      "✉ hello@dunkcoffeeco.com",
                                    ),

                                  ],
                                ),


                          );
                        },
                      );

                    },


                    style:
                        ElevatedButton.styleFrom(

                      backgroundColor:
                          AppColors.primaryRed,

                    ),


                    child:
                        const Text(
                          "BİZE ULAŞIN",
                          style:
                              TextStyle(
                                color: Colors.white,
                              ),
                        ),
                  ),

                ],
              )

            ],
          ),
        ),
      ),




      body:

          activePageIndex == 0

          ? SingleChildScrollView(

              controller:
                  _scrollController,


              child: Column(

                children: [


                  HeroSection(
                    onMenuPressed: () {
                      setState((){
                        activePageIndex = 1;
                      });
                    },
                  ),



                  WhyDunkSection(),


                  ColdDessertSection(),


                  PrecisionDemandingSection(),



                  FooterSection(
  onGalleryPressed: () {
    setState(() {
      activePageIndex = 2;
    });
  },
),


                ],
              ),
            )



          : activePageIndex == 1
              ? const FullMenuPage()
              :SingleChildScrollView(
                child: const SocialGallerySection(),
              ),
  



    );

  }





  Widget _buildNavButton({

    required String title,

    required int index,

  }) {


    bool selected =
        activePageIndex == index;



    return Padding(

      padding:
          const EdgeInsets.symmetric(
            horizontal: 20,
          ),


      child: InkWell(

        onTap: () {

          setState(() {

            activePageIndex =
                index;

          });

        },


        child: Text(

          title,


          style: TextStyle(

            fontSize: 14,


            fontWeight:
                selected
                    ? FontWeight.bold
                    : FontWeight.w500,


            color:
                selected
                    ? AppColors.primaryRed
                    : Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.color,

          ),
        ),
      ),
    );

  }

}
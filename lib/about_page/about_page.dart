import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:md2_tab_indicator/md2_tab_indicator.dart';
import 'package:pokedex/pages/homepage/widgets/status_bar.dart';

import 'package:pokedex/stores/pokeapi_store.dart';
import 'package:provider/provider.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  late final pokemonController = Provider.of<PokeApiStore>(context);
  PageController? _pageController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _pageController = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        bottom: TabBar(
          onTap: (index) {
            setState(() {
              _pageController?.animateToPage(
                index,
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            });
          },
          controller: _tabController,
          labelStyle: TextStyle(
              //up to your taste
              fontWeight: FontWeight.w700),
          indicatorSize: TabBarIndicatorSize.label, //makes it better
          labelColor: pokemonController.getPokemonAtual.typeColor, //Google's sweet blue
          unselectedLabelColor: pokemonController.getPokemonAtual.typeColor, //niceish grey
          isScrollable: true, //up to your taste
          indicator: MD2Indicator(
              //it begins here
              indicatorHeight: 3,
              indicatorColor: pokemonController.getPokemonAtual.typeColor,
              indicatorSize: MD2IndicatorSize.normal //3 different modes tiny-normal-full
              ),
          tabs: <Widget>[
            Tab(
              text: "About",
            ),
            Tab(
              text: "Evolutions",
            ),
            Tab(
              text: "Status",
            ),
          ],
        ),
      ),
      body: PageView(
          onPageChanged: (index) {
            setState(() {
              _tabController.animateTo(index, duration: Duration(milliseconds: 300));
            });
          },
          controller: _pageController,
          children: <Widget>[
            Container(
              color: Colors.transparent,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: ListView(
                  children: [
                    PokemonStatusBar(status: 'Hp', cor: Colors.green, value: 0.8),
                    PokemonStatusBar(status: 'Attack', cor: Colors.red, value: 0.2),
                    PokemonStatusBar(status: 'Sp Attack', cor: Colors.red, value: 0.3),
                    PokemonStatusBar(status: 'Defense', cor: Colors.blue, value: 1),
                    PokemonStatusBar(status: 'Sp Defense', cor: Colors.blue, value: 0.1),
                    PokemonStatusBar(status: 'Speed', cor: Colors.purple, value: 0.9),
                  ],
                ),
                // child: Column(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: <Widget>[
                //     Text(
                //       'Description',
                //       style: TextStyle(
                //         fontSize: 16,
                //         fontWeight: FontWeight.bold,
                //       ),
                //     ),
                //     SizedBox(
                //       height: 10,
                //     ),
                //     Text(
                //       'Sub Description',
                //       style: TextStyle(
                //         fontSize: 14,
                //       ),
                //     ),
                //   ],
                // ),
              ),
            ),
            Container(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Evolutions Path',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Sub Evo Paths',
                        style: TextStyle(fontSize: 14),
                      )
                    ],
                  ),
                ),
                color: Colors.transparent),
            Container(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Status',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Sub Stats',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
                color: Colors.transparent),
          ]),
    );
  }
}

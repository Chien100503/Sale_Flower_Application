import 'package:cannabis/Components/Search_Body.dart';
import 'package:cannabis/TabBarProducts/Accessories.dart';
import 'package:cannabis/TabBarProducts/Edibles.dart';
import 'package:cannabis/TabBarProducts/Extracts.dart';
import 'package:cannabis/TabBarProducts/FlowerTab.dart';
import 'package:cannabis/TabBarProducts/VapesTab.dart';
import 'package:flutter/material.dart';

class VapesPage extends StatefulWidget {
  const VapesPage({Key? key}) : super(key: key);

  @override
  State<VapesPage> createState() => _VapesPageState();
}

class _VapesPageState extends State<VapesPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(

        children: [
          Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Search_Body(),
              Container(
                padding: const EdgeInsets.all(15),
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    Container(
                      width: 375,
                      decoration: const BoxDecoration(
                        color: Colors.white54,
                      ),
                      child: Column(
                        children: [
                          TabBar(
                            physics: ScrollPhysics(),
                            labelColor: Colors.blueGrey,
                            unselectedLabelColor: Colors.black,
                            // indicatorColor: Colors.white,

                            controller: tabController,
                            tabs: const [
                              Tab(
                                child: Text(
                                  'Flower',
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 13),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Tab(
                                child: Text(
                                  'Vapes',
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 13),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Tab(
                                child: Text(
                                  'Extracts',
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 13),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Tab(
                                child: Text(
                                  'Edibles',
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 13),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Tab(
                                child: Text(
                                  'Accessories',
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 13),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Expanded(
                        child: TabBarView(
                      controller: tabController,
                      children: const [
                        Flower(),
                        VapeProducts(),
                        Extracts(),
                        Accessories(),
                        Edibles()
                      ],
                    ))
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

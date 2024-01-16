import 'package:cannabis/Components/Search_Body.dart';
import 'package:cannabis/TabBarProducts/ProductsTab.dart';
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
    tabController = TabController(length: 1, vsync: this);
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
                            labelColor: Colors.white,
                            indicator: BoxDecoration(
                              color: Color(0xff81AA66), // Màu của đường chỉ báo tab được chọn
                            ),
                            controller: tabController,
                            tabs: const [
                              Tab(
                                child: Text(
                                  'Flower',
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18),
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
                        Products(),
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

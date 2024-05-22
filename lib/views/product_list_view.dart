import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../controllers/product_controller.dart'; 

class ProductListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());

    return Scaffold(
      appBar: AppBar(
        title: Text('Produk')
      ),
      body:Obx( () {
          return SmartRefresher(
            controller: controller.refreshController,
            onRefresh:()=>controller.onRefresh(),
            onLoading:()=>controller.onLoading(),
            child: ListView(
              children: [
                  for(var n in controller.list)
                    ListTile(
                      title:Text('${n['kode']} - ${n['nama']}'),
                      subtitle:Text('${n['harga']}')
                    )
              ]
            )
          );
        }
      )
    );
  }
}
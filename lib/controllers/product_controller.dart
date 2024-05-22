
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:http/http.dart' as http;

class ProductController extends GetxController{
  final RefreshController refreshController = RefreshController(initialRefresh:true);
  RxList list = [].obs;
  int _page = 1;

  static const BASE_URL = 'http://172.16.156.44/api';

  Future onRefresh()async{
     await _loadData();
     refreshController.refreshCompleted();
  }

  Future onLoading()async{
     await _loadData();
    refreshController.loadComplete();
  }

  Future _loadData([int page=1])async{
    _page = page;
    final h = http.get( Uri.parse( '$BASE_URL/product' ) );
    print(h);
  }
}
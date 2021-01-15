import 'package:storeaksdk/models/Inventory/Enums/SortType.dart';
import 'package:storeaksdk/models/Inventory/ParametersModel/items_parameters.dart';
import 'package:storeaksdk/models/Inventory/ProductsPageModel.dart';
import 'package:storeaksdk/models/result_classes.dart';
import 'package:storeaksdk/services/StoreakSDKService.dart';
// this function  to get feature items
Future getProductFeature() async{
  ResponseState<ProductsPageModel> data = await StoreakSdkService().inventoryService.itemsService.getItemsPagingMobileDataInfo(ItemsFilterParameters(isFeatured: true),);
  return data;
}
// this function to get Newest items.
Future getProductNewest() async{
  ResponseState<ProductsPageModel> data = await StoreakSdkService().inventoryService.itemsService.getItemsPagingMobileDataInfo(ItemsFilterParameters(sortType: SortType.Newest),);
  return data;
}
// fetch data from api
Future product() async{
  var body = await getProductFeature();// to store feature items
  var body2 = await getProductNewest();// to store Newest items.
  if (body is SuccessState<ProductsPageModel> && body2 is SuccessState<ProductsPageModel> ) {
    var pageModel = body.data;
    var pageModel2 = body2.data;
    return {'bool':true,'result':pageModel,'sortedResult':pageModel2};
  }
}
import 'package:plantly/redux/models/page_view_model.dart';
import 'package:plantly/redux/actions/AddItemAction.dart';
import 'package:plantly/redux/actions/RemoveItemAction.dart';
List<PageViewModel> cartItemsReducer(
    List<PageViewModel> items, dynamic action) {
  if (action is AddItemAction) {
    return addItem(items, action);
  }
  else if(action is RemoveItemAction){

    return removeItem(items,action);

  }
  return items;
}

List<PageViewModel> addItem(List<PageViewModel> items, AddItemAction action) {

  return new List.from(items)..add(action.item);
}

List<PageViewModel> removeItem(List<PageViewModel> items, RemoveItemAction action) {

  return new List.from(items)..removeAt(action.posi);
}

//List<CartItem> toggleItemState(
//    List<CartItem> items, ToggleItemStateAction action) {
//  List<CartItem> itemsNew = items
//      .map((item) =>
//  item.name == action.item.name ? action.item : item)
//      .toList();
//  return itemsNew;
//}

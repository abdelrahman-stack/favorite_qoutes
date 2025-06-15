import 'package:hive/hive.dart';
part 'fav_model.g.dart';
@HiveType(typeId: 0)
class FavModel extends HiveObject {
  @HiveField(0)
   String title;
   @HiveField(1)
     String subTitle;
     

  FavModel(this.title, this.subTitle);

}

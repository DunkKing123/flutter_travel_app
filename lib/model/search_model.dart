import 'package:flutterapp/generated/json/base/json_convert_content.dart';

class SearchModel with JsonConvert<SearchModel> {
	List<SearchModelData> data;
  String keyword;
}

class SearchModelData with JsonConvert<SearchModelData> {
	String code;
	String word;
	String type;
	String districtname;
	String url;
	String price;
	String zonename;
	String star;
}

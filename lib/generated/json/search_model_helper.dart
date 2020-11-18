import 'package:flutterapp/model/search_model.dart';

searchModelFromJson(SearchModel data, Map<String, dynamic> json) {
	if (json['data'] != null) {
		data.data = new List<SearchModelData>();
		(json['data'] as List).forEach((v) {
			data.data.add(new SearchModelData().fromJson(v));
		});
	}
	if (json['keyword'] != null) {
		data.keyword = json['keyword']?.toString();
	}
	return data;
}

Map<String, dynamic> searchModelToJson(SearchModel entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.data != null) {
		data['data'] =  entity.data.map((v) => v.toJson()).toList();
	}
	data['keyword'] = entity.keyword;
	return data;
}

searchModelDataFromJson(SearchModelData data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code']?.toString();
	}
	if (json['word'] != null) {
		data.word = json['word']?.toString();
	}
	if (json['type'] != null) {
		data.type = json['type']?.toString();
	}
	if (json['districtname'] != null) {
		data.districtname = json['districtname']?.toString();
	}
	if (json['url'] != null) {
		data.url = json['url']?.toString();
	}
	if (json['price'] != null) {
		data.price = json['price']?.toString();
	}
	if (json['zonename'] != null) {
		data.zonename = json['zonename']?.toString();
	}
	if (json['star'] != null) {
		data.star = json['star']?.toString();
	}
	return data;
}

Map<String, dynamic> searchModelDataToJson(SearchModelData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['word'] = entity.word;
	data['type'] = entity.type;
	data['districtname'] = entity.districtname;
	data['url'] = entity.url;
	data['price'] = entity.price;
	data['zonename'] = entity.zonename;
	data['star'] = entity.star;
	return data;
}
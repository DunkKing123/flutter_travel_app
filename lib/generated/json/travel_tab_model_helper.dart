import 'package:flutterapp/model/travel_tab_model.dart';

travelTabModelFromJson(TravelTabModel data, Map<String, dynamic> json) {
	if (json['url'] != null) {
		data.url = json['url']?.toString();
	}
	if (json['params'] != null) {
		data.params = new TravelTabModelParams().fromJson(json['params']);
	}
	if (json['tabs'] != null) {
		data.tabs = new List<TravelTabModelTab>();
		(json['tabs'] as List).forEach((v) {
			data.tabs.add(new TravelTabModelTab().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> travelTabModelToJson(TravelTabModel entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['url'] = entity.url;
	if (entity.params != null) {
		data['params'] = entity.params.toJson();
	}
	if (entity.tabs != null) {
		data['tabs'] =  entity.tabs.map((v) => v.toJson()).toList();
	}
	return data;
}

travelTabModelParamsFromJson(TravelTabModelParams data, Map<String, dynamic> json) {
	if (json['districtId'] != null) {
		data.districtId = json['districtId']?.toInt();
	}
	if (json['groupChannelCode'] != null) {
		data.groupChannelCode = json['groupChannelCode']?.toString();
	}
	if (json['type'] != null) {
		data.type = json['type'];
	}
	if (json['lat'] != null) {
		data.lat = json['lat']?.toInt();
	}
	if (json['lon'] != null) {
		data.lon = json['lon']?.toInt();
	}
	if (json['locatedDistrictId'] != null) {
		data.locatedDistrictId = json['locatedDistrictId']?.toInt();
	}
	if (json['pagePara'] != null) {
		data.pagePara = new TravelTabModelParamsPagePara().fromJson(json['pagePara']);
	}
	if (json['imageCutType'] != null) {
		data.imageCutType = json['imageCutType']?.toInt();
	}
	if (json['head'] != null) {
		data.head = new TravelTabModelParamsHead().fromJson(json['head']);
	}
	if (json['contentType'] != null) {
		data.contentType = json['contentType']?.toString();
	}
	return data;
}

Map<String, dynamic> travelTabModelParamsToJson(TravelTabModelParams entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['districtId'] = entity.districtId;
	data['groupChannelCode'] = entity.groupChannelCode;
	data['type'] = entity.type;
	data['lat'] = entity.lat;
	data['lon'] = entity.lon;
	data['locatedDistrictId'] = entity.locatedDistrictId;
	if (entity.pagePara != null) {
		data['pagePara'] = entity.pagePara.toJson();
	}
	data['imageCutType'] = entity.imageCutType;
	if (entity.head != null) {
		data['head'] = entity.head.toJson();
	}
	data['contentType'] = entity.contentType;
	return data;
}

travelTabModelParamsPageParaFromJson(TravelTabModelParamsPagePara data, Map<String, dynamic> json) {
	if (json['pageIndex'] != null) {
		data.pageIndex = json['pageIndex']?.toInt();
	}
	if (json['pageSize'] != null) {
		data.pageSize = json['pageSize']?.toInt();
	}
	if (json['sortType'] != null) {
		data.sortType = json['sortType']?.toInt();
	}
	if (json['sortDirection'] != null) {
		data.sortDirection = json['sortDirection']?.toInt();
	}
	return data;
}

Map<String, dynamic> travelTabModelParamsPageParaToJson(TravelTabModelParamsPagePara entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['pageIndex'] = entity.pageIndex;
	data['pageSize'] = entity.pageSize;
	data['sortType'] = entity.sortType;
	data['sortDirection'] = entity.sortDirection;
	return data;
}

travelTabModelParamsHeadFromJson(TravelTabModelParamsHead data, Map<String, dynamic> json) {
	if (json['cid'] != null) {
		data.cid = json['cid']?.toString();
	}
	if (json['ctok'] != null) {
		data.ctok = json['ctok']?.toString();
	}
	if (json['cver'] != null) {
		data.cver = json['cver']?.toString();
	}
	if (json['lang'] != null) {
		data.lang = json['lang']?.toString();
	}
	if (json['sid'] != null) {
		data.sid = json['sid']?.toString();
	}
	if (json['syscode'] != null) {
		data.syscode = json['syscode']?.toString();
	}
	if (json['auth'] != null) {
		data.auth = json['auth'];
	}
	if (json['extension'] != null) {
		data.extension = new List<TravelTabModelParamsHeadExtension>();
		(json['extension'] as List).forEach((v) {
			data.extension.add(new TravelTabModelParamsHeadExtension().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> travelTabModelParamsHeadToJson(TravelTabModelParamsHead entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['cid'] = entity.cid;
	data['ctok'] = entity.ctok;
	data['cver'] = entity.cver;
	data['lang'] = entity.lang;
	data['sid'] = entity.sid;
	data['syscode'] = entity.syscode;
	data['auth'] = entity.auth;
	if (entity.extension != null) {
		data['extension'] =  entity.extension.map((v) => v.toJson()).toList();
	}
	return data;
}

travelTabModelParamsHeadExtensionFromJson(TravelTabModelParamsHeadExtension data, Map<String, dynamic> json) {
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['value'] != null) {
		data.value = json['value']?.toString();
	}
	return data;
}

Map<String, dynamic> travelTabModelParamsHeadExtensionToJson(TravelTabModelParamsHeadExtension entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['name'] = entity.name;
	data['value'] = entity.value;
	return data;
}

travelTabModelTabFromJson(TravelTabModelTab data, Map<String, dynamic> json) {
	if (json['labelName'] != null) {
		data.labelName = json['labelName']?.toString();
	}
	if (json['groupChannelCode'] != null) {
		data.groupChannelCode = json['groupChannelCode']?.toString();
	}
	return data;
}

Map<String, dynamic> travelTabModelTabToJson(TravelTabModelTab entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['labelName'] = entity.labelName;
	data['groupChannelCode'] = entity.groupChannelCode;
	return data;
}
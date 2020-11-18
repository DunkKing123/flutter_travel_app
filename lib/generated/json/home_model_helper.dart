import 'package:flutterapp/model/home_model.dart';

homeModelFromJson(HomeModel data, Map<String, dynamic> json) {
	if (json['config'] != null) {
		data.config = new HomeModelConfig().fromJson(json['config']);
	}
	if (json['bannerList'] != null) {
		data.bannerList = new List<HomeModelBannerList>();
		(json['bannerList'] as List).forEach((v) {
			data.bannerList.add(new HomeModelBannerList().fromJson(v));
		});
	}
	if (json['localNavList'] != null) {
		data.localNavList = new List<HomeModelLocalNavList>();
		(json['localNavList'] as List).forEach((v) {
			data.localNavList.add(new HomeModelLocalNavList().fromJson(v));
		});
	}
	if (json['gridNav'] != null) {
		data.gridNav = new HomeModelGridNav().fromJson(json['gridNav']);
	}
	if (json['subNavList'] != null) {
		data.subNavList = new List<HomeModelSubNavList>();
		(json['subNavList'] as List).forEach((v) {
			data.subNavList.add(new HomeModelSubNavList().fromJson(v));
		});
	}
	if (json['salesBox'] != null) {
		data.salesBox = new HomeModelSalesBox().fromJson(json['salesBox']);
	}
	return data;
}

Map<String, dynamic> homeModelToJson(HomeModel entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.config != null) {
		data['config'] = entity.config.toJson();
	}
	if (entity.bannerList != null) {
		data['bannerList'] =  entity.bannerList.map((v) => v.toJson()).toList();
	}
	if (entity.localNavList != null) {
		data['localNavList'] =  entity.localNavList.map((v) => v.toJson()).toList();
	}
	if (entity.gridNav != null) {
		data['gridNav'] = entity.gridNav.toJson();
	}
	if (entity.subNavList != null) {
		data['subNavList'] =  entity.subNavList.map((v) => v.toJson()).toList();
	}
	if (entity.salesBox != null) {
		data['salesBox'] = entity.salesBox.toJson();
	}
	return data;
}

homeModelConfigFromJson(HomeModelConfig data, Map<String, dynamic> json) {
	if (json['searchUrl'] != null) {
		data.searchUrl = json['searchUrl']?.toString();
	}
	return data;
}

Map<String, dynamic> homeModelConfigToJson(HomeModelConfig entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['searchUrl'] = entity.searchUrl;
	return data;
}

homeModelBannerListFromJson(HomeModelBannerList data, Map<String, dynamic> json) {
	if (json['icon'] != null) {
		data.icon = json['icon']?.toString();
	}
	if (json['url'] != null) {
		data.url = json['url']?.toString();
	}
	return data;
}

Map<String, dynamic> homeModelBannerListToJson(HomeModelBannerList entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['icon'] = entity.icon;
	data['url'] = entity.url;
	return data;
}

homeModelLocalNavListFromJson(HomeModelLocalNavList data, Map<String, dynamic> json) {
	if (json['icon'] != null) {
		data.icon = json['icon']?.toString();
	}
	if (json['title'] != null) {
		data.title = json['title']?.toString();
	}
	if (json['url'] != null) {
		data.url = json['url']?.toString();
	}
	if (json['statusBarColor'] != null) {
		data.statusBarColor = json['statusBarColor']?.toString();
	}
	if (json['hideAppBar'] != null) {
		data.hideAppBar = json['hideAppBar'];
	}
	return data;
}

Map<String, dynamic> homeModelLocalNavListToJson(HomeModelLocalNavList entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['icon'] = entity.icon;
	data['title'] = entity.title;
	data['url'] = entity.url;
	data['statusBarColor'] = entity.statusBarColor;
	data['hideAppBar'] = entity.hideAppBar;
	return data;
}

homeModelGridNavFromJson(HomeModelGridNav data, Map<String, dynamic> json) {
	if (json['hotel'] != null) {
		data.hotel = new GridNavItem().fromJson(json['hotel']);
	}
	if (json['flight'] != null) {
		data.flight = new GridNavItem().fromJson(json['flight']);
	}
	if (json['travel'] != null) {
		data.travel = new GridNavItem().fromJson(json['travel']);
	}
	return data;
}

Map<String, dynamic> homeModelGridNavToJson(HomeModelGridNav entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.hotel != null) {
		data['hotel'] = entity.hotel.toJson();
	}
	if (entity.flight != null) {
		data['flight'] = entity.flight.toJson();
	}
	if (entity.travel != null) {
		data['travel'] = entity.travel.toJson();
	}
	return data;
}

gridNavItemFromJson(GridNavItem data, Map<String, dynamic> json) {
	if (json['startColor'] != null) {
		data.startColor = json['startColor']?.toString();
	}
	if (json['endColor'] != null) {
		data.endColor = json['endColor']?.toString();
	}
	if (json['mainItem'] != null) {
		data.mainItem = new HomeModelGridNavMainItem().fromJson(json['mainItem']);
	}
	if (json['item1'] != null) {
		data.item1 = new HomeModelGridNavItem().fromJson(json['item1']);
	}
	if (json['item2'] != null) {
		data.item2 = new HomeModelGridNavItem().fromJson(json['item2']);
	}
	if (json['item3'] != null) {
		data.item3 = new HomeModelGridNavItem().fromJson(json['item3']);
	}
	if (json['item4'] != null) {
		data.item4 = new HomeModelGridNavItem().fromJson(json['item4']);
	}
	return data;
}

Map<String, dynamic> gridNavItemToJson(GridNavItem entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['startColor'] = entity.startColor;
	data['endColor'] = entity.endColor;
	if (entity.mainItem != null) {
		data['mainItem'] = entity.mainItem.toJson();
	}
	if (entity.item1 != null) {
		data['item1'] = entity.item1.toJson();
	}
	if (entity.item2 != null) {
		data['item2'] = entity.item2.toJson();
	}
	if (entity.item3 != null) {
		data['item3'] = entity.item3.toJson();
	}
	if (entity.item4 != null) {
		data['item4'] = entity.item4.toJson();
	}
	return data;
}

homeModelGridNavMainItemFromJson(HomeModelGridNavMainItem data, Map<String, dynamic> json) {
	if (json['title'] != null) {
		data.title = json['title']?.toString();
	}
	if (json['icon'] != null) {
		data.icon = json['icon']?.toString();
	}
	if (json['url'] != null) {
		data.url = json['url']?.toString();
	}
	if (json['statusBarColor'] != null) {
		data.statusBarColor = json['statusBarColor']?.toString();
	}
	return data;
}

Map<String, dynamic> homeModelGridNavMainItemToJson(HomeModelGridNavMainItem entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['title'] = entity.title;
	data['icon'] = entity.icon;
	data['url'] = entity.url;
	data['statusBarColor'] = entity.statusBarColor;
	return data;
}

homeModelGridNavItemFromJson(HomeModelGridNavItem data, Map<String, dynamic> json) {
	if (json['title'] != null) {
		data.title = json['title']?.toString();
	}
	if (json['url'] != null) {
		data.url = json['url']?.toString();
	}
	if (json['statusBarColor'] != null) {
		data.statusBarColor = json['statusBarColor']?.toString();
	}
	if (json['hideAppBar'] != null) {
		data.hideAppBar = json['hideAppBar'];
	}
	return data;
}

Map<String, dynamic> homeModelGridNavItemToJson(HomeModelGridNavItem entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['title'] = entity.title;
	data['url'] = entity.url;
	data['statusBarColor'] = entity.statusBarColor;
	data['hideAppBar'] = entity.hideAppBar;
	return data;
}

homeModelSubNavListFromJson(HomeModelSubNavList data, Map<String, dynamic> json) {
	if (json['icon'] != null) {
		data.icon = json['icon']?.toString();
	}
	if (json['title'] != null) {
		data.title = json['title']?.toString();
	}
	if (json['url'] != null) {
		data.url = json['url']?.toString();
	}
	if (json['hideAppBar'] != null) {
		data.hideAppBar = json['hideAppBar'];
	}
	return data;
}

Map<String, dynamic> homeModelSubNavListToJson(HomeModelSubNavList entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['icon'] = entity.icon;
	data['title'] = entity.title;
	data['url'] = entity.url;
	data['hideAppBar'] = entity.hideAppBar;
	return data;
}

homeModelSalesBoxFromJson(HomeModelSalesBox data, Map<String, dynamic> json) {
	if (json['icon'] != null) {
		data.icon = json['icon']?.toString();
	}
	if (json['moreUrl'] != null) {
		data.moreUrl = json['moreUrl']?.toString();
	}
	if (json['bigCard1'] != null) {
		data.bigCard1 = new HomeModelSalesBoxCard().fromJson(json['bigCard1']);
	}
	if (json['bigCard2'] != null) {
		data.bigCard2 = new HomeModelSalesBoxCard().fromJson(json['bigCard2']);
	}
	if (json['smallCard1'] != null) {
		data.smallCard1 = new HomeModelSalesBoxCard().fromJson(json['smallCard1']);
	}
	if (json['smallCard2'] != null) {
		data.smallCard2 = new HomeModelSalesBoxCard().fromJson(json['smallCard2']);
	}
	if (json['smallCard3'] != null) {
		data.smallCard3 = new HomeModelSalesBoxCard().fromJson(json['smallCard3']);
	}
	if (json['smallCard4'] != null) {
		data.smallCard4 = new HomeModelSalesBoxCard().fromJson(json['smallCard4']);
	}
	return data;
}

Map<String, dynamic> homeModelSalesBoxToJson(HomeModelSalesBox entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['icon'] = entity.icon;
	data['moreUrl'] = entity.moreUrl;
	if (entity.bigCard1 != null) {
		data['bigCard1'] = entity.bigCard1.toJson();
	}
	if (entity.bigCard2 != null) {
		data['bigCard2'] = entity.bigCard2.toJson();
	}
	if (entity.smallCard1 != null) {
		data['smallCard1'] = entity.smallCard1.toJson();
	}
	if (entity.smallCard2 != null) {
		data['smallCard2'] = entity.smallCard2.toJson();
	}
	if (entity.smallCard3 != null) {
		data['smallCard3'] = entity.smallCard3.toJson();
	}
	if (entity.smallCard4 != null) {
		data['smallCard4'] = entity.smallCard4.toJson();
	}
	return data;
}

homeModelSalesBoxCardFromJson(HomeModelSalesBoxCard data, Map<String, dynamic> json) {
	if (json['icon'] != null) {
		data.icon = json['icon']?.toString();
	}
	if (json['url'] != null) {
		data.url = json['url']?.toString();
	}
	if (json['title'] != null) {
		data.title = json['title']?.toString();
	}
	return data;
}

Map<String, dynamic> homeModelSalesBoxCardToJson(HomeModelSalesBoxCard entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['icon'] = entity.icon;
	data['url'] = entity.url;
	data['title'] = entity.title;
	return data;
}
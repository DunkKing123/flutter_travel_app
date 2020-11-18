import 'package:flutterapp/model/travel_model.dart';

travelModelFromJson(TravelModel data, Map<String, dynamic> json) {
	if (json['ResponseStatus'] != null) {
		data.responseStatus = new TravelModelResponseStatus().fromJson(json['ResponseStatus']);
	}
	if (json['totalCount'] != null) {
		data.totalCount = json['totalCount']?.toInt();
	}
	if (json['resultList'] != null) {
		data.resultList = new List<TravelItem>();
		(json['resultList'] as List).forEach((v) {
			data.resultList.add(new TravelItem().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> travelModelToJson(TravelModel entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.responseStatus != null) {
		data['ResponseStatus'] = entity.responseStatus.toJson();
	}
	data['totalCount'] = entity.totalCount;
	if (entity.resultList != null) {
		data['resultList'] =  entity.resultList.map((v) => v.toJson()).toList();
	}
	return data;
}

travelModelResponseStatusFromJson(TravelModelResponseStatus data, Map<String, dynamic> json) {
	if (json['Timestamp'] != null) {
		data.timestamp = json['Timestamp']?.toString();
	}
	if (json['Ack'] != null) {
		data.ack = json['Ack']?.toString();
	}
	if (json['Errors'] != null) {
		data.errors = new List<dynamic>();
		data.errors.addAll(json['Errors']);
	}
	if (json['Extension'] != null) {
		data.extension = new List<TravelModelResponseStatusExtension>();
		(json['Extension'] as List).forEach((v) {
			data.extension.add(new TravelModelResponseStatusExtension().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> travelModelResponseStatusToJson(TravelModelResponseStatus entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['Timestamp'] = entity.timestamp;
	data['Ack'] = entity.ack;
	if (entity.errors != null) {
		data['Errors'] =  [];
	}
	if (entity.extension != null) {
		data['Extension'] =  entity.extension.map((v) => v.toJson()).toList();
	}
	return data;
}

travelModelResponseStatusExtensionFromJson(TravelModelResponseStatusExtension data, Map<String, dynamic> json) {
	if (json['Id'] != null) {
		data.id = json['Id']?.toString();
	}
	if (json['Value'] != null) {
		data.value = json['Value']?.toString();
	}
	return data;
}

Map<String, dynamic> travelModelResponseStatusExtensionToJson(TravelModelResponseStatusExtension entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['Id'] = entity.id;
	data['Value'] = entity.value;
	return data;
}

travelItemFromJson(TravelItem data, Map<String, dynamic> json) {
	if (json['type'] != null) {
		data.type = json['type']?.toInt();
	}
	if (json['article'] != null) {
		data.article = new TravelModelResultListArticle().fromJson(json['article']);
	}
	if (json['advert'] != null) {
		data.advert = new TravelModelResultListAdvert().fromJson(json['advert']);
	}
	if (json['poi'] != null) {
		data.poi = new TravelModelResultListPoi().fromJson(json['poi']);
	}
	return data;
}

Map<String, dynamic> travelItemToJson(TravelItem entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['type'] = entity.type;
	if (entity.article != null) {
		data['article'] = entity.article.toJson();
	}
	if (entity.advert != null) {
		data['advert'] = entity.advert.toJson();
	}
	if (entity.poi != null) {
		data['poi'] = entity.poi.toJson();
	}
	return data;
}

travelModelResultListArticleFromJson(TravelModelResultListArticle data, Map<String, dynamic> json) {
	if (json['articleId'] != null) {
		data.articleId = json['articleId']?.toInt();
	}
	if (json['articleType'] != null) {
		data.articleType = json['articleType']?.toString();
	}
	if (json['productType'] != null) {
		data.productType = json['productType']?.toInt();
	}
	if (json['sourceType'] != null) {
		data.sourceType = json['sourceType']?.toInt();
	}
	if (json['articleTitle'] != null) {
		data.articleTitle = json['articleTitle']?.toString();
	}
	if (json['author'] != null) {
		data.author = new TravelModelResultListArticleAuthor().fromJson(json['author']);
	}
	if (json['images'] != null) {
		data.images = new List<TravelModelResultListArticleImage>();
		(json['images'] as List).forEach((v) {
			data.images.add(new TravelModelResultListArticleImage().fromJson(v));
		});
	}
	if (json['hasVideo'] != null) {
		data.hasVideo = json['hasVideo'];
	}
	if (json['readCount'] != null) {
		data.readCount = json['readCount']?.toInt();
	}
	if (json['likeCount'] != null) {
		data.likeCount = json['likeCount']?.toInt();
	}
	if (json['commentCount'] != null) {
		data.commentCount = json['commentCount']?.toInt();
	}
	if (json['urls'] != null) {
		data.urls = new List<TravelModelResultListArticleUrl>();
		(json['urls'] as List).forEach((v) {
			data.urls.add(new TravelModelResultListArticleUrl().fromJson(v));
		});
	}
	if (json['tags'] != null) {
		data.tags = new List<dynamic>();
		data.tags.addAll(json['tags']);
	}
	if (json['topics'] != null) {
		data.topics = new List<TravelModelResultListArticleTopic>();
		(json['topics'] as List).forEach((v) {
			data.topics.add(new TravelModelResultListArticleTopic().fromJson(v));
		});
	}
	if (json['pois'] != null) {
		data.pois = new List<TravelModelResultListArticlePoi>();
		(json['pois'] as List).forEach((v) {
			data.pois.add(new TravelModelResultListArticlePoi().fromJson(v));
		});
	}
	if (json['publishTime'] != null) {
		data.publishTime = json['publishTime']?.toString();
	}
	if (json['publishTimeDisplay'] != null) {
		data.publishTimeDisplay = json['publishTimeDisplay']?.toString();
	}
	if (json['shootTime'] != null) {
		data.shootTime = json['shootTime']?.toString();
	}
	if (json['shootTimeDisplay'] != null) {
		data.shootTimeDisplay = json['shootTimeDisplay']?.toString();
	}
	if (json['level'] != null) {
		data.level = json['level']?.toInt();
	}
	if (json['distanceText'] != null) {
		data.distanceText = json['distanceText']?.toString();
	}
	if (json['isLike'] != null) {
		data.isLike = json['isLike'];
	}
	if (json['imageCounts'] != null) {
		data.imageCounts = json['imageCounts']?.toInt();
	}
	if (json['isCollected'] != null) {
		data.isCollected = json['isCollected'];
	}
	if (json['collectCount'] != null) {
		data.collectCount = json['collectCount']?.toInt();
	}
	if (json['articleStatus'] != null) {
		data.articleStatus = json['articleStatus']?.toInt();
	}
	if (json['poiName'] != null) {
		data.poiName = json['poiName']?.toString();
	}
	return data;
}

Map<String, dynamic> travelModelResultListArticleToJson(TravelModelResultListArticle entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['articleId'] = entity.articleId;
	data['articleType'] = entity.articleType;
	data['productType'] = entity.productType;
	data['sourceType'] = entity.sourceType;
	data['articleTitle'] = entity.articleTitle;
	if (entity.author != null) {
		data['author'] = entity.author.toJson();
	}
	if (entity.images != null) {
		data['images'] =  entity.images.map((v) => v.toJson()).toList();
	}
	data['hasVideo'] = entity.hasVideo;
	data['readCount'] = entity.readCount;
	data['likeCount'] = entity.likeCount;
	data['commentCount'] = entity.commentCount;
	if (entity.urls != null) {
		data['urls'] =  entity.urls.map((v) => v.toJson()).toList();
	}
	if (entity.tags != null) {
		data['tags'] =  [];
	}
	if (entity.topics != null) {
		data['topics'] =  entity.topics.map((v) => v.toJson()).toList();
	}
	if (entity.pois != null) {
		data['pois'] =  entity.pois.map((v) => v.toJson()).toList();
	}
	data['publishTime'] = entity.publishTime;
	data['publishTimeDisplay'] = entity.publishTimeDisplay;
	data['shootTime'] = entity.shootTime;
	data['shootTimeDisplay'] = entity.shootTimeDisplay;
	data['level'] = entity.level;
	data['distanceText'] = entity.distanceText;
	data['isLike'] = entity.isLike;
	data['imageCounts'] = entity.imageCounts;
	data['isCollected'] = entity.isCollected;
	data['collectCount'] = entity.collectCount;
	data['articleStatus'] = entity.articleStatus;
	data['poiName'] = entity.poiName;
	return data;
}

travelModelResultListArticleAuthorFromJson(TravelModelResultListArticleAuthor data, Map<String, dynamic> json) {
	if (json['authorId'] != null) {
		data.authorId = json['authorId']?.toInt();
	}
	if (json['nickName'] != null) {
		data.nickName = json['nickName']?.toString();
	}
	if (json['clientAuth'] != null) {
		data.clientAuth = json['clientAuth']?.toString();
	}
	if (json['jumpUrl'] != null) {
		data.jumpUrl = json['jumpUrl']?.toString();
	}
	if (json['coverImage'] != null) {
		data.coverImage = new TravelModelResultListArticleAuthorCoverImage().fromJson(json['coverImage']);
	}
	if (json['identityType'] != null) {
		data.identityType = json['identityType']?.toInt();
	}
	if (json['tag'] != null) {
		data.tag = json['tag']?.toString();
	}
	return data;
}

Map<String, dynamic> travelModelResultListArticleAuthorToJson(TravelModelResultListArticleAuthor entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['authorId'] = entity.authorId;
	data['nickName'] = entity.nickName;
	data['clientAuth'] = entity.clientAuth;
	data['jumpUrl'] = entity.jumpUrl;
	if (entity.coverImage != null) {
		data['coverImage'] = entity.coverImage.toJson();
	}
	data['identityType'] = entity.identityType;
	data['tag'] = entity.tag;
	return data;
}

travelModelResultListArticleAuthorCoverImageFromJson(TravelModelResultListArticleAuthorCoverImage data, Map<String, dynamic> json) {
	if (json['dynamicUrl'] != null) {
		data.dynamicUrl = json['dynamicUrl']?.toString();
	}
	if (json['originalUrl'] != null) {
		data.originalUrl = json['originalUrl']?.toString();
	}
	return data;
}

Map<String, dynamic> travelModelResultListArticleAuthorCoverImageToJson(TravelModelResultListArticleAuthorCoverImage entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['dynamicUrl'] = entity.dynamicUrl;
	data['originalUrl'] = entity.originalUrl;
	return data;
}

travelModelResultListArticleImageFromJson(TravelModelResultListArticleImage data, Map<String, dynamic> json) {
	if (json['imageId'] != null) {
		data.imageId = json['imageId']?.toInt();
	}
	if (json['dynamicUrl'] != null) {
		data.dynamicUrl = json['dynamicUrl']?.toString();
	}
	if (json['originalUrl'] != null) {
		data.originalUrl = json['originalUrl']?.toString();
	}
	if (json['width'] != null) {
		data.width = json['width']?.toInt();
	}
	if (json['height'] != null) {
		data.height = json['height']?.toInt();
	}
	if (json['mediaType'] != null) {
		data.mediaType = json['mediaType']?.toInt();
	}
	if (json['isWaterMarked'] != null) {
		data.isWaterMarked = json['isWaterMarked'];
	}
	return data;
}

Map<String, dynamic> travelModelResultListArticleImageToJson(TravelModelResultListArticleImage entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['imageId'] = entity.imageId;
	data['dynamicUrl'] = entity.dynamicUrl;
	data['originalUrl'] = entity.originalUrl;
	data['width'] = entity.width;
	data['height'] = entity.height;
	data['mediaType'] = entity.mediaType;
	data['isWaterMarked'] = entity.isWaterMarked;
	return data;
}

travelModelResultListArticleUrlFromJson(TravelModelResultListArticleUrl data, Map<String, dynamic> json) {
	if (json['version'] != null) {
		data.version = json['version']?.toString();
	}
	if (json['appUrl'] != null) {
		data.appUrl = json['appUrl']?.toString();
	}
	if (json['h5Url'] != null) {
		data.h5Url = json['h5Url']?.toString();
	}
	if (json['wxUrl'] != null) {
		data.wxUrl = json['wxUrl']?.toString();
	}
	return data;
}

Map<String, dynamic> travelModelResultListArticleUrlToJson(TravelModelResultListArticleUrl entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['version'] = entity.version;
	data['appUrl'] = entity.appUrl;
	data['h5Url'] = entity.h5Url;
	data['wxUrl'] = entity.wxUrl;
	return data;
}

travelModelResultListArticleTopicFromJson(TravelModelResultListArticleTopic data, Map<String, dynamic> json) {
	if (json['topicId'] != null) {
		data.topicId = json['topicId']?.toInt();
	}
	if (json['topicName'] != null) {
		data.topicName = json['topicName']?.toString();
	}
	if (json['level'] != null) {
		data.level = json['level']?.toInt();
	}
	return data;
}

Map<String, dynamic> travelModelResultListArticleTopicToJson(TravelModelResultListArticleTopic entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['topicId'] = entity.topicId;
	data['topicName'] = entity.topicName;
	data['level'] = entity.level;
	return data;
}

travelModelResultListArticlePoiFromJson(TravelModelResultListArticlePoi data, Map<String, dynamic> json) {
	if (json['poiType'] != null) {
		data.poiType = json['poiType']?.toInt();
	}
	if (json['poiId'] != null) {
		data.poiId = json['poiId']?.toInt();
	}
	if (json['poiName'] != null) {
		data.poiName = json['poiName']?.toString();
	}
	if (json['businessId'] != null) {
		data.businessId = json['businessId']?.toInt();
	}
	if (json['districtId'] != null) {
		data.districtId = json['districtId']?.toInt();
	}
	if (json['poiExt'] != null) {
		data.poiExt = new TravelModelResultListArticlePoisPoiExt().fromJson(json['poiExt']);
	}
	if (json['source'] != null) {
		data.source = json['source']?.toInt();
	}
	if (json['isMain'] != null) {
		data.isMain = json['isMain']?.toInt();
	}
	if (json['isInChina'] != null) {
		data.isInChina = json['isInChina'];
	}
	if (json['countryName'] != null) {
		data.countryName = json['countryName']?.toString();
	}
	if (json['districtName'] != null) {
		data.districtName = json['districtName']?.toString();
	}
	if (json['districtENName'] != null) {
		data.districtENName = json['districtENName']?.toString();
	}
	return data;
}

Map<String, dynamic> travelModelResultListArticlePoiToJson(TravelModelResultListArticlePoi entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['poiType'] = entity.poiType;
	data['poiId'] = entity.poiId;
	data['poiName'] = entity.poiName;
	data['businessId'] = entity.businessId;
	data['districtId'] = entity.districtId;
	if (entity.poiExt != null) {
		data['poiExt'] = entity.poiExt.toJson();
	}
	data['source'] = entity.source;
	data['isMain'] = entity.isMain;
	data['isInChina'] = entity.isInChina;
	data['countryName'] = entity.countryName;
	data['districtName'] = entity.districtName;
	data['districtENName'] = entity.districtENName;
	return data;
}

travelModelResultListArticlePoisPoiExtFromJson(TravelModelResultListArticlePoisPoiExt data, Map<String, dynamic> json) {
	if (json['h5Url'] != null) {
		data.h5Url = json['h5Url']?.toString();
	}
	if (json['appUrl'] != null) {
		data.appUrl = json['appUrl']?.toString();
	}
	return data;
}

Map<String, dynamic> travelModelResultListArticlePoisPoiExtToJson(TravelModelResultListArticlePoisPoiExt entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['h5Url'] = entity.h5Url;
	data['appUrl'] = entity.appUrl;
	return data;
}

travelModelResultListAdvertFromJson(TravelModelResultListAdvert data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['moduleId'] != null) {
		data.moduleId = json['moduleId']?.toInt();
	}
	if (json['appUrl'] != null) {
		data.appUrl = json['appUrl']?.toString();
	}
	if (json['h5Url'] != null) {
		data.h5Url = json['h5Url']?.toString();
	}
	if (json['wxUrl'] != null) {
		data.wxUrl = json['wxUrl']?.toString();
	}
	if (json['imageUrl'] != null) {
		data.imageUrl = json['imageUrl']?.toString();
	}
	if (json['width'] != null) {
		data.width = json['width']?.toInt();
	}
	if (json['height'] != null) {
		data.height = json['height']?.toInt();
	}
	return data;
}

Map<String, dynamic> travelModelResultListAdvertToJson(TravelModelResultListAdvert entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['moduleId'] = entity.moduleId;
	data['appUrl'] = entity.appUrl;
	data['h5Url'] = entity.h5Url;
	data['wxUrl'] = entity.wxUrl;
	data['imageUrl'] = entity.imageUrl;
	data['width'] = entity.width;
	data['height'] = entity.height;
	return data;
}

travelModelResultListPoiFromJson(TravelModelResultListPoi data, Map<String, dynamic> json) {
	if (json['poiType'] != null) {
		data.poiType = json['poiType']?.toInt();
	}
	if (json['poiId'] != null) {
		data.poiId = json['poiId']?.toInt();
	}
	if (json['poiName'] != null) {
		data.poiName = json['poiName']?.toString();
	}
	if (json['hotValue'] != null) {
		data.hotValue = json['hotValue']?.toInt();
	}
	if (json['article'] != null) {
		data.article = new TravelModelResultListPoiArticle().fromJson(json['article']);
	}
	if (json['distanceText'] != null) {
		data.distanceText = json['distanceText']?.toString();
	}
	if (json['tripShootCount'] != null) {
		data.tripShootCount = json['tripShootCount']?.toInt();
	}
	if (json['shortFeature'] != null) {
		data.shortFeature = json['shortFeature']?.toString();
	}
	if (json['h5Url'] != null) {
		data.h5Url = json['h5Url']?.toString();
	}
	if (json['appUrl'] != null) {
		data.appUrl = json['appUrl']?.toString();
	}
	return data;
}

Map<String, dynamic> travelModelResultListPoiToJson(TravelModelResultListPoi entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['poiType'] = entity.poiType;
	data['poiId'] = entity.poiId;
	data['poiName'] = entity.poiName;
	data['hotValue'] = entity.hotValue;
	if (entity.article != null) {
		data['article'] = entity.article.toJson();
	}
	data['distanceText'] = entity.distanceText;
	data['tripShootCount'] = entity.tripShootCount;
	data['shortFeature'] = entity.shortFeature;
	data['h5Url'] = entity.h5Url;
	data['appUrl'] = entity.appUrl;
	return data;
}

travelModelResultListPoiArticleFromJson(TravelModelResultListPoiArticle data, Map<String, dynamic> json) {
	if (json['articleId'] != null) {
		data.articleId = json['articleId']?.toInt();
	}
	if (json['productType'] != null) {
		data.productType = json['productType']?.toInt();
	}
	if (json['sourceType'] != null) {
		data.sourceType = json['sourceType']?.toInt();
	}
	if (json['articleTitle'] != null) {
		data.articleTitle = json['articleTitle']?.toString();
	}
	if (json['author'] != null) {
		data.author = new TravelModelResultListPoiArticleAuthor().fromJson(json['author']);
	}
	if (json['images'] != null) {
		data.images = new List<TravelModelResultListPoiArticleImage>();
		(json['images'] as List).forEach((v) {
			data.images.add(new TravelModelResultListPoiArticleImage().fromJson(v));
		});
	}
	if (json['hasVideo'] != null) {
		data.hasVideo = json['hasVideo'];
	}
	if (json['readCount'] != null) {
		data.readCount = json['readCount']?.toInt();
	}
	if (json['likeCount'] != null) {
		data.likeCount = json['likeCount']?.toInt();
	}
	if (json['commentCount'] != null) {
		data.commentCount = json['commentCount']?.toInt();
	}
	if (json['urls'] != null) {
		data.urls = new List<TravelModelResultListPoiArticleUrl>();
		(json['urls'] as List).forEach((v) {
			data.urls.add(new TravelModelResultListPoiArticleUrl().fromJson(v));
		});
	}
	if (json['tags'] != null) {
		data.tags = new List<dynamic>();
		data.tags.addAll(json['tags']);
	}
	if (json['topics'] != null) {
		data.topics = new List<TravelModelResultListPoiArticleTopic>();
		(json['topics'] as List).forEach((v) {
			data.topics.add(new TravelModelResultListPoiArticleTopic().fromJson(v));
		});
	}
	if (json['pois'] != null) {
		data.pois = new List<TravelModelResultListPoiArticlePoi>();
		(json['pois'] as List).forEach((v) {
			data.pois.add(new TravelModelResultListPoiArticlePoi().fromJson(v));
		});
	}
	if (json['publishTime'] != null) {
		data.publishTime = json['publishTime']?.toString();
	}
	if (json['publishTimeDisplay'] != null) {
		data.publishTimeDisplay = json['publishTimeDisplay']?.toString();
	}
	if (json['shootTime'] != null) {
		data.shootTime = json['shootTime']?.toString();
	}
	if (json['shootTimeDisplay'] != null) {
		data.shootTimeDisplay = json['shootTimeDisplay']?.toString();
	}
	if (json['level'] != null) {
		data.level = json['level']?.toInt();
	}
	if (json['distanceText'] != null) {
		data.distanceText = json['distanceText']?.toString();
	}
	if (json['isLike'] != null) {
		data.isLike = json['isLike'];
	}
	if (json['imageCounts'] != null) {
		data.imageCounts = json['imageCounts']?.toInt();
	}
	if (json['isCollected'] != null) {
		data.isCollected = json['isCollected'];
	}
	if (json['collectCount'] != null) {
		data.collectCount = json['collectCount']?.toInt();
	}
	if (json['articleStatus'] != null) {
		data.articleStatus = json['articleStatus']?.toInt();
	}
	if (json['poiName'] != null) {
		data.poiName = json['poiName']?.toString();
	}
	return data;
}

Map<String, dynamic> travelModelResultListPoiArticleToJson(TravelModelResultListPoiArticle entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['articleId'] = entity.articleId;
	data['productType'] = entity.productType;
	data['sourceType'] = entity.sourceType;
	data['articleTitle'] = entity.articleTitle;
	if (entity.author != null) {
		data['author'] = entity.author.toJson();
	}
	if (entity.images != null) {
		data['images'] =  entity.images.map((v) => v.toJson()).toList();
	}
	data['hasVideo'] = entity.hasVideo;
	data['readCount'] = entity.readCount;
	data['likeCount'] = entity.likeCount;
	data['commentCount'] = entity.commentCount;
	if (entity.urls != null) {
		data['urls'] =  entity.urls.map((v) => v.toJson()).toList();
	}
	if (entity.tags != null) {
		data['tags'] =  [];
	}
	if (entity.topics != null) {
		data['topics'] =  entity.topics.map((v) => v.toJson()).toList();
	}
	if (entity.pois != null) {
		data['pois'] =  entity.pois.map((v) => v.toJson()).toList();
	}
	data['publishTime'] = entity.publishTime;
	data['publishTimeDisplay'] = entity.publishTimeDisplay;
	data['shootTime'] = entity.shootTime;
	data['shootTimeDisplay'] = entity.shootTimeDisplay;
	data['level'] = entity.level;
	data['distanceText'] = entity.distanceText;
	data['isLike'] = entity.isLike;
	data['imageCounts'] = entity.imageCounts;
	data['isCollected'] = entity.isCollected;
	data['collectCount'] = entity.collectCount;
	data['articleStatus'] = entity.articleStatus;
	data['poiName'] = entity.poiName;
	return data;
}

travelModelResultListPoiArticleAuthorFromJson(TravelModelResultListPoiArticleAuthor data, Map<String, dynamic> json) {
	if (json['authorId'] != null) {
		data.authorId = json['authorId']?.toInt();
	}
	if (json['nickName'] != null) {
		data.nickName = json['nickName']?.toString();
	}
	if (json['clientAuth'] != null) {
		data.clientAuth = json['clientAuth']?.toString();
	}
	if (json['jumpUrl'] != null) {
		data.jumpUrl = json['jumpUrl']?.toString();
	}
	if (json['coverImage'] != null) {
		data.coverImage = new TravelModelResultListPoiArticleAuthorCoverImage().fromJson(json['coverImage']);
	}
	if (json['identityType'] != null) {
		data.identityType = json['identityType']?.toInt();
	}
	if (json['tag'] != null) {
		data.tag = json['tag']?.toString();
	}
	return data;
}

Map<String, dynamic> travelModelResultListPoiArticleAuthorToJson(TravelModelResultListPoiArticleAuthor entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['authorId'] = entity.authorId;
	data['nickName'] = entity.nickName;
	data['clientAuth'] = entity.clientAuth;
	data['jumpUrl'] = entity.jumpUrl;
	if (entity.coverImage != null) {
		data['coverImage'] = entity.coverImage.toJson();
	}
	data['identityType'] = entity.identityType;
	data['tag'] = entity.tag;
	return data;
}

travelModelResultListPoiArticleAuthorCoverImageFromJson(TravelModelResultListPoiArticleAuthorCoverImage data, Map<String, dynamic> json) {
	if (json['dynamicUrl'] != null) {
		data.dynamicUrl = json['dynamicUrl']?.toString();
	}
	if (json['originalUrl'] != null) {
		data.originalUrl = json['originalUrl']?.toString();
	}
	return data;
}

Map<String, dynamic> travelModelResultListPoiArticleAuthorCoverImageToJson(TravelModelResultListPoiArticleAuthorCoverImage entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['dynamicUrl'] = entity.dynamicUrl;
	data['originalUrl'] = entity.originalUrl;
	return data;
}

travelModelResultListPoiArticleImageFromJson(TravelModelResultListPoiArticleImage data, Map<String, dynamic> json) {
	if (json['imageId'] != null) {
		data.imageId = json['imageId']?.toInt();
	}
	if (json['dynamicUrl'] != null) {
		data.dynamicUrl = json['dynamicUrl']?.toString();
	}
	if (json['originalUrl'] != null) {
		data.originalUrl = json['originalUrl']?.toString();
	}
	if (json['width'] != null) {
		data.width = json['width']?.toInt();
	}
	if (json['height'] != null) {
		data.height = json['height']?.toInt();
	}
	if (json['mediaType'] != null) {
		data.mediaType = json['mediaType']?.toInt();
	}
	if (json['isWaterMarked'] != null) {
		data.isWaterMarked = json['isWaterMarked'];
	}
	return data;
}

Map<String, dynamic> travelModelResultListPoiArticleImageToJson(TravelModelResultListPoiArticleImage entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['imageId'] = entity.imageId;
	data['dynamicUrl'] = entity.dynamicUrl;
	data['originalUrl'] = entity.originalUrl;
	data['width'] = entity.width;
	data['height'] = entity.height;
	data['mediaType'] = entity.mediaType;
	data['isWaterMarked'] = entity.isWaterMarked;
	return data;
}

travelModelResultListPoiArticleUrlFromJson(TravelModelResultListPoiArticleUrl data, Map<String, dynamic> json) {
	if (json['version'] != null) {
		data.version = json['version']?.toString();
	}
	if (json['appUrl'] != null) {
		data.appUrl = json['appUrl']?.toString();
	}
	if (json['h5Url'] != null) {
		data.h5Url = json['h5Url']?.toString();
	}
	if (json['wxUrl'] != null) {
		data.wxUrl = json['wxUrl']?.toString();
	}
	return data;
}

Map<String, dynamic> travelModelResultListPoiArticleUrlToJson(TravelModelResultListPoiArticleUrl entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['version'] = entity.version;
	data['appUrl'] = entity.appUrl;
	data['h5Url'] = entity.h5Url;
	data['wxUrl'] = entity.wxUrl;
	return data;
}

travelModelResultListPoiArticleTopicFromJson(TravelModelResultListPoiArticleTopic data, Map<String, dynamic> json) {
	if (json['topicId'] != null) {
		data.topicId = json['topicId']?.toInt();
	}
	if (json['topicName'] != null) {
		data.topicName = json['topicName']?.toString();
	}
	if (json['level'] != null) {
		data.level = json['level']?.toInt();
	}
	if (json['iconImage'] != null) {
		data.iconImage = new TravelModelResultListPoiArticleTopicsIconImage().fromJson(json['iconImage']);
	}
	return data;
}

Map<String, dynamic> travelModelResultListPoiArticleTopicToJson(TravelModelResultListPoiArticleTopic entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['topicId'] = entity.topicId;
	data['topicName'] = entity.topicName;
	data['level'] = entity.level;
	if (entity.iconImage != null) {
		data['iconImage'] = entity.iconImage.toJson();
	}
	return data;
}

travelModelResultListPoiArticleTopicsIconImageFromJson(TravelModelResultListPoiArticleTopicsIconImage data, Map<String, dynamic> json) {
	if (json['imageId'] != null) {
		data.imageId = json['imageId']?.toInt();
	}
	if (json['dynamicUrl'] != null) {
		data.dynamicUrl = json['dynamicUrl']?.toString();
	}
	if (json['originalUrl'] != null) {
		data.originalUrl = json['originalUrl']?.toString();
	}
	if (json['width'] != null) {
		data.width = json['width']?.toInt();
	}
	if (json['height'] != null) {
		data.height = json['height']?.toInt();
	}
	if (json['mediaType'] != null) {
		data.mediaType = json['mediaType']?.toInt();
	}
	return data;
}

Map<String, dynamic> travelModelResultListPoiArticleTopicsIconImageToJson(TravelModelResultListPoiArticleTopicsIconImage entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['imageId'] = entity.imageId;
	data['dynamicUrl'] = entity.dynamicUrl;
	data['originalUrl'] = entity.originalUrl;
	data['width'] = entity.width;
	data['height'] = entity.height;
	data['mediaType'] = entity.mediaType;
	return data;
}

travelModelResultListPoiArticlePoiFromJson(TravelModelResultListPoiArticlePoi data, Map<String, dynamic> json) {
	if (json['poiType'] != null) {
		data.poiType = json['poiType']?.toInt();
	}
	if (json['poiId'] != null) {
		data.poiId = json['poiId']?.toInt();
	}
	if (json['poiName'] != null) {
		data.poiName = json['poiName']?.toString();
	}
	if (json['businessId'] != null) {
		data.businessId = json['businessId']?.toInt();
	}
	if (json['districtId'] != null) {
		data.districtId = json['districtId']?.toInt();
	}
	if (json['poiExt'] != null) {
		data.poiExt = new TravelModelResultListPoiArticlePoisPoiExt().fromJson(json['poiExt']);
	}
	if (json['source'] != null) {
		data.source = json['source']?.toInt();
	}
	if (json['isMain'] != null) {
		data.isMain = json['isMain']?.toInt();
	}
	if (json['isInChina'] != null) {
		data.isInChina = json['isInChina'];
	}
	if (json['countryName'] != null) {
		data.countryName = json['countryName']?.toString();
	}
	if (json['districtName'] != null) {
		data.districtName = json['districtName']?.toString();
	}
	if (json['districtENName'] != null) {
		data.districtENName = json['districtENName']?.toString();
	}
	return data;
}

Map<String, dynamic> travelModelResultListPoiArticlePoiToJson(TravelModelResultListPoiArticlePoi entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['poiType'] = entity.poiType;
	data['poiId'] = entity.poiId;
	data['poiName'] = entity.poiName;
	data['businessId'] = entity.businessId;
	data['districtId'] = entity.districtId;
	if (entity.poiExt != null) {
		data['poiExt'] = entity.poiExt.toJson();
	}
	data['source'] = entity.source;
	data['isMain'] = entity.isMain;
	data['isInChina'] = entity.isInChina;
	data['countryName'] = entity.countryName;
	data['districtName'] = entity.districtName;
	data['districtENName'] = entity.districtENName;
	return data;
}

travelModelResultListPoiArticlePoisPoiExtFromJson(TravelModelResultListPoiArticlePoisPoiExt data, Map<String, dynamic> json) {
	if (json['h5Url'] != null) {
		data.h5Url = json['h5Url']?.toString();
	}
	if (json['appUrl'] != null) {
		data.appUrl = json['appUrl']?.toString();
	}
	return data;
}

Map<String, dynamic> travelModelResultListPoiArticlePoisPoiExtToJson(TravelModelResultListPoiArticlePoisPoiExt entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['h5Url'] = entity.h5Url;
	data['appUrl'] = entity.appUrl;
	return data;
}
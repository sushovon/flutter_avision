class NewsAnalysis {
  List<BannerFetch>? bannerFetch;
  List<TrendingTest>? trendingTest;
  List<CurrentAffairs>? currentAffairs;
  List<PlanBanner>? planBanner;

  NewsAnalysis(
      {this.bannerFetch,
      this.trendingTest,
      this.currentAffairs,
      this.planBanner});

  NewsAnalysis.fromJson(Map<String, dynamic> json) {
    if (json['banner_fetch'] != null) {
      bannerFetch = <BannerFetch>[];
      json['banner_fetch'].forEach((v) {
        bannerFetch!.add(BannerFetch.fromJson(v));
      });
    }
    if (json['trending_test'] != null) {
      trendingTest = <TrendingTest>[];
      json['trending_test'].forEach((v) {
        trendingTest!.add(TrendingTest.fromJson(v));
      });
    }
    if (json['current_affairs'] != null) {
      currentAffairs = <CurrentAffairs>[];
      json['current_affairs'].forEach((v) {
        currentAffairs!.add(CurrentAffairs.fromJson(v));
      });
    }
    if (json['plan_banner'] != null) {
      planBanner = <PlanBanner>[];
      json['plan_banner'].forEach((v) {
        planBanner!.add(PlanBanner.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (bannerFetch != null) {
      data['banner_fetch'] = bannerFetch!.map((v) => v.toJson()).toList();
    }
    if (trendingTest != null) {
      data['trending_test'] = trendingTest!.map((v) => v.toJson()).toList();
    }
    if (currentAffairs != null) {
      data['current_affairs'] = currentAffairs!.map((v) => v.toJson()).toList();
    }
    if (planBanner != null) {
      data['plan_banner'] = planBanner!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BannerFetch {
  String? bannerId;
  String? bannerName;
  String? bannerImage;

  BannerFetch({this.bannerId, this.bannerName, this.bannerImage});

  BannerFetch.fromJson(Map<String, dynamic> json) {
    bannerId = json['banner_id'];
    bannerName = json['banner_name'];
    bannerImage = json['banner_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['banner_id'] = bannerId;
    data['banner_name'] = bannerName;
    data['banner_image'] = bannerImage;
    return data;
  }
}

class TrendingTest {
  String? subCategoryId;
  String? subCategoryName;
  String? subCategoryImage;
  String? courseId;
  String? productId;
  String? sectionName;

  TrendingTest(
      {this.subCategoryId,
      this.subCategoryName,
      this.subCategoryImage,
      this.courseId,
      this.productId,
      this.sectionName});

  TrendingTest.fromJson(Map<String, dynamic> json) {
    subCategoryId = json['sub_category_id'];
    subCategoryName = json['sub_category_name'];
    subCategoryImage = json['sub_category_image'];
    courseId = json['course_id'];
    productId = json['product_id']
        .toString(); //add toString. because some data were int and some were string
    sectionName = json['section_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sub_category_id'] = subCategoryId;
    data['sub_category_name'] = subCategoryName;
    data['sub_category_image'] = subCategoryImage;
    data['course_id'] = courseId;
    data['product_id'] = productId
        .toString(); //add toString. because some data were int and some were string
    data['section_name'] = sectionName;
    return data;
  }
}

class CurrentAffairs {
  String? iD;
  String? postTitle;
  List<String>? metaValue;
  String? postedDate;
  int? status;

  CurrentAffairs(
      {this.iD, this.postTitle, this.metaValue, this.postedDate, this.status});

  CurrentAffairs.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    postTitle = json['post_title'];
    metaValue = json['meta_value'].cast<String>();
    postedDate = json['posted_date'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ID'] = iD;
    data['post_title'] = postTitle;
    data['meta_value'] = metaValue;
    data['posted_date'] = postedDate;
    data['status'] = status;
    return data;
  }
}

class PlanBanner {
  String? bannerImage;

  PlanBanner({this.bannerImage});

  PlanBanner.fromJson(Map<String, dynamic> json) {
    bannerImage = json['banner_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['banner_image'] = bannerImage;
    return data;
  }
}

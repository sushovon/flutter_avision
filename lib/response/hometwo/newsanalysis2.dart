class NewsAnalysis2 {
  List<JobAlert>? jobAlert;
  SalesApi? salesApi;
  List<SmallQuizHome>? smallQuizHome;
  RandamFetchQuiz? randamFetchQuiz;
  List<PopularCourseApi>? popularCourseApi;
  List<YoutubeVideo>? youtubeVideo;
  List<DailyPost>? dailyPost;

  NewsAnalysis2(
      {this.jobAlert,
      this.salesApi,
      this.smallQuizHome,
      this.randamFetchQuiz,
      this.popularCourseApi,
      this.youtubeVideo,
      this.dailyPost});

  NewsAnalysis2.fromJson(Map<String, dynamic> json) {
    if (json['job_alert'] != null) {
      jobAlert = <JobAlert>[];
      json['job_alert'].forEach((v) {
        jobAlert!.add(new JobAlert.fromJson(v));
      });
    }
    salesApi = json['sales_api'] != null
        ? new SalesApi.fromJson(json['sales_api'])
        : null;
    if (json['small_quiz_home'] != null) {
      smallQuizHome = <SmallQuizHome>[];
      json['small_quiz_home'].forEach((v) {
        smallQuizHome!.add(new SmallQuizHome.fromJson(v));
      });
    }
    randamFetchQuiz = json['randam_fetch_quiz'] != null
        ? new RandamFetchQuiz.fromJson(json['randam_fetch_quiz'])
        : null;
    if (json['popular_course_api'] != null) {
      popularCourseApi = <PopularCourseApi>[];
      json['popular_course_api'].forEach((v) {
        popularCourseApi!.add(new PopularCourseApi.fromJson(v));
      });
    }
    if (json['youtube_video'] != null) {
      youtubeVideo = <YoutubeVideo>[];
      json['youtube_video'].forEach((v) {
        youtubeVideo!.add(new YoutubeVideo.fromJson(v));
      });
    }
    if (json['daily_post'] != null) {
      dailyPost = <DailyPost>[];
      json['daily_post'].forEach((v) {
        dailyPost!.add(new DailyPost.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.jobAlert != null) {
      data['job_alert'] = this.jobAlert!.map((v) => v.toJson()).toList();
    }
    if (this.salesApi != null) {
      data['sales_api'] = this.salesApi!.toJson();
    }
    if (this.smallQuizHome != null) {
      data['small_quiz_home'] =
          this.smallQuizHome!.map((v) => v.toJson()).toList();
    }
    if (this.randamFetchQuiz != null) {
      data['randam_fetch_quiz'] = this.randamFetchQuiz!.toJson();
    }
    if (this.popularCourseApi != null) {
      data['popular_course_api'] =
          this.popularCourseApi!.map((v) => v.toJson()).toList();
    }
    if (this.youtubeVideo != null) {
      data['youtube_video'] =
          this.youtubeVideo!.map((v) => v.toJson()).toList();
    }
    if (this.dailyPost != null) {
      data['daily_post'] = this.dailyPost!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class JobAlert {
  String? jobId;
  String? jobTitle;
  String? jobImg;
  String? link;

  JobAlert({this.jobId, this.jobTitle, this.jobImg, this.link});

  JobAlert.fromJson(Map<String, dynamic> json) {
    jobId = json['job_id'];
    jobTitle = json['job_title'];
    jobImg = json['job_img'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['job_id'] = jobId;
    data['job_title'] = jobTitle;
    data['job_img'] = jobImg;
    data['link'] = link;
    return data;
  }
}

class SalesApi {
  String? title1;
  String? title2;
  String? whatsapp;
  String? call;
  String? image;

  SalesApi({this.title1, this.title2, this.whatsapp, this.call, this.image});

  SalesApi.fromJson(Map<String, dynamic> json) {
    title1 = json['title1'];
    title2 = json['title2'];
    whatsapp = json['whatsapp'];
    call = json['call'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title1'] = title1;
    data['title2'] = title2;
    data['whatsapp'] = whatsapp;
    data['call'] = call;
    data['image'] = image;
    return data;
  }
}

class SmallQuizHome {
  String? quizId;
  String? quizBase;
  String? quizName;
  String? typeId;
  String? courseId;
  String? chapterId;
  String? totQus;
  String? userId;
  String? childTypeId;
  String? createdDate;
  String? modifiedDate;

  SmallQuizHome(
      {this.quizId,
      this.quizBase,
      this.quizName,
      this.typeId,
      this.courseId,
      this.chapterId,
      this.totQus,
      this.userId,
      this.childTypeId,
      this.createdDate,
      this.modifiedDate});

  SmallQuizHome.fromJson(Map<String, dynamic> json) {
    quizId = json['quiz_id'];
    quizBase = json['quiz_base'];
    quizName = json['quiz_name'];
    typeId = json['type_id'];
    courseId = json['course_id'];
    chapterId = json['chapter_id'];
    totQus = json['tot_qus'];
    userId = json['user_id'];
    childTypeId = json['child_type_id'];
    createdDate = json['created_date'];
    modifiedDate = json['modified_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['quiz_id'] = quizId;
    data['quiz_base'] = quizBase;
    data['quiz_name'] = quizName;
    data['type_id'] = typeId;
    data['course_id'] = courseId;
    data['chapter_id'] = chapterId;
    data['tot_qus'] = totQus;
    data['user_id'] = userId;
    data['child_type_id'] = childTypeId;
    data['created_date'] = createdDate;
    data['modified_date'] = modifiedDate;
    return data;
  }
}

class RandamFetchQuiz {
  String? fromDates;
  String? toDates;
  List<QuizArr>? quizArr;

  RandamFetchQuiz({this.fromDates, this.toDates, this.quizArr});

  RandamFetchQuiz.fromJson(Map<String, dynamic> json) {
    fromDates = json['from-dates'];
    toDates = json['to-dates'];
    if (json['quiz_arr'] != null) {
      quizArr = <QuizArr>[];
      json['quiz_arr'].forEach((v) {
        quizArr!.add(new QuizArr.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['from-dates'] = fromDates;
    data['to-dates'] = toDates;
    if (quizArr != null) {
      data['quiz_arr'] = quizArr!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class QuizArr {
  String? quizId;
  String? quizBase;
  String? quizName;
  String? typeId;
  String? courseId;
  String? chapterId;
  String? childTypeId;
  String? status;
  String? pauseTime;
  int? totalMarks;
  String? totalQuestion;
  String? createdDate;

  QuizArr(
      {this.quizId,
      this.quizBase,
      this.quizName,
      this.typeId,
      this.courseId,
      this.chapterId,
      this.childTypeId,
      this.status,
      this.pauseTime,
      this.totalMarks,
      this.totalQuestion,
      this.createdDate});

  QuizArr.fromJson(Map<String, dynamic> json) {
    quizId = json['quiz_id'];
    quizBase = json['quiz_base'];
    quizName = json['quiz_name'];
    typeId = json['type_id'];
    courseId = json['course_id'];
    chapterId = json['chapter_id'];
    childTypeId = json['child_type_id'];
    status = json['status'];
    pauseTime = json['pause_time'];
    totalMarks = json['total_marks'];
    totalQuestion = json['total_question'];
    createdDate = json['created_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['quiz_id'] = quizId;
    data['quiz_base'] = quizBase;
    data['quiz_name'] = quizName;
    data['type_id'] = typeId;
    data['course_id'] = courseId;
    data['chapter_id'] = chapterId;
    data['child_type_id'] = childTypeId;
    data['status'] = status;
    data['pause_time'] = pauseTime;
    data['total_marks'] = totalMarks;
    data['total_question'] = totalQuestion;
    data['created_date'] = createdDate;
    return data;
  }
}

class PopularCourseApi {
  String? productId;
  String? productName;
  String? productPrice;
  String? productOfferPrice;
  String? productImage;
  String? productType;
  String? courseDuration;

  PopularCourseApi(
      {this.productId,
      this.productName,
      this.productPrice,
      this.productOfferPrice,
      this.productImage,
      this.productType,
      this.courseDuration});

  PopularCourseApi.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    productName = json['product_name'];
    productPrice = json['product_price'];
    productOfferPrice = json['product_offer_price'];
    productImage = json['product_image'];
    productType = json['product_type'];
    courseDuration = json['course_duration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_id'] = productId;
    data['product_name'] = productName;
    data['product_price'] = productPrice;
    data['product_offer_price'] = productOfferPrice;
    data['product_image'] = productImage;
    data['product_type'] = productType;
    data['course_duration'] = courseDuration;
    return data;
  }
}

class YoutubeVideo {
  String? videoId;
  String? viewCode;
  String? about;
  String? statusId;
  String? studentId;
  String? idvideo;
  String? seenStatus;
  String? ellapsedTime;
  String? totalDuration;
  String? createdDate;
  String? modifiedDate;
  String? typeId;
  String? typeName;

  YoutubeVideo(
      {this.videoId,
      this.viewCode,
      this.about,
      this.statusId,
      this.studentId,
      this.idvideo,
      this.seenStatus,
      this.ellapsedTime,
      this.totalDuration,
      this.createdDate,
      this.modifiedDate,
      this.typeId,
      this.typeName});

  YoutubeVideo.fromJson(Map<String, dynamic> json) {
    videoId = json['videoId'];
    viewCode = json['view_code'];
    about = json['about'];
    statusId = json['status_id'];
    studentId = json['student_id'];
    idvideo = json['video_id'];
    seenStatus = json['seen_status'];
    ellapsedTime = json['ellapsed_time'];
    totalDuration = json['total_duration'];
    createdDate = json['created_date'];
    modifiedDate = json['modified_date'];
    typeId = json['type_id'];
    typeName = json['type_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['videoId'] = videoId;
    data['view_code'] = viewCode;
    data['about'] = about;
    data['status_id'] = statusId;
    data['student_id'] = studentId;
    data['video_id'] = idvideo;
    data['seen_status'] = seenStatus;
    data['ellapsed_time'] = ellapsedTime;
    data['total_duration'] = totalDuration;
    data['created_date'] = createdDate;
    data['modified_date'] = modifiedDate;
    data['type_id'] = typeId;
    data['type_name'] = typeName;
    return data;
  }
}

class DailyPost {
  String? postId;
  String? userName;
  String? profileImg;
  String? userRole;
  String? postTitle;
  String? postImage;
  String? postDate;
  String? postCategory;
  int? postType;
  String? likeCount;
  String? commentCount;
  int? postLikeStatus;
  String? postUrl;
  //List<String>? categoryDetailsArray;
  //List<String>? quizArray;

  DailyPost({
    this.postId,
    this.userName,
    this.profileImg,
    this.userRole,
    this.postTitle,
    this.postImage,
    this.postDate,
    this.postCategory,
    this.postType,
    this.likeCount,
    this.commentCount,
    this.postLikeStatus,
    this.postUrl,
    //this.categoryDetailsArray,
    //this.quizArray
  });

  DailyPost.fromJson(Map<String, dynamic> json) {
    postId = json['post_id'];
    userName = json['user_name'];
    profileImg = json['profile_img'];
    userRole = json['user_role'];
    postTitle = json['post_title'];
    postImage = json['post_image'];
    postDate = json['post_date'];
    postCategory = json['post_category'];
    postType = json['post_type'];
    likeCount = json['like_count'];
    commentCount = json['comment_count'];
    postLikeStatus = json['post_like_status'];
    postUrl = json['post_url'];
    //categoryDetailsArray = json['categoryDetailsArray'].cast<String>();
    //quizArray = json['quiz_array'].cast<String>();
    /* if (json['category_details_array'] != null) {
      categoryDetailsArray = <String>[];
      json['categoryDetailsArray'].forEach((v) {
        categoryDetailsArray!.add(new String.fromJson(v));
      });
    } */
    /* if (json['quiz_array'] != null) {
      quizArray = <String>[];
      json['quiz_array'].forEach((v) {
        quizArray!.add(new String.fromJson(v));
      });
    } */
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['post_id'] = postId;
    data['user_name'] = userName;
    data['profile_img'] = profileImg;
    data['user_role'] = userRole;
    data['post_title'] = postTitle;
    data['post_image'] = postImage;
    data['post_date'] = postDate;
    data['post_category'] = postCategory;
    data['post_type'] = postType;
    data['like_count'] = likeCount;
    data['comment_count'] = commentCount;
    data['post_like_status'] = postLikeStatus;
    data['post_url'] = postUrl;
    //data['category_details_array'] = categoryDetailsArray;
    //data['quiz_array'] = quizArray;

    /* if (this.categoryDetailsArray != null) {
      data['category_details_array'] =
          this.categoryDetailsArray!.map((v) => v.toJson()).toList();
    }
    if (this.quizArray != null) {
      data['quiz_array'] = this.quizArray!.map((v) => v.toJson()).toList();
    } */
    return data;
  }
}

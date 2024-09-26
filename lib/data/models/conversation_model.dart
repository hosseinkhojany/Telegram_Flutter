class ConversationModel{

  String? id;
  String? collectionName;
  String? conversationType;
  String? name;
  String? avatar;
  String? bio;
  int? peopleCount;

  ConversationModel({
    String? id,
    String? name,
    String? avatar,
    String? bio,
    int? peopleCount,
    String? collectionName,
    String? conversationType,
  }){
    this.id = id ?? "";
    this.name = name ?? "";
    this.avatar = avatar ?? "";
    this.bio = bio ?? "";
    this.peopleCount = peopleCount ?? 0;
    this.collectionName = collectionName ?? "";
    this.conversationType = conversationType ?? "";

  }

}
class FriendmodelEntity {
	List<FriendmodelData> data;

	FriendmodelEntity({this.data});

	FriendmodelEntity.fromJson(Map<String, dynamic> json) {
		if (json['data'] != null) {
			data = new List<FriendmodelData>();(json['data'] as List).forEach((v) { data.add(new FriendmodelData.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.data != null) {
      data['data'] =  this.data.map((v) => v.toJson()).toList();
    }
		return data;
	}
}

class FriendmodelData {
	String head;
	String name;
	String time;
	List<String> pics;
	String desc;

	FriendmodelData({this.head, this.name, this.time, this.pics, this.desc});

	FriendmodelData.fromJson(Map<String, dynamic> json) {
		head = json['head'];
		name = json['name'];
		time = json['time'];
		pics = json['pics']?.cast<String>();
		desc = json['desc'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['head'] = this.head;
		data['name'] = this.name;
		data['time'] = this.time;
		data['pics'] = this.pics;
		data['desc'] = this.desc;
		return data;
	}
}

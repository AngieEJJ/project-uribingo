class RefrigeDetail {
  String refrigeName;
  int refrigeCompCount;
  int freezerCompCount;
  int period;
  int extentionPeriod;
  int registerDate;

//<editor-fold desc="Data Methods">
  RefrigeDetail({
    required this.refrigeName,
    required this.refrigeCompCount,
    required this.freezerCompCount,
    required this.period,
    required this.extentionPeriod,
    required this.registerDate,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RefrigeDetail &&
          runtimeType == other.runtimeType &&
          refrigeName == other.refrigeName &&
          refrigeCompCount == other.refrigeCompCount &&
          freezerCompCount == other.freezerCompCount &&
          period == other.period &&
          extentionPeriod == other.extentionPeriod &&
          registerDate == other.registerDate);

  @override
  int get hashCode =>
      refrigeName.hashCode ^
      refrigeCompCount.hashCode ^
      freezerCompCount.hashCode ^
      period.hashCode ^
      extentionPeriod.hashCode ^
      registerDate.hashCode;

  @override
  String toString() {
    return 'RefrigeDetail{ refrigeName: $refrigeName, refrigeCompCount: $refrigeCompCount, freezerCompCount: $freezerCompCount, period: $period, extentionPeriod: $extentionPeriod, registerDate: $registerDate,}';
  }

  RefrigeDetail copyWith({
    String? refrigeName,
    int? refrigeCompCount,
    int? freezerCompCount,
    int? period,
    int? extentionPeriod,
    int? registerDate,
  }) {
    return RefrigeDetail(
      refrigeName: refrigeName ?? this.refrigeName,
      refrigeCompCount: refrigeCompCount ?? this.refrigeCompCount,
      freezerCompCount: freezerCompCount ?? this.freezerCompCount,
      period: period ?? this.period,
      extentionPeriod: extentionPeriod ?? this.extentionPeriod,
      registerDate: registerDate ?? this.registerDate,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'refrigeName': refrigeName,
      'refrigeCompCount': refrigeCompCount,
      'freezerCompCount': freezerCompCount,
      'period': period,
      'extentionPeriod': extentionPeriod,
      'registerDate': registerDate,
    };
  }

  factory RefrigeDetail.fromJson(Map<String, dynamic> map) {
    return RefrigeDetail(
      refrigeName: map['refrigeName'] as String,
      refrigeCompCount: map['refrigeCompCount'] as int,
      freezerCompCount: map['freezerCompCount'] as int,
      period: map['period'] as int,
      extentionPeriod: map['extentionPeriod'] as int,
      registerDate: map['registerDate'] as int,
    );
  }

//</editor-fold>
}
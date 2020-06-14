class EventLocation {
  num _longitude;
  num _latitude;

  EventLocation(this._longitude, this._latitude);
}

class SportEvent {
  String title;
  String description;
  String type;
  EventLocation location;
  DateTime date;
  int duration;
  int price;
  int membersCount;
  int skillLevel;
  String authorId;
  DateTime createDate;

  SportEvent({
    this.title,
    this.description,
    this.type,
    this.location,
    this.date,
    this.duration,
    this.price,
    this.membersCount,
    this.skillLevel,
    this.authorId,
    this.createDate
  });
}

final sportEventsList = <SportEvent>[
  SportEvent(title: 'Гра у футбол', date: DateTime(2020, 7, 8, 12, 0)),
  SportEvent(title: 'Пробіжка', date: DateTime(2020, 6, 27, 8)),
  SportEvent(title: 'Шукаємо команду для гри у волейбол', date: DateTime(2020, 6, 29, 14)),
  SportEvent(title: 'Гра у теніс', date: DateTime(2020, 6, 29, 12, 30)),
  SportEvent(title: 'Баскетбол', date: DateTime(2020, 6, 30, 16, 15)),
  SportEvent(title: 'Шукаю гравця для настільного теніса', date: DateTime(2020, 6, 21, 13, 30)),
  SportEvent(title: 'Команди для боулінгу', date: DateTime(2020, 6, 21, 10)),
  SportEvent(title: 'Турніки', date: DateTime(2020, 6, 21, 12, 40)),
  SportEvent(title: 'Баскетбол', date: DateTime(2020, 6, 21, 15, 20)),
  SportEvent(title: 'Пробіжка в парку', date: DateTime(2020, 6, 26, 9, 50)),
];
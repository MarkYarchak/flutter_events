var sportTypes = [
  SportType(title: 'Футбол', imagePath: 'assets/sport_types_images/Football.png'),
  SportType(title: 'Волейбол', imagePath: 'assets/sport_types_images/Volleyball.png'),
  SportType(title: 'Теніс', imagePath: 'assets/sport_types_images/Tennis.png'),
  SportType(title: 'Баскетбол', imagePath: 'assets/sport_types_images/Basketball.png'),
  SportType(title: 'Воркаут', imagePath: 'assets/sport_types_images/Workout.png'),
  SportType(title: 'Велосипед', imagePath: 'assets/sport_types_images/Bike.png'),
  SportType(title: 'Плавання', imagePath: 'assets/sport_types_images/Swimming.png'),
  SportType(title: 'Біг', imagePath: 'assets/sport_types_images/Run.png'),
  SportType(title: 'Настільний теніс', imagePath: 'assets/sport_types_images/Table_tennis.png'),
  SportType(title: 'Фітнес', imagePath: 'assets/sport_types_images/Fitness.png'),
  SportType(title: 'Боулінг', imagePath: 'assets/sport_types_images/Bowling.png'),
  SportType(title: 'Фрізбі', imagePath: 'assets/sport_types_images/Frisbee.png'),
  SportType(title: 'Інше', imagePath: 'assets/sport_types_images/Another.png'),
];

class SportType {
  String title, imagePath;
  SportType({ this.title, this.imagePath });
}

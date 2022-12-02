class ExercisesModel{
  final String? nameExercises;
  final String? imagesExercises;
  final List<ExercisesList>? listExercises;

  ExercisesModel({this.nameExercises, this.imagesExercises, this.listExercises});
}

class ExercisesList {
  final String? titleExercises;
  final String? descriptionExercises;
  final String? descImages;
  final List? imagesExercises;
  final List? technikExercises;

  ExercisesList({this.titleExercises, this.descriptionExercises, this.descImages, this.imagesExercises, this.technikExercises});
}
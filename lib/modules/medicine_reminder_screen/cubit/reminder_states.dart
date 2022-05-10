
abstract class ReminderStates{}

class ReminderInitialState extends ReminderStates{}

class ReminderInsertToDB extends ReminderStates{}

class ReminderCreateDB extends ReminderStates{}

class ReminderGetFromDB extends ReminderStates{}

class ReminderChangeBottomSheetState extends ReminderStates{}
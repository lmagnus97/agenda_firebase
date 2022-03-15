enum StatusSchedule { FREE, WAITING_CONFIRMATION, MARKED }



extension StatusScheduleExtension on StatusSchedule {
  String get description {
    switch (this) {
      case StatusSchedule.FREE:
        return 'Livre';
      case StatusSchedule.WAITING_CONFIRMATION:
        return 'Aguardando confirmação';
      case StatusSchedule.MARKED:
        return 'Marcado';
      default:
        return '';
    }
  }
}

class StatusScheduleFunctions {
  static StatusSchedule toEnum(String name) {
    if (name == StatusSchedule.FREE.name) {
      return StatusSchedule.FREE;
    }
    if (name == StatusSchedule.WAITING_CONFIRMATION.name) {
      return StatusSchedule.WAITING_CONFIRMATION;
    }
    if (name == StatusSchedule.MARKED.name) {
      return StatusSchedule.MARKED;
    }
    return StatusSchedule.FREE;
  }
}

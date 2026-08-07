public with sharing class StatisticsService {

   public static void updateCompletedAppointment(
    Id appointmentId
) {

    Appointment__c appointment = [

        SELECT AppointmentDate__c

        FROM Appointment__c

        WHERE Id = :appointmentId

        LIMIT 1

    ];

    if (appointment.AppointmentDate__c != null) {

        Set<Date> statisticDates =
            new Set<Date>();

        statisticDates.add(
            appointment.AppointmentDate__c.date()
        );

        OPDStatisticsService.updateStatistics(
            statisticDates
        );

    }

}
}
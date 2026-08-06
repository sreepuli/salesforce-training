public with sharing class OPDStatisticsService {

    public static void updateStatistics(Set<Date> statisticDates) {

        if (statisticDates == null || statisticDates.isEmpty()) {
            return;
        }

        // Existing statistics records
        Map<Date, OPD_Statistics__c> statisticsMap = new Map<Date, OPD_Statistics__c>();

        for (OPD_Statistics__c stat : [
            SELECT Id,
                   Statistic_Date__c,
                   Total_Appointments__c,
                   Scheduled_Appointments__c,
                   Completed_Appointments__c,
                   Cancelled_Appointments__c
            FROM OPD_Statistics__c
            WHERE Statistic_Date__c IN :statisticDates
        ]) {
            statisticsMap.put(stat.Statistic_Date__c, stat);
        }

        // Count appointments for each date
        Map<Date, Integer> totalMap = new Map<Date, Integer>();
        Map<Date, Integer> scheduledMap = new Map<Date, Integer>();
        Map<Date, Integer> completedMap = new Map<Date, Integer>();
        Map<Date, Integer> cancelledMap = new Map<Date, Integer>();

        for (Appointment__c appointment : [
            SELECT AppointmentDate__c,
                   Status__c
            FROM Appointment__c
            WHERE DAY_ONLY(AppointmentDate__c) IN :statisticDates
        ]) {

            Date appointmentDate = appointment.AppointmentDate__c.date();

            totalMap.put(
                appointmentDate,
                (totalMap.containsKey(appointmentDate) ? totalMap.get(appointmentDate) : 0) + 1
            );

            if (appointment.Status__c == 'Scheduled') {
                scheduledMap.put(
                    appointmentDate,
                    (scheduledMap.containsKey(appointmentDate) ? scheduledMap.get(appointmentDate) : 0) + 1
                );
            }
            else if (appointment.Status__c == 'Completed') {
                completedMap.put(
                    appointmentDate,
                    (completedMap.containsKey(appointmentDate) ? completedMap.get(appointmentDate) : 0) + 1
                );
            }
            else if (appointment.Status__c == 'Cancelled') {
                cancelledMap.put(
                    appointmentDate,
                    (cancelledMap.containsKey(appointmentDate) ? cancelledMap.get(appointmentDate) : 0) + 1
                );
            }
        }

        List<OPD_Statistics__c> statisticsToUpsert = new List<OPD_Statistics__c>();

        for (Date statDate : statisticDates) {

            OPD_Statistics__c stat;

            if (statisticsMap.containsKey(statDate)) {
                stat = statisticsMap.get(statDate);
            } else {
                stat = new OPD_Statistics__c();
                stat.Statistic_Date__c = statDate;
            }

            stat.Total_Appointments__c =
                totalMap.containsKey(statDate) ? totalMap.get(statDate) : 0;

            stat.Scheduled_Appointments__c =
                scheduledMap.containsKey(statDate) ? scheduledMap.get(statDate) : 0;

            stat.Completed_Appointments__c =
                completedMap.containsKey(statDate) ? completedMap.get(statDate) : 0;

            stat.Cancelled_Appointments__c =
                cancelledMap.containsKey(statDate) ? cancelledMap.get(statDate) : 0;

            statisticsToUpsert.add(stat);
        }

        upsert statisticsToUpsert;
    }
}
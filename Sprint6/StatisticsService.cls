public with sharing class StatisticsService {

    public static void updateCompletedAppointments(

        List<Appointment__c> newAppointments,
        Map<Id, Appointment__c> oldMap

    ) {

        for (Appointment__c app : newAppointments) {

            Appointment__c oldApp = oldMap.get(app.Id);

            if (

                oldApp.Status__c != 'Completed' &&
                app.Status__c == 'Completed'

            ) {

                System.debug(
                    'Appointment Completed: ' + app.Id
                );

                // Future Statistics Logic

            }

        }

    }

}
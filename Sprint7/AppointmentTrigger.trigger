trigger AppointmentTrigger on Appointment__c (

    before insert,

    after insert,

    after update

) {


    // Before Insert
    if (Trigger.isBefore && Trigger.isInsert) {

        AppointmentService.validateAppointments(Trigger.new);

    }


    // After Insert
    if (Trigger.isAfter && Trigger.isInsert) {

        Set<Date> statisticDates = new Set<Date>();

        for (Appointment__c app : Trigger.new) {

            if (app.AppointmentDate__c != null) {

                statisticDates.add(
                    app.AppointmentDate__c.date()
                );

            }

        }


        if (!statisticDates.isEmpty()) {

            OPDStatisticsService.updateStatistics(
                statisticDates
            );

        }


        NotificationService.notifyEmergencyAppointments(
            Trigger.new
        );

    }


    // After Update
    if (Trigger.isAfter && Trigger.isUpdate) {

        Set<Date> statisticDates = new Set<Date>();


        for (Appointment__c app : Trigger.new) {

            Appointment__c oldApp =
                Trigger.oldMap.get(app.Id);


            // Status changed to Completed
            if (oldApp.Status__c != app.Status__c &&
                app.Status__c == 'Completed') {


                if (app.AppointmentDate__c != null) {

                    statisticDates.add(
                        app.AppointmentDate__c.date()
                    );

                }

            }

        }


        if (!statisticDates.isEmpty()) {

            OPDStatisticsService.updateStatistics(
                statisticDates
            );

        }

    }

}
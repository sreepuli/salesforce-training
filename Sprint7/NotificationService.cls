public with sharing class NotificationService {

    /**
     * Notify doctors about Emergency Appointments
     */
    public static void notifyEmergencyAppointments(
        List<Appointment__c> appointments
    ) {

        if (appointments == null || appointments.isEmpty()) {
            return;
        }

        Set<Id> doctorIds = new Set<Id>();

        for (Appointment__c app : appointments) {

            if (app.Priority__c == 'Emergency'
                && app.Doctor__c != null) {

                doctorIds.add(app.Doctor__c);
            }
        }

        if (doctorIds.isEmpty()) {
            return;
        }

        Map<Id, Doctor__c> doctorMap =
            AppointmentSelector.getDoctorsWithEmail(doctorIds);

        List<Messaging.SingleEmailMessage> emails =
            new List<Messaging.SingleEmailMessage>();

        for (Appointment__c app : appointments) {

            if (app.Priority__c != 'Emergency'
                || app.Doctor__c == null) {
                continue;
            }

            Doctor__c doctor = doctorMap.get(app.Doctor__c);

            if (doctor == null ||
                String.isBlank(doctor.Email__c)) {
                continue;
            }

            Messaging.SingleEmailMessage mail =
                new Messaging.SingleEmailMessage();

            mail.setToAddresses(
                new List<String>{doctor.Email__c}
            );

            mail.setSubject('Emergency Appointment');

            mail.setPlainTextBody(
                'Dear Dr. ' + doctor.Name +
                ',\n\nAn emergency appointment has been scheduled.' +
                '\n\nAppointment Date: ' +
                String.valueOf(app.AppointmentDate__c) +
                '\nPriority: ' + app.Priority__c +
                '\n\nPlease attend immediately.'
            );

            emails.add(mail);
        }

        if (!emails.isEmpty()) {
            Messaging.sendEmail(emails);
        }
    }
}
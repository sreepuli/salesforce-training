public with sharing class AppointmentController {

    /**
     * Book Appointment
     */
    @AuraEnabled
    public static Appointment__c bookAppointment(
        Id patientId,
        Id doctorId,
        Datetime appointmentDateTime,
        String symptoms,
        String visitType,
        String priority
    ) {

        System.debug('Received Datetime = ' + appointmentDateTime);
        return AppointmentService.bookAppointment(
            patientId,
            doctorId,
            appointmentDateTime,
            symptoms,
            visitType,
            priority
        );
    }

    /**
     * Cancel Appointment
     */
    @AuraEnabled
    public static void cancelAppointment(Id appointmentId) {

        AppointmentService.cancelAppointment(appointmentId);

    }

    /**
     * Reschedule Appointment
     */
    @AuraEnabled
    public static void rescheduleAppointment(
        Id appointmentId,
        Datetime newAppointmentDate
    ) {

        AppointmentService.rescheduleAppointment(
            appointmentId,
            newAppointmentDate
        );

    }

    /**
     * Complete Appointment
     */
    @AuraEnabled
    public static void completeAppointment(
        Id appointmentId
    ) {

        AppointmentService.completeAppointment(
            appointmentId
        );

    }

    /**
     * Check Doctor Availability
     */
    @AuraEnabled(cacheable=true)
    public static Boolean checkDoctorAvailability(
        Id doctorId,
        Datetime appointmentDate
    ) {

        return AppointmentService.checkDoctorAvailability(
            doctorId,
            appointmentDate
        );

    }

    /**
     * Get Appointment History
     */
    @AuraEnabled(cacheable=true)
    public static List<Appointment__c> getAppointmentHistory(
        Id patientId
    ) {

        return AppointmentService.getAppointmentHistory(
            patientId
        );

    }

}
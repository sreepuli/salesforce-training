public with sharing class AppointmentService {
  public static Appointment__c bookAppointment(
    Id patientId,
    Id doctorId,
    Datetime appointmentDateTime,
    String symptoms,
    String visitType,
    String priority
) {

    System.debug('Step 1');

    if (!AppointmentSelector.patientExists(patientId)) {
        throw new AuraHandledException('Patient Not Found');
    }

    System.debug('Step 2');

    if (!AppointmentSelector.doctorExists(doctorId)) {
        throw new AuraHandledException('Doctor Not Found');
    }

    System.debug('Step 3');

    if (appointmentDateTime == null) {
        throw new AuraHandledException('Appointment Date is required');
    }

    if (appointmentDateTime < System.now()) {
        throw new AuraHandledException('Appointment date cannot be in the past');
    }

    System.debug('Step 4');

    Boolean available = AppointmentSelector.isDoctorAvailable(
        doctorId,
        appointmentDateTime
    );

    System.debug('Doctor Available = ' + available);

    if (!available) {
        throw new AuraHandledException('Doctor is Busy');
    }

    System.debug('Step 5');

    Integer tokenNumber =
        AppointmentSelector.getNextTokenNumber(
            doctorId,
            appointmentDateTime.date()
        );

    System.debug('Token = ' + tokenNumber);

    Appointment__c app = new Appointment__c();

    app.Patient__c = patientId;
    app.Doctor__c = doctorId;
    app.AppointmentDate__c = appointmentDateTime;
    app.Symtopms__c = symptoms;
    app.Visit_Type__c = visitType;
    app.Priority__c = priority;
    app.Token_Number__c = tokenNumber;
    app.Status__c = 'Scheduled';

    insert app;

    System.debug('Appointment Created');

    return app;
}
   public static void cancelAppointment(Id appointmentId){
        Appointment__c appointment = AppointmentSelector.getAppointmentById(
            appointmentId
        );

         if (appointment == null) {
            throw new AuraHandledException(
                'Appointment not found.'
            );
        }
         if (appointment.Status__c == 'Completed') {
            throw new AuraHandledException(
                'Completed appointments cannot be cancelled.'
            );
        }
         if (appointment.Status__c == 'Cancelled') {
            throw new AuraHandledException(
                'Appointment is already cancelled.'
            );
        }
        appointment.Status__c = 'Cancelled';
        update appointment;

   }
   public static void rescheduleAppointment(
        Id appointmentId,
        Datetime newAppointmentDate
   ){
        Appointment__c appointment = AppointmentSelector.getAppointmentById(
            appointmentId
        );
         if (appointment == null) {
            throw new AuraHandledException(
                'Appointment not found.'
            );
        }

        if (appointment.Status__c != 'Scheduled') {
            throw new AuraHandledException(
                'Only scheduled appointments can be rescheduled.'
            );
        }

        if (newAppointmentDate < System.now()) {
            throw new AuraHandledException(
                'Invalid appointment date.'
            );
        }

        if (!AppointmentSelector.isDoctorAvailable(
                appointment.Doctor__c,
                newAppointmentDate
        )) {

            throw new AuraHandledException(
                'Doctor is not available.'
            );
        }

        appointment.AppointmentDate__c =
            newAppointmentDate;

        update appointment;
   }


public static void completeAppointment(Id appointmentId){

    Appointment__c appointment =
        AppointmentSelector.getAppointmentById(appointmentId);

    if(appointment == null){
        throw new AuraHandledException(
            'Appointment not found.'
        );
    }

    if(appointment.Status__c == 'Cancelled'){
        throw new AuraHandledException(
            'Cancelled appointment cannot be completed.'
        );
    }

    if(appointment.Status__c == 'Completed'){
        throw new AuraHandledException(
            'Appointment already completed.'
        );
    }

    appointment.Status__c = 'Completed';

    appointment.Check_Out_Time__c = System.now();

    update appointment;
}
    /**
     * Check Doctor Availability
     */
    public static Boolean checkDoctorAvailability(
        Id doctorId,
        Datetime appointmentDate
    ) {

        return AppointmentSelector.isDoctorAvailable(
            doctorId,
            appointmentDate
        );

    }

    /**
     * Appointment History
     */
    public static List<Appointment__c>
    getAppointmentHistory(Id patientId) {

        return AppointmentSelector.getAppointmentHistory(patientId);

    }


}
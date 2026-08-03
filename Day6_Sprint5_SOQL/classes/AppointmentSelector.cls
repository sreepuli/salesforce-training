public with sharing class AppointmentSelector {
    public static Boolean patientExists(Id patientId){
        return [
            Select Count()
            From Patient__c
            WHERE Id = :patientId
        ] > 0;
    }
    public static Boolean doctorExists(Id doctorId){
        return [
            Select Count()
            From Doctor__c
            WHERE Id = :doctorId
        ] > 0;
    }
    public Static Boolean isDoctorAvailable(
        Id doctorId,
        Datetime appointmentDateTime
    ){
        Integer appointmentCount = [
            SELECT COUNT()
            FROM Appointment__c
            WHERE Doctor__c =:doctorId
            AND AppointmentDate__c = :appointmentDateTime
            AND Status__c != 'Canceled'
        ];
        return appointmentCount==0;
    }
 public static Integer getNextTokenNumber(
        Id doctorId,
        Date appointmentDate
    ){
        List<Appointment__c> appointments = [

            SELECT Token_Number__c

            FROM Appointment__c

            WHERE Doctor__c = :doctorId
            AND DAY_ONLY(AppointmentDate__c) = :appointmentDate

            ORDER BY Token_Number__c DESC

            LIMIT 1

        ];

        if (appointments.isEmpty() || appointments[0].Token_Number__c == null) {
            return 1;
        }

        return Integer.valueOf(appointments[0].Token_Number__c) + 1;
    }
public static Appointment__c getAppointmentById(Id appointmentId) {

        List<Appointment__c> appointments = [

            SELECT Id,
                   Patient__c,
                   Doctor__c,
                   AppointmentDate__c,
                   Status__c,
                   Token_Number__c,
                   Visit_Type__c,
                   Priority__c,
                   Symtopms__c

            FROM Appointment__c

            WHERE Id = :appointmentId

            LIMIT 1

        ];

        return appointments.isEmpty()
            ? null
            : appointments[0];
    }

public static List<Appointment__c> getAppointmentHistory(
        Id patientId
    ) {

        return [

           SELECT
                Id,
                AppointmentDate__c,
                Status__c,
                Token_Number__c,
                Visit_Type__c,
                Priority__c,
                Check_Out_Time__c,
                Doctor__r.Name
            FROM Appointment__c
            WHERE Patient__c = :patientId
            ORDER BY AppointmentDate__c DESC

        ];
    }
}
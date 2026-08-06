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
public static Boolean isDoctorAvailable(
    Id doctorId,
    Datetime appointmentDateTime
){
    Integer appointmentCount = [
        SELECT COUNT()
        FROM Appointment__c
        WHERE Doctor__c = :doctorId
        AND AppointmentDate__c = :appointmentDateTime
        AND Status__c != 'Cancelled'
    ];

    System.debug('Appointment Count = ' + appointmentCount);

    return appointmentCount == 0;
}
public static Map<String, Integer> getNextTokenNumbers(
    Set<Id> doctorIds,
    Set<Date> appointmentDates
) {

    Map<String, Integer> tokenMap = new Map<String, Integer>();

    List<Appointment__c> appointments = [

        SELECT Doctor__c,
               AppointmentDate__c,
               Token_Number__c

        FROM Appointment__c

        WHERE Doctor__c IN :doctorIds
        AND DAY_ONLY(AppointmentDate__c) IN :appointmentDates
        AND Status__c != 'Cancelled'

        ORDER BY Doctor__c,
                 AppointmentDate__c,
                 Token_Number__c DESC

    ];

    // Store the highest token number for each Doctor + Date
    for (Appointment__c app : appointments) {

        String key =
            app.Doctor__c + '_' +
            String.valueOf(app.AppointmentDate__c.date());

        // Because records are sorted DESC,
        // the first record is the highest token.
        if (!tokenMap.containsKey(key)) {

            Integer token =
                app.Token_Number__c == null
                ? 1
                : Integer.valueOf(app.Token_Number__c) + 1;

            tokenMap.put(key, token);
        }
    }

    return tokenMap;
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


public static Map<Id, Patient__c> getPatients(Set<Id> patientIds) {

        return new Map<Id, Patient__c>([
            SELECT Id, Name
            FROM Patient__c
            WHERE Id IN :patientIds
        ]);

}
public static Map<Id, Doctor__c> getDoctors(Set<Id> doctorIds) {

    return new Map<Id, Doctor__c>([
        SELECT Id, Name
        FROM Doctor__c
        WHERE Id IN :doctorIds
    ]);

}
public static List<Appointment__c> getAppointments(
    Set<Id> doctorIds,
    Set<Datetime> appointmentTimes
) {

    return [

        SELECT Id,
               Doctor__c,
               AppointmentDate__c,
               Token_Number__c,
               Status__c

        FROM Appointment__c

        WHERE Doctor__c IN :doctorIds
        AND AppointmentDate__c IN :appointmentTimes
        AND Status__c != 'Cancelled'

    ];

}

public static Map<Id, Doctor__c> getDoctorsWithEmail(
    Set<Id> doctorIds
){

    return new Map<Id, Doctor__c>([

        SELECT Id,
               Name,
               Email__c

        FROM Doctor__c

        WHERE Id IN :doctorIds

    ]);
}


}
public with sharing class AppointmentService {

public static Appointment__c bookAppointment(
    Id patientId,
    Id doctorId,
    Datetime appointmentDateTime,
    String symptoms,
    String visitType,
    String priority
) {

    Appointment__c app = new Appointment__c(
        Patient__c = patientId,
        Doctor__c = doctorId,
        AppointmentDate__c = appointmentDateTime,
        Symtopms__c = symptoms,
        Visit_Type__c = visitType,
        Priority__c = priority
    );

    List<Appointment__c> appointments =
        new List<Appointment__c>{ app };

    bookAppointments(appointments);

    return appointments[0];
}


  public static void bookAppointments(List<Appointment__c> appointments) {
    if (appointments == null || appointments.isEmpty()) {
            return;
        }

    validateAppointments(appointments);

    Set<Id> doctorIds = new Set<Id>();
    Set<Date> appointmentDates = new Set<Date>();

    for (Appointment__c app : appointments) {

        if (app.Doctor__c != null) {
            doctorIds.add(app.Doctor__c);
        }

        if (app.AppointmentDate__c != null) {
            appointmentDates.add(
                app.AppointmentDate__c.date()
            );
        }

    }   

    Map<String, Integer> tokenMap =
        AppointmentSelector.getNextTokenNumbers(
            doctorIds,
            appointmentDates
        );

    for (Appointment__c app : appointments) {

        String key =
            app.Doctor__c + '_' +
            String.valueOf(app.AppointmentDate__c.date());

        Integer token = tokenMap.containsKey(key)
            ? tokenMap.get(key)
            : 1;

        app.Token_Number__c = token;
        app.Status__c = 'Scheduled';

        tokenMap.put(key, token + 1);
    }

    insert appointments;
}


public static void cancelAppointment(Id appointmentId) {

    cancelAppointments(
        new Set<Id>{ appointmentId }
    );

}



   public static void cancelAppointments(Set<Id> appointmentIds) {
    if (appointmentIds == null || appointmentIds.isEmpty()) {
    return;
}

    List<Appointment__c> appointments = [

        SELECT Id,
               Status__c

        FROM Appointment__c

        WHERE Id IN :appointmentIds

    ];

    List<Appointment__c> appointmentsToUpdate =
        new List<Appointment__c>();

    for (Appointment__c app : appointments) {

        if (app.Status__c == 'Completed') {
            app.addError(
                'Completed appointments cannot be cancelled.'
            );
            continue;
        }

        if (app.Status__c == 'Cancelled') {
            app.addError(
                'Appointment is already cancelled.'
            );
            continue;
        }

        app.Status__c = 'Cancelled';

        appointmentsToUpdate.add(app);
    }

    if (!appointmentsToUpdate.isEmpty()) {
        update appointmentsToUpdate;
    }
}

public static void rescheduleAppointment(
    Id appointmentId,
    Datetime newAppointmentDate
) {

    Map<Id, Datetime> updates =
        new Map<Id, Datetime>();

    updates.put(
        appointmentId,
        newAppointmentDate
    );

    rescheduleAppointments(updates);

}
public static void rescheduleAppointments(
    Map<Id, Datetime> appointmentUpdates
) {

    if (appointmentUpdates == null || appointmentUpdates.isEmpty()) {
        return;
    }

    List<Appointment__c> appointments = [

        SELECT Id,
               Doctor__c,
               AppointmentDate__c,
               Status__c

        FROM Appointment__c

        WHERE Id IN :appointmentUpdates.keySet()

    ];

    // Collect all doctors and new appointment times
    Set<Id> doctorIds = new Set<Id>();
    Set<Datetime> appointmentTimes = new Set<Datetime>();

    for (Appointment__c app : appointments) {

        doctorIds.add(app.Doctor__c);

        appointmentTimes.add(
            appointmentUpdates.get(app.Id)
        );

    }

    // Bulk availability check
    Map<String, Boolean> availabilityMap =
        checkDoctorAvailability(
            doctorIds,
            appointmentTimes
        );

    List<Appointment__c> updateList =
        new List<Appointment__c>();

    for (Appointment__c app : appointments) {

        Datetime newTime =
            appointmentUpdates.get(app.Id);

        if (app.Status__c != 'Scheduled') {

            app.addError(
                'Only scheduled appointments can be rescheduled.'
            );

            continue;
        }

        if (newTime == null) {

            app.addError(
                'New appointment date is required.'
            );

            continue;
        }

        if (newTime < System.now()) {

            app.addError(
                'Appointment date cannot be in the past.'
            );

            continue;
        }

        String key =
            app.Doctor__c + '_' +
            String.valueOf(newTime);

        if (availabilityMap.containsKey(key)
            && !availabilityMap.get(key)) {

            app.addError(
                'Doctor is not available.'
            );

            continue;
        }

        app.AppointmentDate__c = newTime;

        updateList.add(app);
    }

    if (!updateList.isEmpty()) {

        Database.update(updateList, false);

    }
}


public static void completeAppointment(
    Id appointmentId
) {

    completeAppointments(
        new Set<Id>{ appointmentId }
    );

}

 public static void completeAppointments(Set<Id> appointmentIds) {
    if (appointmentIds == null || appointmentIds.isEmpty()) {
    return;
}

    List<Appointment__c> appointments = [

        SELECT Id,
               Status__c

        FROM Appointment__c

        WHERE Id IN :appointmentIds

    ];

    List<Appointment__c> completedAppointments =
        new List<Appointment__c>();

    for (Appointment__c app : appointments) {

        if (app.Status__c == 'Cancelled') {

            app.addError(
                'Cancelled appointment cannot be completed.'
            );

            continue;
        }

        if (app.Status__c == 'Completed') {

            app.addError(
                'Appointment already completed.'
            );

            continue;
        }

        app.Status__c = 'Completed';

        app.Check_Out_Time__c = System.now();

        completedAppointments.add(app);
    }

    if (!completedAppointments.isEmpty()) {

        update completedAppointments;

    }

}
/**
 * Shared validation method
 * Used by both bookAppointment() and AppointmentTrigger
 */
private static void validateAppointment(List<Appointment__c> appointments) {

    Set<Id> patientIds = new Set<Id>();
    Set<Id> doctorIds = new Set<Id>();
    Set<Datetime> appointmentTimes = new Set<Datetime>();

    for (Appointment__c app : appointments) {

        if (app.Patient__c != null) {
            patientIds.add(app.Patient__c);
        }

        if (app.Doctor__c != null) {
            doctorIds.add(app.Doctor__c);
        }

        if (app.AppointmentDate__c != null) {
            appointmentTimes.add(app.AppointmentDate__c);
        }
    }

    Map<Id, Patient__c> patientMap =
        AppointmentSelector.getPatients(patientIds);

    Map<Id, Doctor__c> doctorMap =
        AppointmentSelector.getDoctors(doctorIds);

    List<Appointment__c> existingAppointments =
        AppointmentSelector.getAppointments(
            doctorIds,
            appointmentTimes
        );

    Set<String> bookedSlots = new Set<String>();

    for (Appointment__c app : existingAppointments) {

        bookedSlots.add(
            app.Doctor__c + '_' +
            String.valueOf(app.AppointmentDate__c)
        );

    }

    for (Appointment__c app : appointments) {

        if (app.Patient__c == null ||
            !patientMap.containsKey(app.Patient__c)) {

            app.addError('Invalid Patient.');

            continue;
        }

        if (app.Doctor__c == null ||
            !doctorMap.containsKey(app.Doctor__c)) {

            app.addError('Invalid Doctor.');

            continue;
        }

        if (app.AppointmentDate__c == null) {

            app.addError('Appointment Date is required.');

            continue;
        }

        if (app.AppointmentDate__c < System.now()) {

            app.addError(
                'Appointment date must be in the future.'
            );

            continue;
        }

        String key =
            app.Doctor__c + '_' +
            String.valueOf(app.AppointmentDate__c);

        if (bookedSlots.contains(key)) {

            app.addError(
                'Doctor is already booked for this slot.'
            );

        }

    }

}




public static void validateAppointments(
    List<Appointment__c> appointments
) {

    validateAppointment(appointments);

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
 public static Map<String, Boolean> checkDoctorAvailability(
    Set<Id> doctorIds,
    Set<Datetime> appointmentTimes
) {

    List<Appointment__c> bookedAppointments =
        AppointmentSelector.getAppointments(
            doctorIds,
            appointmentTimes
        );

    Map<String, Boolean> availabilityMap =
        new Map<String, Boolean>();

    // Initially assume every slot is available
    for (Id doctorId : doctorIds) {

        for (Datetime appointmentTime : appointmentTimes) {

            availabilityMap.put(
                doctorId + '_' + String.valueOf(appointmentTime),
                true
            );

        }
    }

    // Mark booked slots
    for (Appointment__c app : bookedAppointments) {

        String key =
            app.Doctor__c + '_' +
            String.valueOf(app.AppointmentDate__c);

        availabilityMap.put(key, false);

    }

    return availabilityMap;
}
    /**
     * Appointment History
     */
    public static List<Appointment__c>
    getAppointmentHistory(Id patientId) {

        return AppointmentSelector.getAppointmentHistory(patientId);

    }


public static Map<Id, List<Appointment__c>>
getAppointmentHistory(Set<Id> patientIds) {

    List<Appointment__c> appointments = [

        SELECT Id,
               Patient__c,
               AppointmentDate__c,
               Status__c,
               Token_Number__c,
               Visit_Type__c,
               Priority__c,
               Check_Out_Time__c,
               Doctor__r.Name

        FROM Appointment__c

        WHERE Patient__c IN :patientIds

        ORDER BY AppointmentDate__c DESC

    ];

    Map<Id, List<Appointment__c>> historyMap =
        new Map<Id, List<Appointment__c>>();

    for (Appointment__c app : appointments) {

        if (!historyMap.containsKey(app.Patient__c)) {

            historyMap.put(
                app.Patient__c,
                new List<Appointment__c>()
            );

        }

        historyMap.get(app.Patient__c).add(app);

    }

    return historyMap;
}


}
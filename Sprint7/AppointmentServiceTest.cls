@isTest
private class AppointmentServiceTest {

    @testSetup
    static void setupData() {

        // Create Department
        Departments__c dept = new Departments__c(
            Name = 'Cardiology',
            Departemnt_Code__c = 'CARD01'
        );
        insert dept;

        // Create Patient
        Patient__c patient = new Patient__c(
            Name = 'Test Patient',  
            Gender__c = 'Male',
            Phone__c = '7416048552'

        );
        insert patient;

        // Create Doctor
        Doctor__c doctor = new Doctor__c(
            Name = 'Test Doctor',
            License_Number__c = 'DOC001',
            Email__c = 'doctor@test.com',
            Departments__c = dept.Id,
            Availabillity__c = 'Available'
        );
        insert doctor;
    }

    @isTest
    static void testBookAppointment() {

        Patient__c patient = [
            SELECT Id
            FROM Patient__c
            LIMIT 1
        ];

        Doctor__c doctor = [
            SELECT Id
            FROM Doctor__c
            LIMIT 1
        ];

        Appointment__c appointment = new Appointment__c(
            Patient__c = patient.Id,
            Doctor__c = doctor.Id,
            AppointmentDate__c = System.now().addDays(1),
            Symtopms__c = 'Fever',
            Visit_Type__c = 'New',
            Priority__c = 'Normal'
        );

        Test.startTest();

        AppointmentService.bookAppointments(
            new List<Appointment__c>{appointment}
        );

        Test.stopTest();

        Appointment__c insertedAppointment = [
            SELECT Id,
                   Status__c,
                   Token_Number__c,
                   Patient__c,
                   Doctor__c
            FROM Appointment__c
            LIMIT 1
        ];

        System.assertEquals(
            'Scheduled',
            insertedAppointment.Status__c
        );

        System.assertNotEquals(
            null,
            insertedAppointment.Token_Number__c
        );

        System.assertEquals(
            patient.Id,
            insertedAppointment.Patient__c
        );

        System.assertEquals(
            doctor.Id,
            insertedAppointment.Doctor__c
        );
    }

    @isTest
    static void testBulkBookAppointments() {

        Patient__c patient = [
            SELECT Id
            FROM Patient__c
            LIMIT 1
        ];

        Doctor__c doctor = [
            SELECT Id
            FROM Doctor__c
            LIMIT 1
        ];

        List<Appointment__c> appointments =
            new List<Appointment__c>();

        Datetime startTime =
            System.now().addDays(2);

        for(Integer i = 0; i < 200; i++){

            appointments.add(

                new Appointment__c(

                    Patient__c = patient.Id,
                    Doctor__c = doctor.Id,
                    AppointmentDate__c =
                        startTime.addMinutes(i),

                    Symtopms__c = 'Bulk Test',

                    Visit_Type__c = 'New',

                    Priority__c = 'Normal'

                )

            );

        }

        Test.startTest();

        AppointmentService.bookAppointments(
            appointments
        );

        Test.stopTest();

        Integer totalAppointments = [

            SELECT COUNT()

            FROM Appointment__c

        ];

        System.assertEquals(
            200,
            totalAppointments
        );
    }

    @isTest
    static void testInvalidPastAppointment() {

        Patient__c patient = [
            SELECT Id
            FROM Patient__c
            LIMIT 1
        ];

        Doctor__c doctor = [
            SELECT Id
            FROM Doctor__c
            LIMIT 1
        ];

        Appointment__c appointment = new Appointment__c(

            Patient__c = patient.Id,

            Doctor__c = doctor.Id,

            AppointmentDate__c =
                System.now().addDays(-1),

            Visit_Type__c = 'New',

            Priority__c = 'Normal'

        );

        Test.startTest();

        try{

            AppointmentService.bookAppointments(
                new List<Appointment__c>{appointment}
            );

            System.assert(false);

        }catch(Exception e){

            System.assert(
                e.getMessage().contains('future')
            );

        }

        Test.stopTest();
    }

}
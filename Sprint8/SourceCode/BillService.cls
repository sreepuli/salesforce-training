public with sharing class BillService {

    /**
     * Generate a bill for a single appointment.
     * Used by Queueable Apex.
     */
    public static void generateBill(Id appointmentId) {

        generateBills(
            new Set<Id>{ appointmentId }
        );

    }

    /**
     * Bulk Bill Generation
     */
    public static void generateBills(
        Set<Id> appointmentIds
    ) {

        if (appointmentIds == null ||
            appointmentIds.isEmpty()) {
            return;
        }

        // Get Appointment details
        List<Appointment__c> appointments = [

            SELECT Id,
                   Doctor__r.ConsultationFee__c

            FROM Appointment__c

            WHERE Id IN :appointmentIds

        ];

        // Existing Bills
        Map<Id, Bill__c> existingBills =
            new Map<Id, Bill__c>();

        for (Bill__c bill : [

            SELECT Id,
                   Appointment__c

            FROM Bill__c

            WHERE Appointment__c IN :appointmentIds

        ]) {

            existingBills.put(
                bill.Appointment__c,
                bill
            );

        }

        List<Bill__c> billsToInsert =
            new List<Bill__c>();

        for (Appointment__c app : appointments) {

            // Prevent duplicate bill generation
            if (existingBills.containsKey(app.Id)) {
                continue;
            }

            Bill__c bill = new Bill__c();

            bill.Appointment__c = app.Id;

            bill.Bill_Date__c = Date.today();

            bill.ConsultationFee__c =
                app.Doctor__r.ConsultationFee__c;

            bill.Medicine_Cost__c = 0;

            bill.Lab_Test_Cost__c = 0;

            bill.Payment_Status__c = 'Pending';

            billsToInsert.add(bill);

        }

        if (!billsToInsert.isEmpty()) {

            insert billsToInsert;

        }

    }

}
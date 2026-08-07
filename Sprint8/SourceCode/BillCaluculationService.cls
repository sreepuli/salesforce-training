public with sharing class BillCaluculationService {


    public static void recalculateBills(
        List<Bill__c> bills
    ){

        for(Bill__c bill : bills){


            Decimal consultation =
                bill.ConsultationFee__c == null
                ? 0
                : bill.ConsultationFee__c;


            Decimal medicine =
                bill.Medicine_Cost__c == null
                ? 0
                : bill.Medicine_Cost__c;


            Decimal lab =
                bill.Lab_Test_Cost__c == null
                ? 0
                : bill.Lab_Test_Cost__c;


            Decimal total =
                consultation +
                medicine +
                lab;


            /*
             Formula field already calculates:

             Total_Amount__c =
             ConsultationFee__c
             +
             Medicine_Cost__c
             +
             Lab_Test_Cost__c

             So Apex cannot update it.

            */


            System.debug(
                'Calculated Bill Total: ' + total
            );

        }

    }

}
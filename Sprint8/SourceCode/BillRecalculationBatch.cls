global class BillRecalculationBatch implements Database.Batchable<SObject> {


    // Start Method
    global Database.QueryLocator start(
        Database.BatchableContext bc
    ){

        return Database.getQueryLocator(

            [
                SELECT Id,
                       ConsultationFee__c,
                       Medicine_Cost__c,
                       Lab_Test_Cost__c
                FROM Bill__c
            ]

        );

    }



    global void execute(
    Database.BatchableContext bc,
    List<Bill__c> bills
        ){
            System.debug('===== EXECUTE METHOD STARTED =====');
            System.debug('Bills in this chunk: ' + bills.size());

            BillCaluculationService.recalculateBills(bills);

            update bills;
        }



    // Finish Method
   global void finish(Database.BatchableContext bc){
    System.debug('===== BATCH FINISHED =====');
}

}
public with sharing class AppointmentPostProcessingJob
implements Queueable {
    private Id appointmentId;
    public AppointmentPostProcessingJob(Id appointmentId) {
        this.appointmentId = appointmentId;
    }
    public void execute(QueueableContext context){
        BillService.generateBill(appointmentId);
        StatisticsService.updateCompletedAppointment(appointmentId);
        System.enqueueJob(new PatientNotificationJob(appointmentId));
    }

}
public with sharing class PatientNotificationJob  implements Queueable {
     private Id appointmentId;
     public PatientNotificationJob(Id appointmentId) {
         this.appointmentId = appointmentId;
     }
     public void execute(QueueableContext context){
        NotificationService.notifyCompletedAppointment(appointmentId);
     }
}
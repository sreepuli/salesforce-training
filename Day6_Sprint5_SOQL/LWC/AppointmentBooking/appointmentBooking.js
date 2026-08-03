import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

import bookAppointment
    from '@salesforce/apex/AppointmentController.bookAppointment';
import completeAppointment
    from '@salesforce/apex/AppointmentController.completeAppointment';

export default class AppointmentBooking extends LightningElement {

    patientId = null;
    doctorId = null;
    appointmentDate = null;
    symptoms = '';
    visitType = '';
    priority = '';

    visitTypeOptions = [
    { label: 'New', value: 'New' },
    { label: 'Follow-up', value: 'Follow-up' },
    { label: 'Emergency', value: 'Emergency' }
];

    priorityOptions = [
        { label: 'Normal', value: 'Normal' },
        { label: 'Urgent', value: 'Urgent' }
    ];

    handlePatientChange(event) {
        this.patientId = event.detail.recordId;
        console.log('Patient Id:', this.patientId);
    }

    handleDoctorChange(event) {
        this.doctorId = event.detail.recordId;
        console.log('Doctor Id:', this.doctorId);
    }

    handleDateChange(event) {

        console.log('Full Event:', JSON.stringify(event.detail));

        this.appointmentDate = event.target.value;

        console.log('Appointment Date:', this.appointmentDate);
    }

    handleSymptomsChange(event) {
        this.symptoms = event.target.value;
    }

    handleVisitTypeChange(event) {
        this.visitType = event.detail.value;
    }

    handlePriorityChange(event) {
        this.priority = event.detail.value;
    }

    bookAppointment() {

        console.log('========================');
        console.log('Patient:', this.patientId);
        console.log('Doctor:', this.doctorId);
        console.log('Appointment:', this.appointmentDate);
        console.log('Symptoms:', this.symptoms);
        console.log('Visit Type:', this.visitType);
        console.log('Priority:', this.priority);
        console.log('========================');

        if (!this.patientId) {
            this.showToast('Error', 'Please select a patient.', 'error');
            return;
        }

        if (!this.doctorId) {
            this.showToast('Error', 'Please select a doctor.', 'error');
            return;
        }

        if (!this.appointmentDate) {
            this.showToast('Error', 'Please select appointment date and time.', 'error');
            return;
        }

        bookAppointment({
            patientId: this.patientId,
            doctorId: this.doctorId,
            appointmentDateTime: this.appointmentDate,
            symptoms: this.symptoms,
            visitType: this.visitType,
            priority: this.priority
        })
        .then(result => {

            console.log('Appointment Created', result);

            this.showToast(
                'Success',
                'Appointment Booked Successfully',
                'success'
            );

            this.clearForm();
        })
        .catch(error => {

            console.error(JSON.stringify(error));

            this.showToast(
                'Error',
                error.body?.message || 'Unknown Error',
                'error'
            );
        });
    }

    clearForm() {

        this.patientId = null;
        this.doctorId = null;
        this.appointmentDate = null;
        this.symptoms = '';
        this.visitType = '';
        this.priority = '';
    }

    showToast(title, message, variant) {

        this.dispatchEvent(
            new ShowToastEvent({
                title,
                message,
                variant
            })
        );
    }
}
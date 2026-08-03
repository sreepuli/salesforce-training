import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

import getAppointmentHistory
    from '@salesforce/apex/AppointmentController.getAppointmentHistory';

import cancelAppointment
    from '@salesforce/apex/AppointmentController.cancelAppointment';

import rescheduleAppointment
    from '@salesforce/apex/AppointmentController.rescheduleAppointment';

import completeAppointment
    from '@salesforce/apex/AppointmentController.completeAppointment';

export default class AppointmentHistory extends LightningElement {

    patientId;
    appointments = [];

    selectedAppointmentId;
    newAppointmentDate;

    handlePatientChange(event) {
        this.patientId = event.detail.recordId;
    }

    loadHistory() {

        if (!this.patientId) {
            this.showToast(
                'Error',
                'Please select a patient.',
                'error'
            );
            return;
        }

        getAppointmentHistory({
            patientId: this.patientId
        })

        .then(result => {

            this.appointments = result.map(record => {

                return {

                    ...record,

                    doctorName: record.Doctor__r
                        ? record.Doctor__r.Name
                        : '',

                    showActions:
                        record.Status__c === 'Scheduled',

                    showCompletedTime:
                        record.Status__c === 'Completed',

                    showReschedule: false

                };

            });

        })

        .catch(error => {

            this.showToast(
                'Error',
                error.body.message,
                'error'
            );

        });

    }

    handleCancel(event) {

        const appointmentId = event.target.dataset.id;

        cancelAppointment({
            appointmentId: appointmentId
        })

        .then(() => {

            this.showToast(
                'Success',
                'Appointment Cancelled Successfully',
                'success'
            );

            this.loadHistory();

        })

        .catch(error => {

            this.showToast(
                'Error',
                error.body.message,
                'error'
            );

        });

    }

    handleReschedule(event) {

        this.selectedAppointmentId =
            event.target.dataset.id;

        this.appointments =
            this.appointments.map(app => {

                return {

                    ...app,

                    showReschedule:
                        app.Id === this.selectedAppointmentId

                };

            });

    }

    handleDateChange(event) {

        this.newAppointmentDate =
            event.target.value;

    }

    saveReschedule() {

        if (!this.newAppointmentDate) {

            this.showToast(
                'Error',
                'Please select a new appointment date.',
                'error'
            );

            return;

        }

        rescheduleAppointment({

            appointmentId:
                this.selectedAppointmentId,

            newAppointmentDate:
                this.newAppointmentDate

        })

        .then(() => {

            this.showToast(
                'Success',
                'Appointment Rescheduled Successfully',
                'success'
            );

            this.selectedAppointmentId = null;
            this.newAppointmentDate = null;

            this.loadHistory();

        })

        .catch(error => {

            this.showToast(
                'Error',
                error.body.message,
                'error'
            );

        });

    }

    handleComplete(event) {

        const appointmentId =
            event.target.dataset.id;

        completeAppointment({

            appointmentId: appointmentId

        })

        .then(() => {

            this.showToast(
                'Success',
                'Appointment Completed Successfully',
                'success'
            );

            this.loadHistory();

        })

        .catch(error => {

            this.showToast(
                'Error',
                error.body.message,
                'error'
            );

        });

    }

    showToast(title, message, variant) {

        this.dispatchEvent(

            new ShowToastEvent({

                title: title,

                message: message,

                variant: variant

            })

        );

    }

}
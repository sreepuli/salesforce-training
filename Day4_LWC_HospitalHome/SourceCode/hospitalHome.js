import { LightningElement } from 'lwc';

export default class HospitalHome extends LightningElement {

    hospitalName = 'Vishnu Hospital';

    doctorName = 'Dr. Priya Sharma';

    departmentName = 'Cardiology';

    todayDate = new Date().toLocaleDateString();

    patients = 120;

    doctors = 18;

    appointments = 56;

    departments = 7;

    appointmentStatus = 'Not Booked';

    welcomeMessage = '';

    showWelcome() {

        this.welcomeMessage = 'Welcome to Hospital OPD Management System';

    }

    bookAppointment() {

        this.appointmentStatus = 'Booked Successfully';

    }

}
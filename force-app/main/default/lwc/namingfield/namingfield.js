import { LightningElement, track } from 'lwc';
import { createRecord } from 'lightning/uiRecordApi';
import EVT_OBJECT from '@salesforce/schema/Event__c';
import Name_F from '@salesforce/schema/Event__c.Name__c';
import Startingdate__c from '@salesforce/schema/Event__c.Startingdate__c';
import End_Date_Time__c from '@salesforce/schema/Event__c.End_Date_Time__c';
//import Max_Seats__c from '@salesforce/schema/Event__c.Max_Seats__c';
import Location_project__c from '@salesforce/schema/Event__c.Location_project__c';
import Event_Detail__c from '@salesforce/schema/Event__c.Event_Detail__c';


import { NavigationMixin } from 'lightning/navigation';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class AddEvent extends NavigationMixin(LightningElement) {

    @track eventRecord = {
        Name__c: '',
        Event_Organizer__c: '',
        Startingdate__c: null,
        End_Date_Time__c: null,
       // Max_Seats__c: null,
       Location_project__c: '',
        //Event_Detail__c: ''
    }

    @track errors;

    handleChange(event) {
        let value = event.target.value;
        console.log(value);
        let name = event.target.name;
        console.log(value);
        this.eventRecord[name] = value;
    }



    handleLookup(event) {
        let selectedRecId = event.detail.selectedRecordId;
        let parentField = event.detail.parentfield;
        this.eventRecord[parentField] = selectedRecId;
        // selectedRecId = aiwue7836734834
        // Location__c
        // this.eventRecord[Location__c] = selectedRecId;
    }

    handleClick() {
        const fields = {};
        fields[Name_F.fieldApiName] = this.eventRecord.Name;
        console.log(Name_F);
        fields[Event_Organizer__c.fieldApiName]=this.eventRecord.Event_Organizer__c;
        fields[Startingdate__c.fieldApiName]=this.eventRecord.Startingdate__c;
        fields[End_Date_Time__c.fieldApiName]=this.eventRecord.End_Date_Time__c;
        fields[Location_project__c.fieldApiName]=this.eventRecord.Location_project__c;
           

    const eventRecord = { apiName: EVT_OBJECT.objectApiName, fields };

        createRecord(eventRecord)
            .then((eventRec) => {
                this.dispatchEvent(new ShowToastEvent({
                    title: 'Record Saved',
                    message: 'Event Draft is Ready',
                    variant: 'success'
                }));
                this[NavigationMixin.Navigate]({
                    type: 'standard__recordPage',
                    attributes: {
                        actionName: "view",
                        recordId: eventRec.id
                    }
                });
            }).catch((err) => {
                this.errors = JSON.stringify(err);
                this.dispatchEvent(new ShowToastEvent({
                    title: 'Error Occured',
                    message: this.errors,
                    variant: 'error'
                }));
            });
    }

    handleCancel() {
        this[NavigationMixin.Navigate]({
            type: 'standard__objectPage',
            attributes: {
                actionName: "home",
                objectApiName: "Event__c"
            }
        });
    }
}
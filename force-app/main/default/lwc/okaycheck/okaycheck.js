import { LightningElement, api, track } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';
import {encodeDefaultFieldValues} from 'lightning/pageReferenceUtils';
import getSpeakers from '@salesforce/apex/EventDetailsController.getSpeakers';
import getLocationDetails from '@salesforce/apex/EventDetailsController.getLocationDetails';
import getAttendees from '@salesforce/apex/EventDetailsController.getAttendees';

const columns = [
    { label: 'Name', 
    fieldName: 'Name',
    cellAttributes: {
        iconName: 'standard:user',
        iconPosition: 'left',
    }  },
    { label: 'Email', fieldName: 'Email',  type: 'email'},
    { label: 'Phone', fieldName: 'Phone',  type: 'phone'},
    { label: 'Company Name', fieldName: 'CompanyName'},
    {
        label: 'Location',
        fieldName: 'Location',
        cellAttributes: {
          iconName: "utility:location",
          iconPosition: "left"
        }
    }
];

const columnAtt=[
    { label: 'Name', fieldName: 'Name',
    cellAttributes: {
        iconName: 'standard:user',
        iconPosition: 'left',
    }},
    { label: 'Email', fieldName: 'Email',  type: 'email'},
    //{ label: 'Company Name', fieldName: 'CompanyName'},
    {
        label: "Location",
        fieldName: "Location",
        cellAttributes: {
          iconName: "utility:location",
          iconPosition: "left"
        }
    }
];


export default class Okaycheck extends NavigationMixin(LightningElement) {

    @api recordId;
    @track Speakerlist;
    errors;
    @track eventRec;
    @track atL;
    columnList=columns;
    columndata=columnAtt;

    handleSpeakerActive(){
        getSpeakers({
            eventId :this.recordId
        })
        .then((result) =>{
            result.forEach((speaker) => {
                
                speaker.Name = speaker.Speaker__r.Name,
                speaker.Email = speaker.Speaker__r.Email__c,
                speaker.Phone = speaker.Speaker__r.Phone__c,
                speaker.CompanyName =speaker.Speaker__r.Company__c
                //speaker.Location_project__c=speaker.Speaker__r.Location_project__c;
                if(speaker.Location_project__c){
                    speaker.Location = speaker.Location_project__r.Name;
                }
                else{
                    speaker.Location = 'Hey if this works ou great mama!'
                }
            });
            window.console.log('result is :', result)
            this.Speakerlist=result;
            this.errors=undefined;

        }).catch((err) =>{
            this.errors=err;
            this.Speakerlist=undefined;

        });
    }

    handleLocationDetails(){
        getLocationDetails({
            eventId : this.recordId
        }).then((result) => {
            if (result.Location_project__c) {
                this.eventRec=result;
            }
            else{
                this.eventRec=undefined;
            }
            this.errors=undefined;
        }).catch((err) => {
            this.errors = err;
            this.Speakerlist = undefined;
        });
    }    

    handleEventAttendee(){
        getAttendees({
            eventId : this.recordId
    })
    .then((result) =>{
        result.forEach((att) => {
            att.Name=att.Attendee__r.Name,
            att.Email=att.Attendee__r.Email__c,
            att.CompanyName=att.Attendee__r.Company_Name__c
            //att.Location = att.Attendee__r.Location_project__r.Name;
            if (att.Attendee__r.Location_project__c){
                att.Location=att.Attendee__r.Location_project__r.Name;
            } else{
                att.Location='I dont want to say';
            }
        });
        //this.atL = JSON.parse(JSON.stringify(result));
        window.console.log('result is :', result);
        this.atL= result;
        this.errors=undefined;
    }).catch((err) =>{
        this.errors=err;
        this.Speakerlist=undefined;
    });
    }

    createSpeaker() {
        const defaultValues = encodeDefaultFieldValues({
          Event__c: this.recordId
        });
        this[NavigationMixin.Navigate]({
          type: "standard__objectPage",
          attributes: {
            objectApiName: "Event_Speaker__c",
            actionName: "new"
          },
          state: {
            defaultFieldValues: defaultValues
          }
        });
      }
      createAttendee() {
        const defaultValues = encodeDefaultFieldValues({
          Event__c: this.recordId
        });
        this[NavigationMixin.Navigate]({
          type: "standard__objectPage",
          attributes: {
            objectApiName: "Event_Attendee__c",
            actionName: "new"
          },
          state: {
            defaultFieldValues: defaultValues
          }
        });
      }

}
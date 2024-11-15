import { LightningElement, track, api } from 'lwc';
import futureList from '@salesforce/apex/ListforSpeaker.futureList'
import pastList from '@salesforce/apex/ListforSpeaker.pastList';
/*columnList = [
    {
        fieldName : "Name",
        label : "Event Name",
        type : "url"
    }
];*/
const columns = [
    {
        label : "Event Name",
        fieldName : "detailsPage",  
        type : "url",
        wrapText: "true",
        typeAttributes: {
            label: { fieldName: "Name" }
          }
    },
    {
        fieldName : "StartDate",
        label :" start date",
        type: "date"
    }

];

export default class ListforSpeaker extends LightningElement {

    @api recordId;
    @track eventP;
    @track result;
    @track eventF;
    columnList=columns;

    connectedCallback(){
        this.upcomngEvents();
        this.pastliEvents();

    }

    upcomngEvents(){
        futureList({
            attendeeId : this.recordId
        })
        .then((result) =>
        {
            result.forEach((record) => 
            {
                record.Name =record.Event__r.Name__c;
                record.detailsPage = "https://" + window.location.host + "/" + record.Event__c;
                record.StartDate = record.Event__r.Startingdate__c;
            });
            this.eventF = result;
            this.error = undefined;
        })
        .catch((error) => 
        {
            this.eventF = undefined;
            this.error = JSON.stringify(error);
        });
    }


    pastliEvents(){
        pastList({
            attendeeId : this.recordId
        })
        .then((result) =>
        {
            result.forEach((record) =>
            {
                record.Name = Event__r.Name__c;
                record.detailsPage = "https://" + window.location.host + "/" + record.Event__c;
                record.StartDate = record.Event__r.Startingdate__c;
            });
            this.eventP = this.result;
            this.error = undefined;
        })
        .catch((error) => 
        {
            this.eventP = undefined;
            this.error = JSON.stringify(error);
        });
    }
}
import { LightningElement, track, api } from 'lwc';
import upcomingEvents from '@salesforce/apex/upcomingPastEvents.upcomingEvents';
import pastEvents from '@salesforce/apex/upcomingPastEvents.pastEvents';

const columns = [
    {
        label : "Event Name",
        fieldName : "detailsPage",  
        type : "url",
        wrapText: "true",
        typeAttributes: {
            label: { fieldName: "Name" }
          }
    }
];

export default class AttendeeEventList extends LightningElement {

    @api recordId;
    columnsList = columns;
    @track upcomeevents;
    @track pastEvens;
    error;

    connectedCallback(){
        this.upcomingEven();
        this.pasteven();
    }

    upcomingEven(){
        upcomingEvents(
            {
                attendeeId : this.recordId
            })
            .then((result) => {
                result.forEach(record => {
                    record.Name = record.Event__r.Name__c;
                    record.detailsPage =
            "https://" + window.location.host + "/" + record.Event__c;                    
                });
        //end of inner function
            this.upcomeevents = result;
            this.errors = undefined;
        })
        .catch((error) => {
            this.upcomeevents = undefined;
            this.errors = JSON.stringify(error);
        });
    }


    pasteven(){
        pastEvents({
            attendeeId: this.recordId
        })
        .then((result) =>
        {
            result.forEach(element => {
            element.Name = element.Event__r.Name__c;
            element.detailsPage = "https://" + window.location.host + "/" + element.Event__c;                    
        
        });

        this.pastEvens = result;
        this.error = undefined; 
    })
    .catch((error) => {
        this.pastEvens = undefined;
        this.error = JSON.stringify(error);
    });
    }
}
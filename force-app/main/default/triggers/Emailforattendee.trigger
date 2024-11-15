trigger Emailforattendee on Event_Attendee__c (after insert) {

    if(Trigger.isAfter && Trigger.isInsert){
        EventAttendeeTriggerHandlerT.sendConfirmationEmail(Trigger.New);
    } 
    
}
public with sharing class upcomingPastEvents {
    @AuraEnabled
    public static List<Event_Attendee__c> upcomingEvents(String attendeeId) {

        List<Event_Attendee__c> upcomingList = [Select Id, Event__c, Event__r.Name__c from Event_Attendee__c where
        Attendee__c = :attendeeId and Event__r.startingdate__c >= Today];

        return upcomingList;
    }

    @AuraEnabled
    public static List<Event_Attendee__c> pastEvents(String attendeeId){

        List<Event_Attendee__c> pastList = [Select Id, Event__c, Event__r.Name__c from Event_Attendee__c where 
        Attendee__c = :attendeeId and Event__r.startingdate__c < Today];

        return pastList;
    }
}
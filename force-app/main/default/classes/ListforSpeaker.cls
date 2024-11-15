public with sharing class ListforSpeaker {

    @AuraEnabled
    public static List<Event_Speaker__c> pastList(Id attendeeId) {
        List<Event_Speaker__c> escL = [Select Id, Name, Event__c, Event__r.Name__c , Event__r.Startingdate__c from Event_Speaker__c
                where Event__r.startingdate__c >= TODAY and Event__r.Live__c = True];

        return escL;
    }

    @AuraEnabled
    public static List<Event_Speaker__c> futureList(Id attendeeId) {
        List<Event_Speaker__c> escLp = [Select Id, Name, Event__c, Event__r.Name__c, Event__r.Startingdate__c from Event_Speaker__c
        where Event__r.startingdate__c < TODAY];

        return escLp;
    }
}
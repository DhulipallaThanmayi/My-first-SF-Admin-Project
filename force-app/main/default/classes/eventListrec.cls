public with sharing class eventListrec {

@AuraEnabled
public static List<Event__c> dtatTable(){
    
    List<Event__c> query1 = [Select Id, Name, Name__c,Event_Detail__c, Location_project__c,
                Location_project__r.Name,Startingdate__c, Event_Organizer__c, 
                Event_Organizer__r.Name from Event__c where Live__c=True and 
                Startingdate__c>=Today];
    return query1;
}
}
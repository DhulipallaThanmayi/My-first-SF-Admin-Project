public with sharing class EventDetailsController {
    @AuraEnabled
    public static List<Event_Speaker__c> getSpeakers(String eventId) {
        List<Event_Speaker__c> Speakerlist = [Select 
        Id, Name, Speaker__c,
        Speaker__r.Name,
        Speaker__r.Email__c,
        Speaker__r.Phone__c,
        Speaker__r.Company__c,
        Event__c, 
        Event__r.Location_project__c,
        Event__r.Location_project__r.Name
        //Speaker__r.Location_project__c,
        //Event_Speaker__r.Event__c,
        //Event_Speaker__r.Event__r.Location_project__c,
        //Event_Speaker__r.Event__r.Location_project__r.Name
        from Event_Speaker__c where Event__c =: eventId WITH SECURITY_ENFORCED];
        return Speakerlist;
    
       // Speaker__r.Picture__c,
        //Speaker__r.About_Me__c
    }
    @AuraEnabled
    public static List<Event_Attendee__c> getAttendees(String eventId) {
        List<Event_Attendee__c> atL = [Select 
        Id, Name, Attendee__c,
        Attendee__r.Name,
        Attendee__r.Email__c,
        Attendee__r.Company_Name__c,
        Attendee__r.Location_project__c,
        Attendee__r.Location_project__r.Name,
        Attendee__r.Phone__c from Event_Attendee__c where Event__c =: eventId WITH SECURITY_ENFORCED];
        return atL;
        //,
        //Attendee__r.Picture__c,
       // Attendee__r.About_Me__c
    }
    @AuraEnabled
    public static Event__c getLocationDetails(String eventId) {
        Event__c eventRecord = [
          SELECT
            Id,
            Name__c,
            Location_project__c,
            Location_project__r.Name,
            Location_project__r.City__c,
            Location_project__r.Country__c,
            Location_project__r.Landmark__c,
            Location_project__r.Postal_Code__c,
            Location_project__r.State__c,
            Location_project__r.Street__c
          FROM Event__c
          WHERE Id = :eventId
          WITH SECURITY_ENFORCED
        ];
        return eventRecord;
      }

}
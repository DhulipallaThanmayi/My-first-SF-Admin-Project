public with sharing class Batchingclass implements DataBase.Batchable<Account> {

    public Iterable<Account> start(Database.BatchableContext bc) {
        return new List<Account>([select Id, Total_Contact_Value__c,LastModifiedById,	LastModifiedBy.Name, (Select Id,Last_Updated_By__c,
         Annual_Revenue__c from Contacts) from Account]);
    }

    public void execute(Database.BatchableContext bc, List<Account> accList){

        List<Contact> contactsToUpdate = new List<Contact>();
        for(Account ac: accList){
            Decimal Total = 0;
            for(Contact con: ac.Contacts){
                if(con.Annual_Revenue__c != null){
                    system.debug(con.Annual_Revenue__c);
                    Total = Total + con.Annual_Revenue__c;
                    system.debug(Total);
                    con.Last_Updated_By__c = ac.LastModifiedBy.Name;
                    contactsToUpdate.add(con);
                }
            }
            ac.Total_Contact_Value__c = Total;
            system.debug(ac.Total_Contact_Value__c);
            system.debug(contactsToUpdate);
        }
        update accList;
        update contactsToUpdate;
        System.debug(accList);
        system.debug(contactsToUpdate);
    }

    public void finish(DataBase.BatchableContext bc){
        //System.debug(accList);
        System.debug('Finish');
    }
}
/*public with sharing class BatchPrctise2 implements DataBase.Batchable<Account> {

    public Iterable<Account> start(Database.BatchableContext bc) {
        return new List<Account>([select Id, Total_Contact_Value__c,LastModifiedById, (Select Id,Last_Updated_By__c,
         Annual_Revenue__c from Contacts where Annual_Revenue__c!=Null) from Account]);
    }

    public void execute(Database.BatchableContext bc, List<Account> accList){

        List<Contact> contactsToUpdate = new List<Contact>();
        for(Account ac: accList){
            Decimal Total = 0;
            for(Contact con: ac.Contacts){
                if(con.Annual_Revenue__c != null){
                    system.debug(con.Annual_Revenue__c);
                    Total = Total + con.Annual_Revenue__c;
                    system.debug(Total);
                    con.Last_Updated_By__c = ac.LastModifiedById;
                    contactsToUpdate.add(con);
                }
            }
            ac.Total_Contact_Value__c = Total;
            system.debug(ac.Total_Contact_Value__c);
            system.debug(contactsToUpdate);
        }
        update accList;
        update contactsToUpdate;
        System.debug(accList);
        system.debug(contactsToUpdate);
    }

    public void finish(DataBase.BatchableContext bc){
        //System.debug(accList);
        System.debug('Finish');
    }
}*/
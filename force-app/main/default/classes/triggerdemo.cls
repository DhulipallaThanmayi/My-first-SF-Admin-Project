public class triggerdemo {
    /*public static void student(ID x){
        List<Account> ids=[Select Id,totalstudents__c from Account where Account.Id=:x];
        system.debug(ids);
        //integer LatestNumber = Integer.valueOf(ids[1].totalstudents__c);
        if(ids.size()>0){
            system.debug(ids.size());
        for(Account acc : ids){
            acc.totalstudents__c= acc.totalstudents__c + 1 ;//LatestNumber+1;
             system.debug(acc.totalstudents__c);
            }
    }
        update ids;
    }
    public static void teacher(ID x)
    {
        List<Account> ids=[Select Id,totalteachers__c from Account where Account.Id=:x];
         if(ids.size()>0){
             system.debug(ids.size());
        for(Account acc : ids){
        acc.totalteachers__c+=1.00;
            system.debug(acc.totalteachers__c);
        }
}
        update ids;
    }
    */
    public static void deleteInsertUndeleteUpdate(List<Contact> conLi){
        List<Account> acLi = new List<Account>();
        Set<Id> accIds = new Set<Id>();
        for(Contact con : conLi){
            if(con.AccountId !=Null){
            	accIds.add(con.AccountId);
            }
        }
        for(Account ac : [Select Id,(Select Id from Contacts) from Account where Id IN: accIds ]){
            ac.contacts_from_trigger__c = ac.Contacts.size();
            acLi.add(ac);
        }
        if(!acLi.isEmpty()){
        	update acLi;
        }
    } 
}
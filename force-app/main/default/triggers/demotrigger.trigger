trigger demotrigger on Contact (before insert, after delete, after undelete, after insert){//, before update) {
    
    /*for(Contact con: Trigger.new){
        if(con.AccountId!=Null){
            system.debug(con.AccountId);
        if(con.isstudent__c==True){
            system.debug(con.isstudent__c);
            triggerdemo.student(con.AccountId);
        }
        else{
            triggerdemo.teacher(con.AccountId);
        }
    }
    }*/
    
   
        if(trigger.isDelete){
             if(trigger.isAfter){
            triggerdemo.deleteInsertUndeleteUpdate(trigger.old);   
            system.debug('deleted');
        }
    }
    
        if(trigger.isUndelete){
            if(trigger.isAfter){
            triggerdemo.deleteInsertUndeleteUpdate(trigger.new);    
            system.debug('UNdeleted');
        }
    }
    
        if(trigger.isInsert){
            if(trigger.isAfter){
            triggerdemo.deleteInsertUndeleteUpdate(trigger.new); 
            system.debug('inserted');
        }
    }
}
    

    
    
    
    /*List<Account> ids=[Select Id from Account];
    List<Account> val=[Select totalstudents__c,	totalteachers__c from Account];
	    
    Integer value=1;
    Integer value1=1;
     value=Integer.valueOf(val[0].totalstudents__c);
     value1=Integer.valueOf(val[1].totalteachers__c);
    //List<Contact> cont=[Select Id from Contact where isstudent__c=True];
    for(Contact con: Trigger.new){
        if(con.AccountId==ids){
        if(con.isstudent__c==True){//} && con.AccountId{
            //Take 'contact - AccountId' associated value and update the value in Account 
        value ++;
        
        //List<Account> val=[Select totalstudents__c from Account where Account.Id IN [Select AccountId from Contact where isstudent__c=True]];
        //Integer coun=val.;
        //coun++;
        //SELECT Id, Name,isstudent__c, Account.totalstudents__c FROM Contact where isstudent__c=True
        }
        else{
            value1++;
            
        }
        //}
    //}
}
    }*/
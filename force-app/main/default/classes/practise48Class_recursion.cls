public class practise48Class_recursion {
    /*public static void MethodRecursive(List<Account> AccLis, Map<Id, Account> mapis){
        List<Account> lisA  = new List<Account>();
        for(Account ac : AccLis){
            //if(ac.AnnualRevenue> 200000 && mapis.get(ac.Id).AnnualRevenue <200000){
                Account aa =  new Account();
                aa.Id = ac.Id;
                aa.AnnualRevenue = ac.AnnualRevenue +1;
                lisA.add(aa);
            }
        //}
        update lisA;
    }*/
    public static void Opportuniytmethod(List<Opportunity> opoList, Map<Id, Opportunity> opMap){
        List<Opportunity> opptoUpdate = new List<Opportunity>();
        for(Opportunity op : opoList){
            Opportunity newOp = new Opportunity();
            newOp.Id = op.Id;
            if((op.StageName =='ClosedLost' && opMap.get(op.Id).StageName!=op.StageName)){
                newOp.Description = 'The Stage now is '+ op.StageName;
                system.debug(newOp.Description);
            }
            else if(op.StageName =='ClosedWon' && opMap.get(op.Id).StageName!=op.StageName){
                   newOp.Description = 'The Stage now is '+ op.StageName;
                system.debug(newOp.Description);
            }
            opptoUpdate.add(newOp);
    	}
        if(!opptoUpdate.isEmpty()){
        	update opptoUpdate;
        }
    }
    
    public static void vaidationViaTrigger(List<Opportunity> LisoPP){
        //DataBase.SaveResult[] srList = Database.insert(LisoPP, false);
        for(Opportunity op : LisoPP){
            if(op.Amount==Null){
                op.addError('Enter Amount');
            }
        }
    }
}
// Another triggr that cause s recursion.For example, an ‘after update’ trigger on an object
//that updates the same records, thereby re-triggering itself. 
/* trigger UpdateContactTrigger on Contact (after update) {

    List<Contact> contactsToUpdate = new List<Contact>();

    for (Contact c : Trigger.new) {

        Contact oldContact = Trigger.oldMap.get(c.Id);

        if (c.LastModifiedDate != oldContact.LastModifiedDate) {

            c.UpdateCount__c = c.UpdateCount__c + 1;

            contactsToUpdate.add(c);

        }

    }

    update contactsToUpdate;

}*/
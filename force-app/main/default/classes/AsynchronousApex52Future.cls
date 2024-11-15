public class AsynchronousApex52Future {
    /* demo
    @Future
    public static void futurAccounCases(List<Id> accIds){
        
        List<Account> accList = [Select Id, (Select Id from Cases) from Account where Id IN: accIds];
        for(Account ac : accList){
            ac.Case_Count_via_Future_method__c = ac.Cases.size();
            system.debug(ac.Case_Count_via_Future_method__c);
        }
        if(!accList.isEmpty()){
            update accList;
        }
    }*/
    //Practise
    @Future
    public static void practiseFutureMethod(List<Id> accListti){
        List<Account> acLii  = [Select Id, Case_Count_by_Phone__c, Case_count_by_Web__c,Case_count_by_Email__c,
                                Case_Count_via_Future_method__c,
                                (Select Id,Origin from Cases) from Account where Id IN : accListti];
        //Map<String, Integer> caseCout = new Map<String, Integer>();
        Integer webcase=0;
        Integer Phcase=0;
        Integer Emacase=0;
        for(Account ac : acLii){
            for(Case c : ac.Cases){
                if(c.Origin == 'Web'){
                    webcase +=1;
                }
                else if (c.Origin == 'Phone'){
                    Phcase+=1;
                }
                else if(c.Origin == 'Email'){
                    Emacase+=1;
                }
        	}
            ac.Case_Count_by_Phone__c = Phcase;
            ac.Case_count_by_Web__c = webcase;
            ac.Case_count_by_Email__c = Emacase;
		}
        if(!acLii.isEmpty()){
            update acLii;
            system.debug(acLii);
        }
	}
}
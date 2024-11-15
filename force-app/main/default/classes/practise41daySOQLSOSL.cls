public class practise41daySOQLSOSL {
    public static void DemoedinSession(){
        //completed in public class practiseClass42 
    }
    public static void refrenceVideos(){
        //2 are done in public class practiseClass42 
        //3 
        /*List<Account> lisA = [Select Id, Name,Total_Salary_from_Review__c, (Select Id, Salary__c from Reviews__r)
                              from Account where CreatedDate= THIS_YEAR];
        for(Account a : lisA){
            Integer Total =0;
            for(Review__c r : a.Reviews__r){
                Total= Total + (Integer) r.Salary__c;
                system.debug(Total);
            }
            a.Total_Salary_from_Review__c= Total;
        }
        system.debug(lisA);
        if(!lisA.isEmpty()){
        update lisA;
        }*/
     //4
		/*List<Review__c> r = [Select Id, Name, Account__r.Rating  from Review__c where Rating_from_Account__c=Null];
        system.debug(r);
        if(!r.isEmpty()){
            for(Review__c rat : r){
            	rat.Rating_from_Account__c=rat.Account__r.Rating;
	        	}
        }
        update r;
        system.debug(r);
    }*/
    //5
    	/*List<Account> lsi = [Select Id, Name, Phone, (Select Id, Phone from Contacts) from Account where CreatedDate = THIS_YEAR and Phone!=Null];
        for(Account a : lsi){
            for(Contact c : a.Contacts){
                c.Phone = a.Phone;
            }
        }
        update lsi;
        system.debug([Select Phone from Contact where Phone!=Null]);*/
    }
    public static void SelfPrectise(){
        //1 Parent to child soql
        system.debug('1 Parent to child soql');
        system.debug([Select Id, Name, (Select LastName, Phone from Contacts) from Account where CreatedDate = : system.today()]);
        
        //2 Child to Parent SOQL
        system.debug('2 Child to Parent SOQL');
        system.debug([Select Id, LastName, Account.Phone, Account.AnnualRevenue from Contact where CreatedDate < THIS_WEEK]);
        
        //3 Parent to Child SOQL
        system.debug('3 Parent to Child SOQL');
        system.debug([Select Id,Name, Phone,(Select Id, Name, CloseDate, StageName from Opportunities) from Account where Phone!=Null order by CreatedDate Asc]);
    
    	//4
    	system.debug('4 Parent to Child SOQL');
        system.debug([Select Position__r.Id, Id from Job_Application__c]);
    	
    	//5
    	system.debug('5 Parent to Child SOQL');
        system.debug([Select Candidate__r.Id, Id from Job_Application__c]);
        
        //6
    	system.debug('6 Parent to Child SOQL');
        system.debug([Select Job_Application__r.Id, Id from Review__c]);
        
        //7
    	system.debug('7 Child to Parent SOQL');
        system.debug([Select Id,Position__r.Id, Candidate__r.Id from Job_application__c]);
    }
}
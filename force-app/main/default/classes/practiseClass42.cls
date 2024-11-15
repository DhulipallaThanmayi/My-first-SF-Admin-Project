public class practiseClass42 {
//LOL this is class 41 not 42
    
   /* public static void method1(){
        AggregateResult[] grpd = [Select Sum(Amount), 
                                   AccountId from 
                                   Opportunity group by 
                                   AccountId ];
        system.debug(grpd);
        for(AggregateResult ar : grpd){
            system.debug('Acc Id: '+ ar.get('AccountId'));
            system.debug('Sum of Amount= '+ ar.get('expr0'));
        }
    }
    public static void method2(){
        AggregateResult[] gpdd = [Select Account.Name, 
                                  Sum(Amount) amt from 
                                  Opportunity group by Account.Name];
        for(AggregateResult arr: gpdd){
            system.debug('Acc Name: ' + arr.get('Name'));
            system.debug('Sum of Amount = ' + arr.get('amt'));
        }
    }
        Integer AR =1000;
        for(Account acc: [Select Id from Account where 
                          AnnualRevenue >= :AR and AnnualRevenue <=10000]){
                              system.debug(acc.Id);
                          }
    }
       List<Position__c> lisacc = new List<Position__c>();
       lisacc = [Select Id, Name, (Select Id, Name from Job_Applications__r) from Position__c];
        for(Position__c acc : lisacc){
            system.debug(acc.Name + ' : is the Acc Name');
            for(Job_Application__c con : acc.Job_Applications__r){
                system.debug(con.Name);
        }
     }
    public static void method3(){
        List<Account> lisA = [Select Id, Name, (Select Id, LastName from Contacts) from Account where CreatedDate = LAST_MONTH];
        if(!lisA.isEmpty()){
        for(Account a : lisA){
            a.Total_Contacts__c = a.Contacts.size();
        }
        }
        system.debug(lisA);
    }*/
    /*public static void method4(){
        
        List<Contact> cont = [Select Id, Name,Phone, CreatedDate, Account.Phone from Contact where 
                             CreatedDate =today and Phone=NULL];
        system.debug(cont);
        if(!cont.isEmpty()){
        for(Contact c : cont){
            c.Phone=c.Account.Phone;
        }
        }
        system.debug(cont);
    }*/
    public static void method5(){
        //Parent to Child SOQL
        /*List<Account> cont = [Select Id, Name,Phone, CreatedDate, (Select Phone from Contacts) from Account where CreatedDate =LAST_Week and Phone!=Null];
        system.debug(cont);
        List<Contact> conLi = new List<Contact>();
        if(!cont.isEmpty()){
            for(Account a : cont){
                    for(Contact c : a.Contacts){
                    	c.Phone=a.Phone;
                        system.debug(a.Phone +'->'+c.Phone);
                        conLi.add(c);
                }
            }
        update conLi;
        }
        system.debug(conLi);*/
        //using Maps
        List<Account> la = [select Id, Phone from Account where Phone!=Null];
        //getting a list where Phone no. is not null
        Map<Id, Account> mapA = new Map<Id, Account>(la);
        //converting the list to maps not sure why
        List<Contact> lc = [Select Id, Phone, AccountId from Contact where AccountId IN : mapA.KeySet()];
        //getting the contacts wherw the AccountIds are in Map keyset Ids
        for(Contact c : lc){
            //fr contacts in the list we got I will update the phone no. to get the accountId
            c.Phone = mapA.get(c.AccountId).Phone;
        }
        update lc;
        system.debug(lc);
    }
}
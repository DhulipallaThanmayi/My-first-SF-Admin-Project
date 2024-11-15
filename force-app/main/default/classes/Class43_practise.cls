public class Class43_practise {
    public static void method990(){
        List<Contact> conLi = [Select Id, Name,MobilePhone, (Select Id, Phone__c,Contact__c from Employees__r) from Contact where
                                CreatedDate = LAST_week and Phone=NULL];
        system.debug(conLi);
        if(!conLi.isEmpty()){
            for(Contact c : conLi){
                    for(Employee__c t : c.Employees__r){
                        if(t.Phone__c!=Null && t.Contact__c!=Null){
                    		c.Phone = t.Phone__c;
                        }}
            }
            update conLi;
            system.debug(conLi);
        }
    }
     /* public static void method9(){
        List<Employee__c> opl = [Select Id, Name,Phone__c, Account__c,Account__r.Phone from Employee__c where CreatedDate = THIS_YEAR];
        system.debug(opl);
        if(!opl.isEmpty()){
        	for(Employee__c e : opl){
        		if(e.Phone__c==Null){
                	e.Phone__c = e.Account__r.Phone;
                }
            }
            update opl;
        }
    }
    public static void method1(){
        List<Employee__c> mm = [Select Id from Employee__c where Account__c!=Null];
        List<Account> nm = [Select Id, Total_Salary__c, (Select Id, Salary__c from Employees__r) from Account where CreatedDate = THIS_YEAR];
        system.debug(nm);
        if(!nm.isEmpty()){
        	for(Account a : nm){
                for(Employee__c e : a.Employees__r){
                    if(e.Salary__c!=Null){
                        a.Total_Salary__c = 0;
            			a.Total_Salary__c = a.Total_Salary__c + e.Salary__c;
                    }}}}
        update nm;
        system.debug(nm);
        
    }
    /*public static void method2(){
        List<Account> liA = [Select Name, Phone, (Select LastName from Contacts) from Account where Phone!=Null];
        for(Account a :liA){
            for(Contact c : a.Contacts){
        	system.debug(a.Name +'-->'+c.LastName);
        }
        }
    }
    public static void method3(){
        Decimal ottal =0;
        List<Account> liA = [Select Name, Phone, (Select Id, Amount from Opportunities) from Account where Phone!=Null];
        if(!liA.isEmpty()){
        for(Account a :liA){
            for(Opportunity op : a.Opportunities){
                if(op.Amount!=NUll){
                ottal = ottal + op.Amount;
                }}
            system.debug(a.Name +'-'+ottal);
        }
        }
        
    }
    public static void method4(){
        List<Opportunity> lo = [Select Id, Name,StageName,Description from Opportunity where CreatedDate = THIS_YEAR];
        system.debug(lo);
        for(Opportunity op : lo){
            if(op.StageName == 'Closed Won'){
                op.Description = 'Descripted ad Closed Won';
            }
            else if(op.StageName =='Closed Lost'){
                op.Description = 'Descripted as Closed Lost';
            }
            else
                op.Description = 'Descripted as OPEN';
        }
        update lo;
        system.debug(lo);
    }
    public static void method6(){
		List<Account> loa= [Select Id, Name, total_contact_count__c,(select Id from Contacts) from Account where CreatedDate =  THIS_YEAR];
        for(Account a : loa){
            if(a.contacts.size()>0){
            a.total_contact_count__c = a.contacts.size();
            }
            else {a.total_contact_count__c= 0;}}
        update loa;
    }
    public static void method6(){
        List<Contact> lisAcc = [Select Id, Name,MobilePhone,Account.Phone from Contact where CreatedDate=THIS_YEAR and MobilePhone=Null];
        for(Contact c : lisAcc){
            if(c.Account.Phone!=Null){
                c.MobilePhone=c.Account.Phone;
            }
        }
        update lisAcc;
    }*/
}
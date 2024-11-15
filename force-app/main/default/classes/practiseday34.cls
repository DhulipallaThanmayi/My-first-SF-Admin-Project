public class practiseday34 {

    //1
    public static Id createAccoutn(){
        //List<Account> acc = new List<Account>();
        Account a = new Account (Name='Thanmayi', AnnualRevenue=100009, Type='Prospect');
        //acc.add(a);
        insert a;
        return a.Id;
    }
    
    //2 calling method 1
    public static void createAccoutnandContact(){
        Id acId = createAccoutn();
       // List<Contact> acc = new List<Contact>();
        Contact a = new Contact (LastName='Thanmayi', Phone='9154339785');
        a.AccountId = acId;
        //acc.add(a);
        insert a;
    }
    //3
    public static void createOpporonAccount(){
        Id aI = createAccoutn();
        Opportunity opo= new Opportunity(Name='Oppo based on Account', CloseDate = System.today(), StageName='Quailfication');
        opo.AccountId = aI;
        insert opo;
    }
    
   //4
    public static void posCandiJobApplictnReview(){
        Position__c p = new Position__c();
        p.Name = 'Position Name - Manager1';
        //p.RecordType = 'specify Id';
        insert p;
        
        Candidate__c Can = new Candidate__c();
        Can.First_Name__c = ' Thanmayi1';
        Can.Years_of_Experience__c = 3.2;
        insert Can;
        
        Job_Application__c jbAp = new Job_Application__c();
        jbAp.Position__c=p.Id;
        jbAp.Candidate__c = Can.Id;
        jbAp.Status__c = 'New';
        insert jbAp;
        
        Review__c re = new Review__c();
        re.Job_Application__c = jbAp.Id;
        re.Core_Competencies__c = '3';
        re.Leadership_Skills__c = '1';
        re.Experience__c = '4';
        insert re;
    }
    
    //5
    public static void AccountrelatedConOppoCase(){
        //Account
        Account a = new Account (Name='Thanmayi33', AnnualRevenue=100229, Type='Prospect');
        insert a;
        
        //Contact
        Contact c = new Contact();
        c.LastName = a.Name;
        c.AccountId = a.Id;
        insert c;
        
        //Case
        Case ca = new Case();
        ca.AccountId = a.Id;
        ca.Status = 'Working';
        ca.Origin = 'Phone';
        insert ca;
        
        //Opportunity
        Opportunity opo= new Opportunity();
        opo.Name = a.Name;
        opo.AccountId = a.Id;
        opo.CloseDate = System.today();
        opo.StageName='Quailfication';
        insert opo;
    }
}
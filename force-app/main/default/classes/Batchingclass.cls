public class Batchingclass implements Queueable {

    public List<Contact> createContact(Id acI){
        List<Contact> conL = new List<Contact>();
        Contact c = new Contact (LastName='Queuable Contact');
        c.AccountId = acI;
        conL.add(c);
        insert conL;
        system.debug(conL);
        return conL;
    }
    public void execute(QueueableContext qc){
        List<Account> accL = [Select Id, Industry from Account where Industry ='Media'];
        system.debug(accL);
        // it is okay pls you are good I mean atleast if you are not good then its good that you have this 
        // sense of expecting the uneccessary and then avoid it. I love how you handled it thanmayi.
        // breakdowns are normal. But its okay you are becoming healthy in your conversations and I am 
        // happy about it. you did well. you rocking!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        for(Account ac : accL){
        	createContact(ac.Id);
        }
        update accL;
    }

}
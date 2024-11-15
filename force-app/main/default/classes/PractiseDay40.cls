public class PractiseDay40 {
    
    @InvocableMethod
    //Apex invocation via screen flow
    public static List<Decimal> methoapex(List<Id> ids){
    	List<Opportunity> OppoList = [Select  AccountId, Amount from Opportunity where Id = : ids[0]];
    	List<Account> accList = [Select AnnualRevenue from Account where Id =: OppoList[0].AccountId];
        List<Decimal> annualRevenueList = new List<Decimal>();
        if(accList[0].AnnualRevenue!=Null){
        accList[0].AnnualRevenue = accList[0].AnnualRevenue + OppoList[0].Amount;
        }
        else{
            accList[0].AnnualRevenue = OppoList[0].Amount;
        }
        update accList;
        annualRevenueList.add(accList[0].AnnualRevenue);
        return annualRevenueList;
            
	}
}
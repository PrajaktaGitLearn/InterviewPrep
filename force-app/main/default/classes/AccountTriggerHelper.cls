public class AccountTriggerHelper {
        //Trigger Handler pattern
        // Trigger Context variables
        // Trigger Events
        // Bulkify your trigger
    public static void checkAccountRevenue(List<Account> acclist){
        if(!acclist.isEmpty()){
            for(Account ac: acclist){
                if(ac.AnnualRevenue == null){
                    ac.AnnualRevenue.addError('You must specify annualrevenue');
                }
            }
        }
        
    }
    
    public static void checkcontactsOnAccount(List<Account> acclist){
        
        if(!acclist.isEmpty()){
            for(Account ac : acclist){
                if(ac.Contacts.size() > 0){
                    ac.addError('Not able to update as no contacts present');
                }
            }
        }
    }
}
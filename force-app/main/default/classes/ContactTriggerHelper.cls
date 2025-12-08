public class ContactTriggerHelper {

    public static void checkContacts(List<Contact> conlist){
        
        Set<Id> accIds = new Set<Id>();
        if(!conlist.isEmpty()){
            for(Contact con: conlist){
                if(con.AccountId != null){
                   accIds.add(con.AccountId); 
                }
            }  
        }
        
        // 2nd way without aggregate query
        List<Account> accountList = [SELECT Id, (SELECT Id,AccountId FROM Contacts) FROM Account WHERE Id IN:accIds];
        for(Account ac : accountList){
            ac.No_Of_Contacts__c = ac.Contacts.size();
        }
        
        
        // 1st way 
        /*Map<Id,Integer> accMap = new Map<Id,Integer>();
        
        List<AggregateResult> aggResult = [SELECT  COUNT(Id) contactCount , AccountId FROM Contact WHERE AccountId IN:accIds GROUP BY AccountId ];
        if(!aggResult.isEmpty()){
            for(AggregateResult ag : aggResult){
                
                Integer noOfcontacts = (Integer) ag.get('contactCount');
                Id accountId = (Id) ag.get('AccountId');
                //accMap.Put(accountId,noOfcontacts);
                
                Account ac = new Account();
                ac.Id = (Id) ag.get('AccountId');
                ac.No_Of_Contacts__c = (Integer) ag.get('contactCount');
                
                
                
            } 
        }*/
        
        /*List<Account> updateAccouts = new List<Account>();
        
        for(Contact con: conlist){
            if(accMap.containsKey(con.AccountId)){
                Account ac = new Account();
                
                ac.Id = con.AccountId;
                ac.Account.No_Of_Contacts__c  = accMap.get(con.AccountId);
                
                updateAccouts.add(ac);
            }
        }
        
        if(!updateAccouts.isEmpty()){
            update updateAccouts;
        }*/
        
        
    }
}
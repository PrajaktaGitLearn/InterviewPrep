trigger AccountTrigger on Account (before insert,before update) {

    if(Trigger.isBefore){
        if(Trigger.isInsert){
            AccountTriggerHelper.checkAccountRevenue(Trigger.New); 
        }
        
        if(Trigger.isUpdate){
            AccountTriggerHelper.checkcontactsOnAccount(Trigger.old);
        }
       
    }
    
   
}
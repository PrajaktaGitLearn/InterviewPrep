trigger ContactTrigger on Contact (after insert, after update, after delete, after undelete) {

    if(Trigger.isAfter){
        if(Trigger.isInsert || Trigger.isUpdate || Trigger.isUndelete){
            ContactTriggerHelper.checkContacts(Trigger.New);
                
            }
        }
        
        
    
}
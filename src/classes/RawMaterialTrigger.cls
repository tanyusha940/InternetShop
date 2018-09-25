public class RawMaterialTrigger extends TriggerHandler{

    protected  override  void afterInsert(){
        AddStoreInRawMaterial();
    }
    private void AddStoreInRawMaterial(){

        for(raw_material__c raw: (List<raw_material__c>)Trigger.new){
            List<Store__c> store = [SELECT End_Period__c,Start_Period__c From Store__c where Start_Period__c <=: raw.Date_of_receiving__c and End_Period__c >=: raw.Date_of_receiving__c];
            raw.Store__c = store.get(0).Id;
        }
    }
}
public class ProductTriggerHandler extends TriggerHandler{


    protected override void beforeInsert(){
        AddStoreInProduct();
    }

    private void AddStoreInProduct(){

        for(Product__c product: (List<Product__c>)Trigger.new){
            List<Store__c> store = [SELECT End_Period__c,Start_Period__c From Store__c where Start_Period__c <=: product.Date_of_receiving__c and End_Period__c >=: product.Date_of_receiving__c];
            product.Store__c = store.get(0).Id;
        }
    }
}
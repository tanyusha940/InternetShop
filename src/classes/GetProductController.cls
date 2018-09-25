public with sharing class GetProductController {

    public List<Product__c> getProduct(){
        List<Product__c> prod = [SELECT Name,Image__c,
                                        Title__c, Description__c, Cost__c
                                FROM  Product__c LIMIT 10];
        return prod;
    }
    public Void Save(){
        System.Debug('Hello');
    }


}
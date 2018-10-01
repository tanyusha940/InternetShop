public with sharing class GetProductController {

    public List<Product__c> Products {get; set;}

    //public String DescriptionProduct {get; set;}

    public GetProductController(){
        Products = [SELECT Name,Image__c,
                            Title__c, Description__c, Cost__c, URL_Image__c
                    FROM  Product__c
                    LIMIT 10];
    }
}
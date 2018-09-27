
public with sharing class BuyProductController {

    public List<Product__c> ProductList {get; set;}
    public Contacts__c objContact {get; set;}
    public String ProductId {get;set;}

    public BuyProductController(){
        ProductId = ApexPages.currentPage().getParameters().get('id');
        ProductList = [SELECT Name, Title__c, URL_Image__c, Cost__c, Description__c From Product__c Where Id =: ProductId];
    }


    public Void CreateContact() {
        System.Debug(objContact.Name);
//        System.Debug(objContact.Email__c);
        System.Debug('Hello');
    }

    public Void BuyProduct(){
        System.Debug('Hello');
    }

}
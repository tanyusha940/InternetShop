public with sharing class BuyProductController {

    public List<Product__c> CurrentProduct {get; set;}
    public Contacts__c CurrentContact {get; set;}
    public Product__c CopyBuyProduct {get; set;}
    public String ProductId {get;set;}
    public List<Contacts__c> ObjContact {get; set;}
    Constants constants = new Constants();

    public BuyProductController(){
        ProductId = ApexPages.currentPage().getParameters().get('id');
        CurrentProduct = [SELECT Name, Title__c, URL_Image__c, Cost__c, Description__c, Amount__c, RecordType.Name From Product__c Where Id =: ProductId];
        CurrentContact = new Contacts__c();
    }


    public Void CreateContact() {
        ObjContact = [SELECT Id, Name,Description__c,Address__c,Phone__c, Email__c  From Contacts__c Where Email__c =: CurrentContact.Email__c LIMIT 1];
        if(ObjContact.size() == 0){
            ObjContact.add(CurrentContact);
            insert ObjContact;
        }
        else {
            ObjContact.get(0).Email__c = CurrentContact.Email__c;
            ObjContact.get(0).Name = CurrentContact.Name;
            ObjContact.get(0).Phone__c = CurrentContact.Phone__c;
            update ObjContact;
        }
    }

    public PageReference BuyProduct(){
        CreateContact();
        CurrentProduct.get(0).Amount__c = CurrentProduct.get(0).Amount__c-1;
        RecordType recordType = [SELECT Id, Name FROM RecordType Where Name =: constants.RecordTypeForProduct  and SobjectType ='Product__c'];
        System.Debug(constants.RecordTypeForProduct);
        CopyBuyProduct = new Product__c(
                RecordTypeId = recordType.Id,
                Name = CurrentProduct.get(0).Name,
                Title__c = CurrentProduct.get(0).Title__c,
                URL_Image__c = CurrentProduct.get(0).URL_Image__c,
                Cost__c = CurrentProduct.get(0).Cost__c,
                Description__c = CurrentProduct.get(0).Description__c,
                Amount__c = CurrentProduct.get(0).Amount__c,
                Contacts__c = ObjContact.get(0).Id
        );
        PageReference pageReference = new PageReference('/apex/OkBuyProduct');
        return pageReference;
    }

}


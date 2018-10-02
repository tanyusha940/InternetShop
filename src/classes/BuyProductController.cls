public with sharing class BuyProductController {

    public List<Product__c> CurrentProduct {get; set;}
    public Contacts__c CurrentContact {get; set;}
    public Product__c CopyBuyProduct {get; set;}
    public String ProductId {get;set;}
    public List<Contacts__c> ObjContact {get; set;}
    public Discount__c CurrentDiscount {get; set;}
    public List<Discount__c> Discount {get; set;}
    Constants constants = new Constants();

    public BuyProductController(){
        ProductId = ApexPages.currentPage().getParameters().get('id');
        CurrentProduct = [SELECT Name, Title__c, URL_Image__c, Cost__c, Description__c, Amount__c, RecordType.Name From Product__c Where Id =: ProductId];
        CurrentContact = new Contacts__c();
        CurrentDiscount = new Discount__c();
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
        System.Debug(CurrentProduct);
        Sales();
        CurrentProduct.get(0).Amount__c = CurrentProduct.get(0).Amount__c-1;
        RecordType recordType = [SELECT Id, Name FROM RecordType Where Name =: constants.RecordTypeForProduct  and SobjectType ='Product__c'];
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

        System.Debug(CopyBuyProduct);
        PageReference pageReference = new PageReference('/apex/OkBuyProduct');
        return pageReference;
    }

    public Void Sales(){
        Discount = [SELECT Discount_Code__c, Percentes_of_discount__c, Static_discount__c FROM Discount__c WHERE Discount_Code__c =:CurrentDiscount.Discount_Code__c LIMIT 1];
        if(Discount != null){
            if(Discount.get(0).Percentes_of_discount__c != null ){
                CurrentProduct.get(0).Cost__c = CurrentProduct.get(0).Cost__c - (CurrentProduct.get(0).Cost__c * Discount.get(0).Percentes_of_discount__c/100);
            }
            else {
                CurrentProduct.get(0).Cost__c = CurrentProduct.get(0).Cost__c - (CurrentProduct.get(0).Cost__c * Discount.get(0).Static_discount__c/100);
            }

        }
    }


}


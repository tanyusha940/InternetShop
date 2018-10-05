public with sharing class Sales {

    public Boolean DiscountForAccount {get; set;}
    public List<Discount__c> DiscountsForAccount {get; set;}

    public Sales(){
        DiscountForAccount = false;
        String currentAccountName = UserInfo.getUserId();
        DiscountsForAccount = [SELECT Name,Percentes_of_discount__c,Static_discount__c from Discount__c Where Account__r.Id =: currentAccountName];

        System.Debug(GetDiscount());
    }

    public Boolean CheckAccount(){
        for(Discount__c discount: DiscountsForAccount){
            if(DiscountsForAccount != null){
                DiscountForAccount = true;
                return DiscountForAccount;
            }
        }
        return DiscountForAccount;
    }

    public Discount__c GetDiscount(){
        if(DiscountsForAccount != null){
            return DiscountsForAccount.get(0);
        }
        else { return null; }

    }
}
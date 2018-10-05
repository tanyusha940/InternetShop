public with sharing class GetProductController {

    public List<Product__c> Products {get; set;}
    public Boolean DiscountForAccount {get; set;}
    public Discount__c Discounts {get; set;}
    public List<Decimal> CostWithSale {get; set;}
    Sales sales = new Sales();
    //public String DescriptionProduct {get; set;}

    public GetProductController(){
        Products = [SELECT Name,Image__c,
                            Title__c, Description__c, Cost__c, URL_Image__c
                    FROM  Product__c
                    LIMIT 10];

        DiscountForAccount = sales.CheckAccount();
//        System.Debug(sales.DiscountsForAccount);
        System.Debug(sales.GetDiscount());
//        if(sales.GetDiscount() != null){
//            Discounts = sales.GetDiscount();
//        }
//        System.Debug(Discounts);


    }

//    public Void Discount(){
//        if(DiscountForAccount = true){
//            for(Product__c product: Products){
//                if(Discounts.get(0).Percentes_of_discount__c != null){
//                    CostWithSale = product.Cost__c -(product.Cost__c*Discounts.get(0).Percentes_of_discount__c/100);
//                }
//                else{
//                    CostWithSale = product.Cost__c -(product.Cost__c*Discounts.get(0).Static_discount__c/100);
//                }
//            }
//        }
//    }
}
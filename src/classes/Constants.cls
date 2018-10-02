public with sharing class Constants {

    private String recordTypeProduct;
    Public String RecordTypeForProduct {
        get{
            return recordTypeProduct;
        }
        private set{}
    }
    public Constants() {
        recordTypeProduct = 'Sold';
    }


}
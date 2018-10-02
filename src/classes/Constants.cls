public with sharing class Constants {

    private String record;
    Public String RecordTypeForProduct {
        get{
            return record;
        }
        private set{}
    }
    public Constants() {
        record = 'Sold';
    }


}
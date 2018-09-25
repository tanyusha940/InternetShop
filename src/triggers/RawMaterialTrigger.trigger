/**
 * Created by t.shkoda on 27.07.18.
 */

trigger RawMaterialTrigger on raw_material__c (after insert) {
    new ProductTriggerHandler().run();
}
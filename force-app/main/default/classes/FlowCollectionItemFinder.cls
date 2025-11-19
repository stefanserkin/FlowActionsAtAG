/**************************************************************
 * @description Return an sobject from a collection of sobjects in flow
 * @date 2024
 **************************************************************/
global with sharing class FlowCollectionItemFinder {

    @InvocableMethod(
        label='Get sObject by Record Id' 
        description='Get an sObject in a collection by its record id'
        category='Utilities' 
        iconName='resource:asgr__agGlyph:Layer_1'
    )
    global static List<Result> getSObjectById(List<Request> requests) {
        List<Result> results = new List<Result>();

        for (Request req : requests) {
            Result result = new Result();
            
            Map<Id, SObject> mapSObjects = new Map<Id, SObject>(req.collection);
            if (mapSObjects.containsKey(req.recordId)) {
                result.record = mapSObjects.get(req.recordId);
            }
            results.add(result);
        }

        return results;
    }

    global class Request {
        @InvocableVariable(label='Collection')
        global List<SObject> collection;

        @InvocableVariable(label='Record Id')
        global Id recordId;
    }

    global class Result {
        @InvocableVariable(label='Record')
        global SObject record;
    }

}
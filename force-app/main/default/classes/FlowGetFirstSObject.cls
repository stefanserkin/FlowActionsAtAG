/**************************************************************
 * @description Return an sobject from a collection of sobjects in flow
 * @date 2024
 **************************************************************/
global with sharing class FlowGetFirstSObject {

    @InvocableMethod(
        label='Get First SObject' 
        description='Get the first sObject in a collection'
        category='Utilities' 
        iconName='resource:asgr__agGlyph:Layer_1'
    )
    global static List<Result> getFirstSObject(List<Request> requests) {
        List<Result> results = new List<Result>();
        for (Request request : requests) {
            Result result = new Result();
            if (!request.records.isEmpty()) {
                result.firstRecord = request.records[0];
            }
            results.add(result);
        }
        return results;
    }
    
    global class Request {
        @InvocableVariable(label='Record Collection' required=true)
        global List<SObject> records;
    }

    global class Result {
        @InvocableVariable(label='First Record')
        global SObject firstRecord;
    }

}
/**
 * Reis Taylor
 * Last modified: May 30th 2022
 * Test for the Custom Controller of my YouTubeScraper Page
 * Executes the getRecentYoutubeComments method of that controller
 * Apex calls the response method at runtime, but instead of the real response
 * we'll set te response values and even the 200 level response
 * 
 */

@isTest
global class YoutubeCommentMonitorController_Test implements HttpCalloutMock {

    @isTest
    static void getRecentYoutubeComments_positive() {
        Test.startTest();
        Test.setMock(HttpCalloutMock.class, new YoutubeCommentMonitorController_Test());
        
        YoutubeCommentMonitorController.getRecentYoutubeComments();
        
        Test.stopTest();
    }
    
    global HTTPResponse respond(HTTPRequest req) {
        return this.getPositiveResponse();
    }
    
    private HttpResponse getPositiveResponse() {
        HttpResponse res = new HttpResponse();
        res.setHeader('Content-Type', 'application/json');//so so many different content types
        String responseBody = '{'
            +' "kind": "youtube#commentThreadListResponse",'
            +' "pageInfo": {'
            +' "totalResults": 20,'
            +' "resultsPerPage": 20'
            +'},'
            +' "items": ['
            +'{' // items
            +' "id": "UgyxHfrOsiWFrHKbGo14AaABA1",'
            +' "snippet": {' // items - snippet
            +' "videoId": "hre3UdoxbE0",'
            +' "topLevelComment": {' // snippet - topLevelComment
            +' "id": "UgyxHfrOsiWFrHKbGo14AaABA1",'
            +' "snippet": {' // topLevelComment - snippet
            +' "videoId": "hre3UdoxbE0",'
            +' "textDisplay": "1Legend says he&#39;s still running - &#127939;"'
            +'}' // topLevelComment - snippet
            +'}' // snippet - topLevelComment
            +'}' // items - snippet
            +'},' // items
            +'{' // items
            +' "id": "UgzWJjslJzTgMrRQ4VV4AaABA2",'
            +' "snippet": {'
            +' "videoId": "hre3UdoxbE0",'
            +' "topLevelComment": {' // snippet - topLevelComment
            +' "id": "UgzWJjslJzTgMrRQ4VV4AaABA2",'
            +' "snippet": {' // topLevelComment - snippet
            +' "videoId": "hre3UdoxbE0",'
            +' "textDisplay": "2Love the video, what program do you use to design them??"'
            +'}' // topLevelComment - snippet
            +'}' // snippet - topLevelComment
            +'}' // items - snippet
            +'},' // items
            +'{' // items
            +' "id": "UgzWJjslJzTgMrRQ4VV4AaABA3",'
            +' "snippet": {'
            +' "videoId": "hre3UdoxbE0",'
            +' "topLevelComment": {' // snippet - topLevelComment
            +' "id": "UgzWJjslJzTgMrRQ4VV4AaABA3",'
            +' "snippet": {' // topLevelComment - snippet
            +' "videoId": "hre3UdoxbE0",'
            +' "textDisplay": "3Love the video, what program do you use to design them??"'
            +'}' // topLevelComment - snippet
            +'}' // snippet - topLevelComment
            +'}' // items - snippet
            +'},' // items
            +'{' // items
            +' "id": "UgzWJjslJzTgMrRQ4VV4AaABA4",'
            +' "snippet": {'
            +' "videoId": "hre3UdoxbE0",'
            +' "topLevelComment": {' // snippet - topLevelComment
            +' "id": "UgzWJjslJzTgMrRQ4VV4AaABA4",'
            +' "snippet": {' // topLevelComment - snippet
            +' "videoId": "hre3UdoxbE0",'
            +' "textDisplay": "4Love the video, what program do you use to design them??"'
            +'}' // topLevelComment - snippet
            +'}' // snippet - topLevelComment
            +'}' // items - snippet
            +'},' // items
            +'{' // items
            +' "id": "UgzWJjslJzTgMrRQ4VV4AaABA5",'
            +' "snippet": {'
            +' "videoId": "hre3UdoxbE0",'
            +' "topLevelComment": {' // snippet - topLevelComment
            +' "id": "UgzWJjslJzTgMrRQ4VV4AaABA5",'
            +' "snippet": {' // topLevelComment - snippet
            +' "videoId": "hre3UdoxbE0",'
            +' "textDisplay": "5Love the video, what program do you use to design them??"'
            +'}' // topLevelComment - snippet
            +'}' // snippet - topLevelComment
            +'}' // items - snippet
            +'},' // items
            +'{' // items
            +' "id": "UgzWJjslJzTgMrRQ4VV4AaABA6",'
            +' "snippet": {'
            +' "videoId": "hre3UdoxbE0",'
            +' "topLevelComment": {' // snippet - topLevelComment
            +' "id": "UgzWJjslJzTgMrRQ4VV4AaABA6",'
            +' "snippet": {' // topLevelComment - snippet
            +' "videoId": "hre3UdoxbE0",'
            +' "textDisplay": "6Love the video, what program do you use to design them??"'
            +'}' // topLevelComment - snippet
            +'}' // snippet - topLevelComment
            +'}' // items - snippet
            +'},' // items
            +'{' // items
            +' "id": "UgzWJjslJzTgMrRQ4VV4AaABA7",'
            +' "snippet": {'
            +' "videoId": "hre3UdoxbE0",'
            +' "topLevelComment": {' // snippet - topLevelComment
            +' "id": "UgzWJjslJzTgMrRQ4VV4AaABA7",'
            +' "snippet": {' // topLevelComment - snippet
            +' "videoId": "hre3UdoxbE0",'
            +' "textDisplay": "7Love the video, what program do you use to design them??"'
            +'}' // topLevelComment - snippet
            +'}' // snippet - topLevelComment
            +'}' // items - snippet
            +'}' // items
            +']' // items
            +'}';
        res.setBody(responseBody);
        res.setStatusCode(200);
        return res;
    }
}
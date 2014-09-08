<!DOCTYPE html>
<html lang="en">
<head>
<title>Refresh Overview</title>
<link type="text/css" rel="stylesheet" href="https://cdn.refresh.io/public/stylesheets/app/all.min.css">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<script>
$(document).ready(function() {
      console.debug('Inside document ready');
      (function () {
        var fileref = document.createElement('script');
        fileref.setAttribute("type","text/javascript");
        fileref.setAttribute("src", "https://na17.salesforce.com/canvas/sdk/js/31.0/canvas-all.js");
        fileref.onload = function() {
          console.debug('Canvas-all loaded successfully');
          callSfdcCanvas();
        };
        document.getElementsByTagName("body")[0].appendChild(fileref);
      })(); 
      var height = 1440,
          width = 800,
          top = (screen.height/2)-(height/2),
          left = (screen.width/2)-(width/2),
          popupAttrs = 'height=' + height + ',width=' + width + ',top=' + top + ',left=' + left + ',resizable,scrollbars,status';

      $('.cta-button').on('click', function(){
          newwindow=window.open($(this).attr('href'),'', popupAttrs);
          if (window.focus) {newwindow.focus()}
          return false;
      });
      // Simplion css connect button style
      $('.connectBtn').on('click', function(){
          newwindow=window.open($(this).attr('href'),'', popupAttrs);
          if (window.focus) {newwindow.focus()}
          return false;
      });
      // For receiving secretKey message after signup
      window.addEventListener('message',function(event) {
          console.log(event.origin);
          console.log(event.data);
          if(event.origin !== 'https://staging.refresh.io') {
              console.log('Received message from ' + event.origin + ", skipping.");
              return;
          }
          console.log('received data:  ', event.data);
          var url = "https://app.qa.refresh.io/s/api/v2/salesforce/link?apiKey=0a77b5dc-6ee4-494d-b2ff-73fc9ea64be4";
          var body = {secretKey : event.data, sfUserId : sr.context.user.userId, sfEmail : sr.context.user.email};
          var bodyString = JSON.stringify(body);
          console.log("Body: " + bodyString);
          Sfdc.canvas.client.ajax(url,
                  {client : sr.client,
                    method: 'POST',
                    contentType: "application/json",
                    data: bodyString,
                    success : function(data) {
                        if (200 === data.status) {
                            Sfdc.canvas.client.repost();
                            console.log("Salesforce link OK, sent a repost.");
                        }
                        else if (400 == data.status) {
                            console.log("Salesforce link - Bad Request");
                        }
                        else if (500 == data.status) {
                            console.log("Salesforce link - Server Error");
                        }
                    }
                  });
      },false);
  }); 
    
  
  if (self === top) {
    // Not in Iframe
    alert("This canvas app must be included within an iframe");
  }
      // var sr = JSON.parse('{"algorithm":"HMACSHA256","issuedAt":798284367,"userId":"005o0000000KmuMAAS","client":{"clientId":null,"instanceId":"09Ho00000008knt:","targetOrigin":"https://na17.salesforce.com","instanceUrl":"https://na17.salesforce.com","oauthToken":"00Do0000000YsLj!ARkAQPGgJRzLie421iBYgG6dp4JhW9x3sDI449_A5CczoQKtq5G8u0cmhm6su69MfM5pIAcjEM64qQ4.dZU5ToM6p2tG5s12"},"context":{"user":{"userId":"005o0000000KmuMAAS","userName":"hemant@40demo.com","firstName":"Hemant","lastName":"Thakkar","email":"hemant.thakkar@simplion.com","fullName":"Hemant Thakkar","locale":"en_US","language":"en_US","timeZone":"America/Los_Angeles","profileId":"00eo0000000roK4","roleId":null,"userType":"STANDARD","currencyISOCode":"USD","profilePhotoUrl":"https://c.na17.content.force.com/profilephoto/005/F","profileThumbnailUrl":"https://c.na17.content.force.com/profilephoto/005/T","accessibilityModeEnabled":false},"links":{"enterpriseUrl":"/services/Soap/c/31.0/00Do0000000YsLj","metadataUrl":"/services/Soap/m/31.0/00Do0000000YsLj","partnerUrl":"/services/Soap/u/31.0/00Do0000000YsLj","restUrl":"/services/data/v31.0/","sobjectUrl":"/services/data/v31.0/sobjects/","searchUrl":"/services/data/v31.0/search/","queryUrl":"/services/data/v31.0/query/","recentItemsUrl":"/services/data/v31.0/recent/","chatterFeedsUrl":"/services/data/v31.0/chatter/feeds","chatterGroupsUrl":"/services/data/v31.0/chatter/groups","chatterUsersUrl":"/services/data/v31.0/chatter/users","chatterFeedItemsUrl":"/services/data/v31.0/chatter/feed-items","userUrl":"/005o0000000KmuMAAS"},"environment":{"locationUrl":"https://na17.salesforce.com/003o0000005s1KD","uiTheme":"Theme3","dimensions":{"width":"100%","height":"200px"},"record":{"attributes":{"type":"Contact","url":"/services/data/v31.0/sobjects/Contact/003o0000005s1KDAAY"},"Id":"003o0000005s1KDAAY"},"displayLocation":"PageLayout","parameters":{},"sublocation":null,"version":{"season":"SUMMER","api":"31.0"}},"organization":{"organizationId":"00Do0000000YsLjEAK","name":"Refresh","multicurrencyEnabled":false,"currencyIsoCode":"USD"}}}');


      var sr = JSON.parse('{"algorithm":"HMACSHA256","issuedAt":1423202838,"userId":"005o0000000j4ktAAA","client":{"refreshToken":null,"instanceId":"refresh_io:Refresh_App:","targetOrigin":"https://na17.salesforce.com","instanceUrl":"https://na17.salesforce.com","oauthToken":"00Do0000000YsKS!ARcAQH7D12KoYEzVksxlI4B57S36EHp.t2_QdBP_Rz3zbL0_Q_oii495cDbM8Co7xS19LLmpXUarbX38p8KcIHBZmcgPApEJ"},"context":{"user":{"userId":"005o0000000j4ktAAA","userName":"hemant.thakkar@5demo.com","firstName":"Hemant","lastName":"Thakkar","email":"hemant.thakkar@simplion.com","fullName":"Hemant Thakkar","locale":"en_US","language":"en_US","timeZone":"America/Los_Angeles","profileId":"00eo0000000roL1","roleId":null,"userType":"STANDARD","currencyISOCode":"USD","profilePhotoUrl":"https://c.na17.content.force.com/profilephoto/005/F","profileThumbnailUrl":"https://c.na17.content.force.com/profilephoto/005/T","siteUrl":null,"siteUrlPrefix":null,"networkId":null,"accessibilityModeEnabled":false,"isDefaultNetwork":true},"links":{"loginUrl":"https://login.salesforce.com/","enterpriseUrl":"/services/Soap/c/31.0/00Do0000000YsKS","metadataUrl":"/services/Soap/m/31.0/00Do0000000YsKS","partnerUrl":"/services/Soap/u/31.0/00Do0000000YsKS","restUrl":"/services/data/v31.0/","sobjectUrl":"/services/data/v31.0/sobjects/","searchUrl":"/services/data/v31.0/search/","queryUrl":"/services/data/v31.0/query/","recentItemsUrl":"/services/data/v31.0/recent/","chatterFeedsUrl":"/services/data/v31.0/chatter/feeds","chatterGroupsUrl":"/services/data/v31.0/chatter/groups","chatterUsersUrl":"/services/data/v31.0/chatter/users","chatterFeedItemsUrl":"/services/data/v31.0/chatter/feed-items","userUrl":"/005o0000000j4ktAAA"},"application":{"namespace":"refresh_io","name":"Refresh","canvasUrl":"https://play.simplion.com/refreshdemo/demo.php?aid=cqp3oUwdmc4dfXdW","applicationId":"06Po00000004ThO","version":"1.0","authType":"SIGNED_REQUEST","referenceId":"09Ho00000000HRw","options":[],"samlInitiationMethod":"None","developerName":"Refresh_App"},"organization":{"organizationId":"00Do0000000YsKSEA0","name":"Refresh","multicurrencyEnabled":false,"namespacePrefix":"refresh_io","currencyIsoCode":"USD"},"environment":{"locationUrl":"https://na17.salesforce.com/_ui/force/canvas/ui/CanvasPreviewerUi?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DStudio&setupid=CanvasPreviewerUi","displayLocation":null,"sublocation":null,"uiTheme":"Theme3","dimensions":{"width":"800px","height":"900px","maxWidth":"1000px","maxHeight":"2000px","clientWidth":"1472px","clientHeight":"80px"},"parameters":{},"record":{},"version":{"season":"SUMMER","api":"31.0"}}}} ');
function callSfdcCanvas() {
  var url = "/services/data/v26.0/query?q=SELECT+ID,NAME+FROM+ACCOUNT";
      $(document).ready(function() {
        Sfdc.canvas.client.ajax(url,
            { client : sr.client,
                method: 'GET',
                contentType: "application/json",
                success : function(data) {
                console.debug('Got Data ',data);
                  $('#accountTable').append(ich.accounts(data.payload));
                }
            });
    });

Sfdc.canvas(function() {

    var sizes = Sfdc.canvas.client.size();
    // Turn on auto grow with default settings.
    Sfdc.canvas.client.autogrow(sr.client);
    // Save the token
    Sfdc.canvas.oauth.token(sr.client.oauthToken);
    // Set the inner html of the overview
    Sfdc.canvas.byId('content').innerHTML = '    <main id="main" style="max-width: 100%"><div id="application-wrapper" style="min-height: 248px"><div id="content-wrapper"><div id="dossier-wrapper" style="font-size: 1.4em; background-color: #CCD0D2;"><div class="grid"><div class="grid-1-4 left-rail-wrapper" style="width: 20%; "><header class="banner grid-1-1" style="width: 100%; height: 100%; min-height: 248px; display: inline-block"><div class="grid-2-4" style="margin-top: -20px;"><img class="logo" src="https://cdn.refresh.io/public/images/logo.png" height="40" width="40" alt="logo" title="Home" style="width: 15%; height: 15%;"><span style="opacity: 0.95; font-weight: 300; color: #FFF; font-size: 1.9em; margin-left: 10px;position: fixed;">Refresh</span></div><div class="profile-photo-wrapper profile-picture" style="background-image: url(http://m.c.lnkd.licdn.com/mpr/mprx/0_fQ1KQyWlzp7oP_DNSb0Y8g6PzwAor-3NS9Sj8gRgYfKWc1PVfntyGRPaoLw); display: block; max-height: 85px;                            max-width: 85px;margin: 0 auto; overflow: hidden;background-size: cover; background-position: 50% 25%;"></div><div class="info" style="margin: 0 auto; display: block;"><h1 class="name" style="margin: 2px 0px 1px 0px; text-align: center; font-size: 1.5em; font-weight: 300; color: #FFF;">Hemant Thakkar</h1><p class="currentJob" style=" margin: 0px 0px 0px 0px; opacity: 0.55; text-align: center; font-size: 1.2rem;">Associate Developer at Simplion Technologies</p><a class="cta-button" style="display: block; margin: 25px 25px 0 25px;padding: .65rem;background-color: #f09d0b;color: #FFF; border-radius: 4px; border: 1px solid transparent; font-size: 1.5rem;font-weight: 400;text-align: center;text-transform: uppercase;text-decoration: none; margin-right: 20px;" href="https://staging.refresh.io/app/salesforce/dossier/secretKey/2zcm6nsmkwxk47t8kywt18mg8/vieweeId/linked_in_id 82i5jmfyR_" >View More Insights</a></div></header></div><div class="grid-3-4 left-rail-wrapper" style="float: right; max-height: 248px; width: 80%;"><div id="card-wrapper grid-1-1" style="display: inline-block; min-height: 248px; max-height: 100%; overflow: auto; width: 100%"><div class="overview-left" style="display: inline-block; float: left; width: 100%;"><a class="cta-button" style="float: right; background-color: initial; margin: auto; font-size: 1rem; font-weight: 500;" href="https://staging.refresh.io/app/settings/salesforce/secretKey/2zcm6nsmkwxk47t8kywt18mg8" style="float: right;"><i class="fa fa-cog grey-text fa-2x" style="margin-left: 5px; margin-top:-5px; margin-right:4px"></i></a><div class="insight " style="margin: 0.5%; padding: 1px;                                            max-width: 95%;                                            background-color: #fff;                                            border-radius: 5px;                                            box-shadow: 0 1px 3px 0 rgba(0,0,0,.35);"><div class="feature overview" style="padding: 15px; margin-bottom:4px"><i class="fa fa-briefcase icon grey-text" style="font-size: 2rem; margin-top: 3px;"></i><p style="margin-top: 2px; font-size: 1.5rem;">Hemant has been working at Simplion Technologies Inc as a Associate Developer for 5 months</p></div></div><div class="insight " style="margin: 0.5%; padding: 1px;                                            max-width: 95%;                                            background-color: #fff;                                            border-radius: 5px;                                            box-shadow: 0 1px 3px 0 rgba(0,0,0,.35);"><div class="feature overview" style="padding: 15px; margin-bottom:4px"><i class="fa fa-home icon grey-text" style="font-size: 2rem; margin-top: 3px;"></i><p style="margin-top: 2px; font-size: 1.5rem;">Hemant currently lives in India.</p></div></div><a class="cta-button" style="display: block; margin: 25px 25px 0 25px;padding: .65rem;background-color: #f09d0b;color: #FFF; border-radius: 4px; border: 1px solid transparent; font-size: 1.5rem;font-weight: 400;text-align: center;text-transform: uppercase;text-decoration: none; margin-right: 20px;" href="https://app.qa.refresh.io/s/api/v2/salesforce/postToChatter?secretKey=2zcm6nsmkwxk47t8kywt18mg8&subjectId=&text=Insights+about+Hemant Thakkar" >Post to Chatter</a></div></div></div></div></div></div></div></main>';
    // set width to 100%
  });
}
  
</script>
</head>
<body>
  <div id='content' style='width:100%; border: none;'></div>
</body>
</html>
var twilio = require("twilio");
twilio.initialize("AC2deef85806271e36c9919e04236f264d","380c6242a8b2433afe2e6bd231e48245");

var twilio = require('twilio')('AC2deef85806271e36c9919e04236f264d', '380c6242a8b2433afe2e6bd231e48245');



Parse.Cloud.define("sendVerification", function(request, response) {
                   var verificationCode = Math.floor(Math.random()*999999);
                   var user = Parse.User.current();
                   user.set("phoneVerificationCode", verificationCode);
                   user.save();
                   
                   twilio.sendSms({
                                  From: "+13473549566",
                                  To: request.params.phoneNumber,
                                  Body: "Your verification code is " + verificationCode + "."
                                  }, function(err, responseData) { 
                                  if (err) {
                                  response.error(err);
                                  } else { 
                                  response.success("Success");
                                  }
                                  });
                   });

Parse.Cloud.define("inviteWithTwilio", function(request, response) {
                   // Use the Twilio Cloud Module to send an SMS
                   twilio.sendSMS({
                                  From: "+13473549566",
                                  To: request.params.number,
                                  Body: "Start using Parse and Twilio!"
                                  }, {
                                  success: function(httpResponse) { response.success("SMS sent!"); },
                                  error: function(httpResponse) { response.error("Uh oh, something went wrong"); }
                                  });
                   });


Parse.Cloud.define("sendVerificationCode", function(request, response) {
    var verificationCode = Math.floor(Math.random()*999999);
    var user = Parse.User.current();
    user.set("phoneVerificationCode", verificationCode);
    user.save();
    
    twilio.sendSMS({
        From: "+13473549566",
        To: request.params.phoneNumber,
        Body: "Your verification code is " + verificationCode + "."
    },  {
    success: function(httpResponse) { response.success("SMS sent!"); },
    error: function(httpResponse) { response.error("Uh oh, something went wrong"); }
  });
});





Parse.Cloud.define("verifyPhoneNumber", function(request, response) {
    var user = Parse.User.current();
    var verificationCode = user.get("phoneVerificationCode");
    if (verificationCode == request.params.phoneVerificationCode) {
        user.set("phoneNumber", request.params.phoneNumber);
        user.save();
        response.success("Success");
    } else {
        response.error("Invalid verification code.");
    }
});
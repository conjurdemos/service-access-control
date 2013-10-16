When /^I fry bacon$/ do
  @response = get "/fry/bacon"
end

Then /^it is allowed$/ do
  @response.status.should == 200
end

Then /^I am not authenticated$/ do
  @response.status.should == 401
end

Then /^it is denied$/ do
  @response.status.should == 403
end

Given(/^I am logged in as Alice$/) do
  header 'Authorization', authorization_token('alice')
end

Given(/^I am logged in as Bob$/) do
  header 'Authorization', authorization_token('bob')
end

Then(/^the response should be "(.*?)"$/) do |response|
  @response.body.should == response
end
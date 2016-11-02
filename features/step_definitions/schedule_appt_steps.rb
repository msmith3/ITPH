Given(/^I am logged in as "([^"]*)"$/) do |arg|
  # id = session[:user_id]
  # user = User.find(:id == id)
  expect(@user.name == arg)
end

Given(/^the following appointments exist:$/) do |table|
  # table is a Cucumber::MultilineArgument::DataTable
  table.hashes.each do |event|
    Event.create!(event)
  end
end

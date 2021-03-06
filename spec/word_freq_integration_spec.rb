require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('word frequency display path', {:type => :feature}) do
  it('displays quantity of exact word match on target page') do
    visit('/')
    fill_in('stringInput', :with => 'Testing the test to see if it passes the tESt')
    fill_in('contains_test', :with => 'test')
    click_button('Scan my text')
    expect(page).to have_content(2)
  end
end

describe('word frequency display path', {:type => :feature}) do
  it('displays quantity of contained word match on target page') do
    visit('/')
    fill_in('stringInput', :with => 'Testing the test to see if it passes the tESt')
    fill_in('contains_test', :with => 'test')
    click_button('Scan my text')
    expect(page).to have_content(3)
  end
end

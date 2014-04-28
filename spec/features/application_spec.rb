require 'spec_helper'
require 'capybara/rspec'

Capybara.app = Application

feature 'Homepage' do
  scenario 'user can see and add new guitar' do
    visit '/'
    click_on 'Add a Guitar'
    fill_in 'maker', with: 'Taylor'
    fill_in 'type', with: '314ce'
    fill_in 'color', with: 'mahogany'
    click_on 'Create Guitar'
    expect(page).to have_content 'Taylor'
  end

  
end
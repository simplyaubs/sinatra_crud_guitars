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

  scenario 'user can update a guitar' do
    visit '/guitars/new'
    fill_in 'maker', with: 'Taylor'
    fill_in 'type', with: '314ce'
    fill_in 'color', with: 'mahogany'
    click_on 'Create Guitar'
    click_on 'Taylor'
    fill_in 'maker', with: 'Martin'
    click_on 'Update Guitar'
    expect(page).to have_content 'Martin'
    expect(page).to_not have_content 'Taylor'
  end

  scenario 'user can destroy a guitar' do
    visit '/guitars/new'
    fill_in 'maker', with: 'Taylor'
    fill_in 'type', with: '314ce'
    fill_in 'color', with: 'mahogany'
    click_on 'Create Guitar'
    click_on 'Taylor'
    click_on 'Destroy Guitar'
    expect(page).to_not have_content 'Taylor'
  end
end
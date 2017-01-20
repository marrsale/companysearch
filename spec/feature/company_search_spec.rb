require 'rails_helper'

feature 'searching companies' do
  context 'a user' do
    let(:company_name) { FFaker::Company.name }

    before do
      visit new_company_search_path
    end

    scenario 'sees a prompt with information' do
      expect(page).to have_content 'Search for a Company'
    end

    scenario 'can submit a search by company name' do
      expect do
        fill_in 'Company name', with: company_name
        click_on 'Search'
      end.not_to raise_error
    end

    describe 'viewing results' do
      before do
        fill_in 'Company Name', with: company_name
        click_on 'Search'
      end

      scenario 'sees companies resulting from the search'
    end
  end
end

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

    context 'viewing results' do
      let(:jurisdiction) { 'englad-wales' }
      let(:target_company) do
        double 'Company',
          name: company_name,
          date_of_creation: '2016-01-01',
          jurisdiction: jurisdiction,
          registered_office_address: nil,
          remote_id: 1
      end
      let(:companies_list) { [target_company] }

      before do
        allow_any_instance_of(CompaniesSearch).to receive(:companies).and_return companies_list
        allow(Company).to receive(:find).and_return target_company

        fill_in 'Company name', with: company_name
        click_on 'Search'
      end

      scenario 'sees companies resulting from the search' do
        expect(page).to have_content company_name
      end

      scenario 'can click through to see more information about a company' do
        click_on company_name

        expect(page).to have_content jurisdiction
      end

      context 'pagination'
    end
  end
end

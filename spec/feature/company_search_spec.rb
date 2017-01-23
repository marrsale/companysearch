require 'rails_helper'

feature 'searching companies' do
  context 'a user' do
    let(:company_name) { FFaker::Company.name }
    let(:company_number) { '123456789' }

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
      let(:officer_name) { FFaker::Name.name }
      let(:officer_appointed_on) { 'a date' }
      let(:officer_role) { 'director' }
      let(:company_officer) do
        double 'CompanyOfficer',
          name: officer_name,
          appointed_on: officer_appointed_on,
          role: officer_role
      end
      let(:target_company) do
        double 'Company',
          name: company_name,
          date_of_creation: '2016-01-01',
          jurisdiction: 'england-wales',
          registered_office_address: { city: 'Bangor', country: 'Wales' },
          company_number: company_number,
          remote_id: 1,
          officers: [company_officer]
      end
      let(:companies_list) { [target_company] }

      before do
        allow_any_instance_of(CompaniesSearch).to receive(:companies).and_return companies_list
        allow(RemoteCompany).to receive(:find).and_return target_company

        fill_in 'Company name', with: company_name
        click_on 'Search'
      end

      scenario 'sees companies resulting from the search' do
        expect(page).to have_content company_name
      end

      context 'can click through to see more information about a company' do
        before do
          click_on company_name
        end

        scenario 'including company address' do
          expect(page).to have_content 'Bangor, Wales'
        end

        scenario 'including company number' do
          expect(page).to have_content company_number
        end

        scenario 'including company officers' do
          expect(page).to have_content officer_name
          expect(page).to have_content officer_appointed_on
          expect(page).to have_content officer_role
        end
      end

      context 'pagination', skip: 'TODO'
    end
  end
end

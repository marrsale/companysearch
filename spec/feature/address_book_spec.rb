require 'rails_helper'

feature 'user address book' do
  context 'for signed in user' do
    let(:user) { create :user }

    before do
      sign_in user
    end

    scenario 'sees a nav link for their address book' do
      expect(page).to have_content 'My Addressbook'
    end

    context 'can view their addressbook',skip:true do
      before do
        click_on 'My Addressbook'
      end

      context 'sees their saved companies' do

      end

      context "sees the company's officers when viewing it"
    end

    context 'can save a company to their addressbook'
  end

  context 'non-signed in user' do
    before do
      visit root_path
    end

    scenario 'sees no addressbook link' do
      expect(page).not_to have_content 'My Addressbook'
    end
  end
end

require 'rails_helper'
require_relative '../support/login_form'

describe OmniauthCallbacksController do
  let!(:user) { create(:user) }
  let(:login_form) { LoginForm.new }

  context 'with login Facebook' do
    context 'when user persisted' do
      it 'successfully registered' do
        login_form.visit_page.mock_auth_hash_provider('ivan.danyliv@gmail.com',
                                                      :facebook).click_on('Continue with Facebook')
        expect(page).to have_content('Hello')
      end
    end

    context 'when user was not persisted' do
      it 'redirect to registered page' do
        login_form.visit_page.mock_auth_hash_provider('', :facebook).click_on('Continue with Facebook')
        expect(page).to have_content('Register')
      end
    end
  end

  context 'with login Google' do
    context 'when user persisted' do
      it 'successfully registered' do
        login_form.visit_page.mock_auth_hash_provider('test@gmail.com',
                                                      :google_oauth2).click_on('Continue with Google')
        expect(page).to have_content('Hello')
      end
    end

    context 'when user was not persisted' do
      it 'redirect to registered page' do
        login_form.visit_page.mock_auth_hash_provider('', :google_oauth2).click_on('Continue with Google')
        expect(page).to have_content('Register')
      end
    end
  end
end

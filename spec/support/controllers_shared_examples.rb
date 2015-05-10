require 'spec_helper'

shared_context 'user signed in' do
  let!(:signed_user) { FactoryGirl.create(:user_kazimierz) }
  before { sign_in signed_user }
end

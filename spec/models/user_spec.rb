require 'spec_helper'

describe User do
  let!(:user) { FactoryGirl.create(:user) }
  subject {user}

  it { should be_valid }

  its(:name) { should eq('Marian') }


  it { expect(User.count).to eq(1) }

  # it "number of user change after save" do
  #   user = FactoryGirl.create(:user)
  #   expect {user.save!}.to change { User.count }.by(1)
  # end               ???????????????????????
end



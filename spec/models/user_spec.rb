require 'spec_helper'

describe User do
  let!(:user) { s.create(:user) }
  subject {user}

  it { should be_valid }
  its(:name) { should eq('Marian') }
  it { expect(User.count).to eq(1) }

end



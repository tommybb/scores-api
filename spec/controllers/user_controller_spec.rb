require 'spec_helper'

describe UsersController do

  include_context 'user signed in'
  describe '#index' do
    context 'one user exists' do
      let!(:user) { FactoryGirl.create(:user) }

      context 'after request' do
        before { get :index }

        it { expect(controller.users).to eq([signed_user, user]) }
      end
    end
  end

  describe '#show' do
    context 'one user exists' do
      let!(:user) { FactoryGirl.create(:user) }

      context 'after request' do
        before { get :show, id: user.to_param }

        it { expect(controller.user).to eq(user) }
      end
    end
  end

  describe '#new' do
    context 'after request' do
      before { get :new }

      it { expect(controller.user).to be_a_new(User) }
    end
  end

  describe '#edit' do
    context 'one user exists' do
      let!(:user) { FactoryGirl.create(:user) }

      context 'after request' do
        before { get :edit, id: user.to_param }

        it { expect(controller.user).to eq(user) }
      end
    end
  end

  describe '#create' do
    let(:call_request) { post :create, user: attributes }

    context 'with valid params' do
      let(:attributes) { FactoryGirl.attributes_for(:user) }

      it { expect { call_request }.to change { User.count }.by(1) }

      context 'after request' do
        before { call_request }

        it { expect(controller.user).to be_a(User) }
        it { expect(controller.user).to be_persisted }
        it { expect(response).to redirect_to(User.last) }
      end
    end

    describe 'with invalid params' do
      let(:attributes) { {user: {}} }

      it { expect { call_request }.to change { User.count }.by(0) }

      context 'after request' do
        before { call_request }

        it { expect(controller.user).to be_a_new(User) }
        it { expect(response).to render_template('new') }
      end
    end
  end
end

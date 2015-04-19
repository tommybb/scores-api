require 'spec_helper'

describe ResultsController do

  let!(:user) { FactoryGirl.create(:user) }

  describe '#index' do
    context 'one result exists' do
      let!(:result) { FactoryGirl.create(:result) }

      context 'after request' do
        before { get :index }

        it { expect(controller.results).to eq([result]) }
      end
    end
  end

  describe '#show' do
    context 'one result exists' do
      let!(:result) { FactoryGirl.create(:result) }

      context 'after request' do
        before { get :show, id: result.to_param }

        it { expect(controller.result).to eq(result) }
      end
    end
  end

  describe '#new' do
    context 'after request' do
      before { get :new }

      it { expect(controller.result).to be_a_new(Result) }
    end
  end

  describe '#edit' do
    context 'one event exists' do
      let!(:result) { FactoryGirl.create(:result) }

      context 'after request' do
        before { get :edit, id: result.to_param }

        it { expect(controller.result).to eq(result) }
      end
    end
  end

  describe '#create' do
    let(:call_request) { post :create, result: attributes }

    context 'with valid params' do
      let(:attributes) { FactoryGirl.attributes_for(:result) }

      it { expect { call_request }.to change { Result.count }.by(1) }

      context 'after request' do
        before { call_request }

        it { expect(controller.result).to be_a(Result) }
        it { expect(controller.result).to be_persisted }
        it { expect(response).to redirect_to(Result.last) }
      end
    end

    describe 'with invalid params' do
      let(:attributes) { {result: {}} }

      it { expect { call_request }.to change { Result.count }.by(0) }

      context 'after request' do
        before { call_request }

        it { expect(controller.result).to be_a_new(Result) }
        it { expect(response).to render_template('new') }
      end
    end
  end
end

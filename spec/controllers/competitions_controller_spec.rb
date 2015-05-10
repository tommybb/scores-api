require 'spec_helper'

describe CompetitionsController do

  describe '#index' do
    context 'one competition exists' do
      let!(:competition) { FactoryGirl.create(:competition) }

      context 'after request' do
        before { get :index }

        it { expect(controller.competitions).to eq([competition]) }
      end
    end
  end

  describe '#show' do
    context 'one competition exists' do
      let!(:competition) { FactoryGirl.create(:competition) }

      context 'after request' do
        before { get :show, id: competition.to_param }

        it { expect(controller.competition).to eq(competition) }
      end
    end
  end

  describe '#new' do
    context 'after request' do
      before { get :new }

      it { expect(controller.competition).to be_a_new(Competition) }
    end
  end

  describe '#edit' do
    context 'one competition exists' do
      let!(:competition) { FactoryGirl.create(:competition) }

      context 'after request' do
        before { get :edit, id: competition.to_param }

        it { expect(controller.competition).to eq(competition) }
      end
    end
  end

  describe '#create' do
    let(:call_request) { post :create, competition: attributes }

    context 'with valid params' do
      let(:attributes) { FactoryGirl.attributes_for(:competition) }
      before { sign_in user }

      it { expect { call_request }.to change { Competition.count }.by(1) }

      context 'after request' do
        before { call_request }

        it { expect(controller.competition).to be_a(Competition) }
        it { expect(controller.competition).to be_persisted }
        it { expect(response).to redirect_to(Competition.last) }
      end
    end

    describe 'with invalid params' do
      let(:attributes) { {competition: {}} }

      it { expect { call_request }.to change { Competition.count }.by(0) }

      context 'after request' do
        before { call_request }

        it { expect(controller.competition).to be_a_new(Competition) }
        it { expect(response).to render_template('new') }
      end
    end
  end
end

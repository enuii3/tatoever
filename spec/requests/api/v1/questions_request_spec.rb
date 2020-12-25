require 'rails_helper'

RSpec.describe 'Api::V1::Questions', type: :request do
  let(:question) { FactoryBot.create(:question) }
  let(:questions) { FactoryBot.create_list(:question, 2) }
  let(:jsons) { JSON.parse(response.body) }

  describe '#index' do
    context 'when get /api/v1/questions' do
      before do
        questions
        get '/api/v1/questions/'
      end

      it 'expect keys that id, title, updatedAt and userName' do
        jsons.each do |json|
          expect(json.keys).to eq(%w[id title updatedAt userName])
        end
      end

      it 'expect 200 http response status' do
        expect(response.status).to eq(200)
      end

      it 'expect 2 questions' do
        expect(jsons.length).to eq(2)
      end
    end

    context 'when raise exception' do
      before do
        allow(Question).to receive(:all).and_raise
        get '/api/v1/questions/'
      end

      it 'expect 500 http response status' do
        expect(response.status).to eq(500)
      end

      it "expect message that 'エラーが発生しました。システム管理者にお問い合わせください。' " do
        expect(jsons).to eq('message' => 'エラーが発生しました。システム管理者にお問い合わせください。')
      end
    end
  end

  describe '#show' do
    context 'when get /api/v1/questions/:id' do
      before do
        get "/api/v1/questions/#{question.id}"
      end

      it 'expect keys that id, title, description, updatedAt userName' do
        expect(jsons.keys).to eq(%w[id title description updatedAt userName])
      end

      it 'expect' do
        expect(jsons['id']).to eq(question.id)
      end

      it 'expect' do
        expect(jsons['title']).to eq(question.title)
      end

      it 'expect' do
        expect(jsons['description']).to eq(question.description)
      end

      it 'expect' do
        question_updated_at = I18n.l(question.updated_at.to_date)
        expect(jsons['updatedAt']).to eq(question_updated_at)
      end

      it 'expect' do
        expect(jsons['userName']).to eq(question.user.name)
      end

      it 'expect response status 200' do
        expect(response.status).to eq(200)
      end
    end

    context 'when raise exception' do
      before do
        allow(Question).to receive(:find).and_raise
        get '/api/v1/questions/:id'
      end

      it 'expect 500 http response status' do
        expect(response.status).to eq(500)
      end

      it "expect message that 'エラーが発生しました。システム管理者にお問い合わせください。' " do
        expect(jsons).to eq('message' => 'エラーが発生しました。システム管理者にお問い合わせください。')
      end
    end
  end
end

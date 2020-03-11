RSpec.describe Endpoints::Tasks::Index do
  describe '#perform' do
    include_context 'endpoint request lets'
    describe 'when user lists tasks' do
      context 'when is valid' do
        let!(:task) { create(:task) }
        let(:params) { {article_id: task.article.id} }
        it 'returns success response' do
          expect(response).to be_success
        end

        it 'return list of all tasks' do
          expect(response.body[:tasks]).not_to be_empty
        end
      end

      context 'when invalid' do
        let(:params) { {} }
        it 'returns id is missing validation error' do
          expect(response.body[:errors]).to eq(article_id: ['is missing', 'must be a number'])
        end
      end
    end
  end
end

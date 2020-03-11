
RSpec.describe Endpoints::Tasks::Update do
  describe '#perform' do
    include_context 'endpoint request lets'
    describe 'when user updates an task' do
      context 'when is valid' do
        let!(:task) { create(:task) }
        let!(:article) { create(:article) }

        let(:params) do
          { id: task.id, title: 'test1', article_id: article.id }
        end

        it 'returns success response' do
          expect(response).to be_success
        end

        it 'return updated task' do
          expect(response.body[:task]).not_to be_empty
        end
      end

      context 'when invalid' do
        let(:params) do
          {}
        end

        it 'returns id is missing validation error' do
          expect(response.body[:errors]).to eq(
                                                id:  ['is missing', 'must be a number'],
                                                title: ['is missing'],
                                                article_id: ['is missing', 'must be a number']
                                               )
        end
      end
    end
  end
end

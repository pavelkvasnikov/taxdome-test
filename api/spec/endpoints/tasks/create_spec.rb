
RSpec.describe Endpoints::Tasks::Create do
  describe '#perform' do
    include_context 'endpoint request lets'
    describe 'when user creates an task' do
      context 'when is valid' do
        let!(:article) { create(:article) }
        let(:params) do
          { title: 'test1', article_id: article.id }
        end

        it 'returns success response' do
          expect(response).to be_success
        end

        it 'return created task' do
          expect(response.body[:task]).not_to be_empty
        end
      end

      context 'when invalid' do
        let(:params) do
          {}
        end

        it 'returns id is missing validation error' do
          expect(response.body[:errors]).to eq(
                                                title: ['is missing'],
                                                article_id: ['is missing', 'must be a number']
                                               )
        end
      end
    end
  end
end


RSpec.describe Endpoints::Articles::Destroy do
  describe '#perform' do
    include_context 'endpoint request lets'
    describe 'when user deletes an article' do
      context 'when is valid' do
        let!(:article) { create(:article) }
        let(:params) do
          { id: article.id }
        end

        it 'returns success response' do
          expect(response).to be_success
        end

        it 'return created article' do
          expect(response.body[:article]).not_to be_empty
        end
      end

      context 'when invalid' do
        let(:params) do
          {}
        end

        it 'returns id is missing validation error' do
          expect(response.body[:errors]).to eq(id: ['is missing', 'must be a number'])
        end
      end
    end
  end
end

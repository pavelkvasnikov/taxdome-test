RSpec.describe Endpoints::Articles::Index do
  describe '#perform' do
    include_context 'endpoint request lets'
    describe 'when user lists articles' do
      context 'when is valid' do
        let!(:article) { create(:article) }
        let(:params) { {board_id: article.board.id} }
        it 'returns success response' do
          expect(response).to be_success
        end

        it 'return list of all articles' do
          expect(response.body[:articles]).not_to be_empty
        end
      end

      context 'when invalid' do
        let(:params) { {} }
        it 'returns id is missing validation error' do
          expect(response.body[:errors]).to eq(board_id: ['is missing', 'must be a number'])
        end
      end
    end
  end
end

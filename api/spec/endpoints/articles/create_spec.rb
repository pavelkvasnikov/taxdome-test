
RSpec.describe Endpoints::Articles::Create do
  describe '#perform' do
    include_context 'endpoint request lets'
    describe 'when user creates an article' do
      context 'when is valid' do
        let!(:board) { create(:board) }
        let(:params) do
          { name: 'test1', board_id: board.id }
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
          expect(response.body[:errors]).to eq(
                                                name: ['is missing'],
                                                board_id: ['is missing', 'must be a number']
                                               )
        end
      end
    end
  end
end

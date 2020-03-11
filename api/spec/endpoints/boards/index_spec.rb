
RSpec.describe Endpoints::Boards::Index do
  describe '#perform' do
    include_context 'endpoint request lets'
    describe 'when user lists boards' do
      context 'when is valid' do
        let!(:board) { create(:board) }
        it 'returns success response' do
          expect(response).to be_success
        end

        it 'return list of all boards' do
          expect(response.body[:boards]).not_to be_empty
        end
      end
    end
  end
end

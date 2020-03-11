
RSpec.describe Endpoints::Boards::Create do
  describe '#perform' do
    include_context 'endpoint request lets'
    describe 'when user creates a board' do
      context 'when is valid' do
        let(:params) do
          { name: 'test1' }
        end

        it 'returns success response' do
          expect(response).to be_success
        end

        it 'return created board' do
          expect(response.body[:board]).not_to be_empty
        end
      end

      context 'when invalid' do
        let(:params) do
          {}
        end

        it 'returns id is missing validation error' do
          expect(response.body[:errors]).to eq(name: ['is missing'])
        end
      end
    end
  end
end

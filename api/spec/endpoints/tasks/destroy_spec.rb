
RSpec.describe Endpoints::Tasks::Destroy do
  describe '#perform' do
    include_context 'endpoint request lets'
    describe 'when user deletes an task' do
      context 'when is valid' do
        let!(:task) { create(:task) }
        let(:params) do
          { id: task.id }
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
          expect(response.body[:errors]).to eq(id: ['is missing', 'must be a number'])
        end
      end
    end
  end
end

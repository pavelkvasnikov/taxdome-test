RSpec.configure do |rspec|
  # This config option will be enabled by default on RSpec 4,
  # but for reasons of backwards compatibility, you have to
  # set it on RSpec 3.
  #
  # It causes the host group and examples to inherit metadata
  # from the shared context.
  rspec.shared_context_metadata_behavior = :apply_to_host_groups
end

RSpec.shared_context 'endpoint request lets', shared_context: :metadata do
  let(:params)       { {} }
  let(:headers) { {} }
  let(:request) do
    EndpointFlux::Request.new(headers: headers,
                              params: params,
                              remote_ip: '127.0.0.1')
  end
  let(:response) { subject.perform(request).last }
end

RSpec.configure do |rspec|
  rspec.include_context 'endpoint request lets', include_shared: true
end

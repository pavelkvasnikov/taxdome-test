FactoryBot.define do
  factory :article do
    name { SecureRandom.hex(20) }
    association :board, factory: :board
  end
end

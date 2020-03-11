FactoryBot.define do
  factory :task do
    title { SecureRandom.hex(20) }
    association :article, factory: :article
  end
end

FactoryBot.define do
  factory :board do
    name { SecureRandom.hex(20) }
    link { SecureRandom.hex(20) }
  end
end

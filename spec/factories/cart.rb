FactoryBot.define do
  factory :cart do
    association :user
    mode_of_payment { "cash" }
  end
end
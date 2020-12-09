FactoryBot.define do
  factory :todo do
    text
    is_completed
    project factory: :project
  end
end

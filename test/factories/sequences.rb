FactoryBot.define do
  sequence :string, aliases: %i[text title] do |n|
    "MyString_#{n}"
  end

  sequence :boolean, aliases: [:is_completed], &:odd?
end

FactoryBot.define do
  factory :user do
    nickname              {"あいうえ男"}
    email                 {"abc@gmail.com"}
    password              {"abc123"}
    password_confirmation {password}
    family_name           {"あい"}
    first_name            {"うえ男"}
    family_name_kana      {"あい"}
    first_name_kana       {"うえ男"}
    birthday              {"123"}
  end
end
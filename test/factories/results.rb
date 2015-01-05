FactoryGirl.define do
  factory :result do
    result_date '2014-09-14'
    score '9.99'
    user_id 1
    competition_id 1

    factory :result_2 do
      result_date '2014-09-15'
      score '9.76'
      user_id 1
      competition_id 1
    end
  end
end

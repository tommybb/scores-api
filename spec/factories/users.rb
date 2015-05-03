FactoryGirl.define do
  factory :user do
    name 'Marian'
    last_name 'Kiepski'
    birth_date '2014-09-15'
    school_class '4B'
    email 'mariank@gmail.com'
    admin false
    password 'kazek2015'

    factory :user_kazimierz do
      name 'Kazimierz'
      last_name 'Deyna'
      birth_date '2014-09-14'
      school_class '4D'
      email 'kazekd@gmail.com'
      password 'kazek2015'
    end
    factory :user_dupa do
      name 'Kazimierz'
      last_name 'Deyna'
      birth_date nil
      school_class nil
      email 'kazekd@gmail.com'
      password 'kazek2015'
    end
  end
end

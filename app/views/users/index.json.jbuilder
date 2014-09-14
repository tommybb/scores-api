json.array!(@users) do |user|
  json.extract! user, :id, :name, :last_name, :birth_date, :school_class, :email, :admin
  json.url user_url(user, format: :json)
end

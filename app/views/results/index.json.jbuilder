json.array!(@results) do |result|
  json.extract! result, :id, :result_date, :score, :user_id, :competition_id
  json.url result_url(result, format: :json)
end

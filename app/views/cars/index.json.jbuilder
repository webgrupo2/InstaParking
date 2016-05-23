json.array!(@cars) do |car|
  json.extract! car, :id, :user_id, :plate
  json.url car_url(car, format: :json)
end

json.array!(@items) do |item|
  json.extract! item, :id, :league_id, :plaintext, :description, :name, :group, :image
  json.url item_url(item, format: :json)
end

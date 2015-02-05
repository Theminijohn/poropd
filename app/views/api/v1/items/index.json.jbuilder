json.array! @items do |item|
  json.name        item.name
  json.league_id   item.league_id
  json.plaintext   item.plaintext
  json.description item.description
  json.group       item.group
  json.image       item.image
end
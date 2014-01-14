json.array!(@urls) do |url|
  json.extract! url, :id, :link, :key
  json.url url_url(url, format: :json)
end

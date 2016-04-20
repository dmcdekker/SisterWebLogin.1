json.array!(@comments) do |comment|
  json.extract! comment, :id, :content, :userblog_id
  json.url comment_url(comment, format: :json)
end

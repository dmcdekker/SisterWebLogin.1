json.array!(@userblogs) do |userblog|
  json.extract! userblog, :id, :title, :description, :user_id
  json.url userblog_url(userblog, format: :json)
end

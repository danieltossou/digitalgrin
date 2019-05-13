json.extract! response, :id, :content, :user_id, :message_id, :created_at, :updated_at
json.url response_url(response, format: :json)

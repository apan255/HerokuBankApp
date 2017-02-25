json.extract! account, :id, :account_id, :balance, :status, :user_id, :created_at, :updated_at
json.url account_url(account, format: :json)
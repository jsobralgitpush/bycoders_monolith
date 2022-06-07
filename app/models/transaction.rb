class Transaction < ApplicationRecord
    validates_presence_of :store_name, :transaction_type, :taxpayer_id, :amount
end

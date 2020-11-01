class Account < ApplicationRecord
    has_many :transactions
    validates :name, presence: true
    accepts_nested_attributes_for :transactions
end

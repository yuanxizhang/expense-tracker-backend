class TransactionSerializer < ActiveModel::Serializer
  attributes :id, :amount, :kind, :date, :description, :account_id
  belongs_to :account
end

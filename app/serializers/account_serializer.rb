class AccountSerializer < ActiveModel::Serializer
  attributes :id, :name, :balance, :transactions
  
  def questions
    ActiveModel::SerializableResource.new(object.transactions,  each_serializer: TransactionSerializer)
  end
end

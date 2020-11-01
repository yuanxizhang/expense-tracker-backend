class Api::V1::TransactionsController < ApplicationController
	before_action :find_transaction, only: [:show, :update, :destroy]

  # GET /transactions
  def index
    transactions = Transaction.all.order("created_at DESC")
    render json: transactions
  end

   # GET /transactions/:id
  def show
    render json: @transaction
  end

  # POST /transactions
  def create
    transaction = Transaction.new(transaction_params)
    
    if transaction.valid?
      transaction.save
      render json: transaction, status: :accepted
    else 
      render json: { errors: transaction.errors.full_messages }, status: :unprocessible_entity
    end
  end

  # PUT /transactions/:id
  def update
    @transaction.update(transaction_params)
    if @transaction.save
      render json: @transaction, status: :accepted
    else
      render json: { errors: @transaction.errors.full_messages }, status: :unprocessible_entity
    end
  end

  # DELETE /transactions/:id
  def destroy
    if @transaction.destroy
      render json: { message: "removed" }, status: :ok
    else
      render json: @transaction, message: "Failed to remove", status: :bad_request
    end
  end

  private

  def transaction_params
    # whitelist params
    params.require(:transaction).permit(:amount, :kind, :date, :description, :account_id)
  end

  def find_transaction
    @transaction = Transaction.find_by(:id => params[:id])
  end

end

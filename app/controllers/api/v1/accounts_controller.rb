class Api::V1::AccountsController < ApplicationController
	before_action :find_account, only: [:show, :update, :destroy]

  # GET /accounts
  def index
    accounts = Account.all
    render json: accounts
  end

   # GET /accounts/:id
  def show
    render json: @account
  end

  # POST /accounts
  def create
    account = Account.new(account_params)
    
    if account.valid?
      account.save
      render json: account, status: :accepted
    else 
      render json: { errors: account.errors.full_messages }, status: :unprocessible_entity
    end
  end

  # PUT /accounts/:id
  def update
    @account.update(account_params)
    if @account.save
      render json: @account, status: :accepted
    else
      render json: { errors: @account.errors.full_messages }, status: :unprocessible_entity
    end
  end

  # DELETE /accounts/:id
  def destroy
    if @account.destroy
      render json: { message: "removed" }, status: :ok
    else
      render json: @account, message: "Failed to remove", status: :bad_request
    end
  end

  private

  def account_params
    # whitelist params
    params.require(:account).permit(:name, :balance)
  end

  def find_account
    @account = Account.find_by(:id => params[:id])
  end

end

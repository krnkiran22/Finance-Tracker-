class TransactionsController < ApplicationController
  def index
    @transactions = current_user.transactions.order(date: :desc)
  end

  def new
    @transaction = current_user.transactions.build
    @categories = current_user.categories
  end

  def create
    @transaction = current_user.transactions.build(transaction_params)
    if @transaction.save
      redirect_to transactions_path, notice: 'Transaction created successfully.'
    else
      @categories = current_user.categories
      render :new
    end
  end

  def edit
    @transaction = current_user.transactions.find(params[:id])
    @categories = current_user.categories
  end

  def update
    @transaction = current_user.transactions.find(params[:id])
    if @transaction.update(transaction_params)
      redirect_to transactions_path, notice: 'Transaction updated successfully.'
    else
      @categories = current_user.categories
      render :edit
    end
  end

  def destroy
    @transaction = current_user.transactions.find(params[:id])
    @transaction.destroy
    redirect_to transactions_path, notice: 'Transaction deleted successfully.'
  end

  private

  def transaction_params
    params.require(:transaction).permit(:description, :amount, :transaction_type, :category_id, :date)
  end
end
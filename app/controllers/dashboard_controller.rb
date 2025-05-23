class DashboardController < ApplicationController
  def index
    @total_income = current_user.transactions.where(transaction_type: 'income').sum(:amount)
    @total_expense = current_user.transactions.where(transaction_type: 'expense').sum(:amount)
    @balance = @total_income - @total_expense
    @recent_transactions = current_user.transactions.order(date: :desc).limit(5)
  end
end
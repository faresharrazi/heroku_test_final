class Transaction < ApplicationRecord
  after_save :update_account_balance
  after_destroy :update_account_balance
  belongs_to :account
  validates :title, :amount, :category, :date, presence: true
  validates :amount, numericality: { greater_than: 0 }

  private

  def update_account_balance
    account.update(balance: account.transactions.sum(:amount))
  end
end
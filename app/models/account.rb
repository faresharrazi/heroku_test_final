class Account < ApplicationRecord
    has_many :transactions, dependent: :destroy
    validates :name, presence: true
    validates :balance, numericality: true
end

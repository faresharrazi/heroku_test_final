class TransactionsController < ApplicationController
  before_action :set_account
  before_action :set_transaction, only: %i[show edit update destroy]

  # GET /accounts/:account_id/transactions
  def index
    @transactions = @account.transactions
  end

  # GET /accounts/:account_id/transactions/1
  def show
  end

  # GET /accounts/:account_id/transactions/new
  def new
    @transaction = @account.transactions.build
  end

  # GET /accounts/:account_id/transactions/1/edit
  def edit
  end

  # POST /accounts/:account_id/transactions
  def create
    @transaction = @account.transactions.build(transaction_params)

    respond_to do |format|
      if @transaction.save
        format.html { redirect_to account_transactions_path(@account), notice: "Transaction was successfully created." }
        format.json { render :show, status: :created, location: @transaction }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accounts/:account_id/transactions/1
  def update
    respond_to do |format|
      if @transaction.update(transaction_params)
        format.html { redirect_to account_transaction_path(@account, @transaction), notice: "Transaction was successfully updated." }
        format.json { render :show, status: :ok, location: @transaction }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accounts/:account_id/transactions/1
  def destroy
    @transaction.destroy!

    respond_to do |format|
      format.html { redirect_to account_transactions_path(@account), status: :see_other, notice: "Transaction was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Find the account from the params
  def set_account
    @account = Account.find(params[:account_id])
  end

  # Find the transaction scoped to the account
  def set_transaction
    @transaction = @account.transactions.find(params[:id])
  end

  # Strong parameters
  def transaction_params
    params.require(:transaction).permit(:title, :amount, :category, :date)
  end
end

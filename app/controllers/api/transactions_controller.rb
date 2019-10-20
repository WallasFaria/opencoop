class Api::TransactionsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_cooperation

  def create
    @transaction = Transaction.new(transaction_params)

    if @transaction.save
      render json: @transaction
    else
      render json: { errors: @transaction.errors }
    end
  end

  private

  def set_cooperation
    @cooparation = Cooperation.find(params[:cooperation_id])
  end

  def transaction_params
    params.require(:transaction).permit(:description, :value)
                                .merge(cooperation: @cooparation)
  end
end

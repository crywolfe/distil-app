class AccountsController < ActionController::Base

  def index

  end

  def create

    account = Account.new(account_params)
    if account.save
      render json: account, status: 201, location: account
    else
      render json: account.errors, status: 422
    end


  end

  def show

  end

  def update

  end

  def destroy

  end

  def account_params
    params.require(:account).permit(:name)
  end


  end




end

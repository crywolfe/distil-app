module API
  class AccountsController < ActionController::Base

    def index
      @accounts = Account.all
    end

    def create
      if account.save
        render json: account, status: 201, location: account
      else
        render json: account.errors, status: 422
      end
    end

    def show
      account = Account.find(params[:id])
      render json: account, status: 200
    end

    def update
      account = Account.find(params[:id])
      if account.update(account_params)
        render json: account, status: 200
      else
        render json: account.errors, status: 422
      end
    end

    def destroy
      account = Account.find(params[:id])
      account.destroy
      head 204
    end

    def account_params
      params.require(:account).permit(:name)
    end

  end
end

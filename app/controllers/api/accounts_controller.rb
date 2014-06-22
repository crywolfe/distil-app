module API
  class AccountsController < ActionController::Base

    def index
      @accounts = Account.all
      # redirect_to (root_path)

      # redirect_to (api_accounts_path)

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
      binding.pry
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
module API
  class AccountsController < ActionController::Base

    def index
      @accounts = Account.all
    end
    # handle_asynchronously :index

    def create
      account = Account.new(account_params)
      if account.save
        render json: account, status: 201, location: account
      else
        render json: account.errors, status: 422
      end
    end
    # handle_asynchronously :create

    def show
      account = Account.find(params[:id])
      render json: account, status: 200
    end
    # handle_asynchronously :show

    def update
      account = Account.find(params[:id])
      if account.update(account_params)
        render json: account, status: 200
      else
        render json: account.errors, status: 422
      end
    end
    # handle_asynchronously :update

    def destroy
      account = Account.find(params[:id])
      account.destroy
      head 204
    end
    # handle_asynchronously :destroy

    def account_params
      params.require(:account).permit(:name)
    end


  end
end

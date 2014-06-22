class WelcomeController < ActionController::Base
  def index
    redirect_to (api_accounts_path)
  end

end

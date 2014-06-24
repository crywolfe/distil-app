module API
  class DomainsController < ActionController::Base

    def index
      @domains = Domain.all
    end
    # handle_asynchronously :index

    def create
      domain = Domain.new(domain_params)
      domain[:origin_ip_address] = domain.ip_address_finder(domain[:hostname])
      # binding.pry
      if domain.save
        render json: domain, status: 201, location: domain
      else
        render json: domain.errors, status: 422
      end
    end
    # handle_asynchronously :create

    def show
      domain = Domain.find(params[:id])
      render json: domain, status: 200
    end
    # handle_asynchronously :show

    def update
      domain = Domain.find(params[:id])
      if domain.update(domain_params)
        render json: domain, status: 200
      else
        render json: domain.errors, status: 422
      end
    end
    # handle_asynchronously :update

    def destroy
      domain = Domain.find(params[:id])
      domain.destroy
      head 204
    end
    # handle_asynchronously :destroy

    def domain_params
      params.require(:domain).permit(:hostname, :origin_ip_address)
    end

  end
end

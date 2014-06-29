module API
  class DomainsController < ActionController::Base

    def index
      @domains = Domain.all
    end

    def create
      @domain = Domain.create(domain_params)

      if @domain.save
        ApiWorker.perform_async(@domain.id)
        render json: @domain, status: 201
      else
        render json: @domain.errors, status: 422
      end
    end

    def show
      domain = Domain.find(params[:id])
      render json: domain, status: 200
    end

    def update
      domain = Domain.find(params[:id])
      if domain.update(domain_params)
        render json: domain, status: 200
      else
        render json: domain.errors, status: 422
      end
    end

    def destroy
      domain = Domain.find(params[:id])
      domain.destroy
      head 204
    end

    def domain_params
      params.require(:domain).permit(:hostname)
    end

  end
end

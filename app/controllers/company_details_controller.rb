class CompanyDetailsController < ApplicationController
    before_action :authenticate_user!

      def index
        @company_detail = current_user.company_detail
      end

      def new
        @company_detail = CompanyDetail.new 
      end

      def show
         @company_detail = CompanyDetail.find(params[:id])
         redirect_to @company_detail
      end
     
      def create
        @company_detail = current_user.build_company_detail(company_detail_params)
        if @company_detail.save
            redirect_to company_details_path, notice: 'company_detail was successfully created.'
        else
            render :new
        end
      end

      def edit
        @company_detail = CompanyDetail.find(params[:id])
      end
      def update
        @company_detail = CompanyDetail.find(params[:id])
        if @company_detail.present?
          @company_detail.update(company_detail_params)
           redirect_to company_details_path
        else
          render  :edit
        end
      end

      def destroy
        @company_detail = CompanyDetail.find_by(id: params[:id])
          if @company_detail.present?
            @company_detail.destroy
            redirect_to company_details_path, notice: ' Confirmed Successfully'
          end
      end

      private
      def company_detail_params
        params.require(:company_detail).permit(:company_name, :company_email, :company_address,:company_phone, :user_id)
      end
end

module Convert
  class ProcessController < BaseController

    rescue_from Degree::UnspecifiedInputType do
      respond_to do |format|
        format.json { render json: {error: 'Wrong input degree type passed'} }
      end
    end

    rescue_from Degree::UnspecifiedOutputType do
      respond_to do |format|
        format.json { render json: {error: 'Wrong output degree type passed'} }
      end
    end

    def convert
      respond_to do |format|
        format.json { render json: {value: degree_model(params[:from]).convert_to(params[:to].to_sym) } }
      end
    end

    private

    def degree_model type
      ::Degree.new(params[:value].to_f, type.to_sym)
    end
  end
end

module Convert
  class ProcessController < BaseController

    rescue_from Degree::UnspecifiedType do
      respond_to do |format|
        format.json { render json: {error: 'Wrong degree type passed'} }
      end
    end

    def c2f
      respond_to do |format|
        format.json { render json: {value: degree_model(:celsium).to_farengheit } }
      end
    end

    def f2c
      respond_to do |format|
        format.json { render json: {value: degree_model(:farengheit).to_celsium } }
      end
    end

    private

    def degree_model type
      ::Degree.new(params[:value].to_f, type)
    end
  end
end

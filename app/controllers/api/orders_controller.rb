class Api::OrdersController < ApplicationController
  def create
    @input = ""
    @input = params[:commands] if params.has_key?(:commands)
    @result = ""
    @result = ToyRobot.calculate(@input) if @input != "Undefined"
    render json: @result.join(',')
  end
end

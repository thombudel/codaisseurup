class RegistrationsController < ApplicationController
  before_action :authenticate_user!

  def create
     @registration = current_user.registrations.new(registration_params)
     @registration.event_id = params[:event_id]
     @registration.set_total_price
     @registration.set_status
     @registration.save

    redirect_to @registration.event, notice: "Thank you for your registration!"
  end

  private

  def registration_params
    params.require(:registration).permit(:guests_count)
  end
end

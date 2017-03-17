class RegistrationsController < ApplicationController
  before_action :authenticate_user!

  def create
    @registration = current_user.registrations.create(registration_params)

    redirect_to @registration.event, notice: "Thank you for your registration!"
  end

  private

  def registration_params
    params.require(:registration).permit(:price, :guests_count, :event_id)
  end
end

class RegistrationsController < ApplicationController
  before_action :set_registration, only: [:show, :edit, :update, :destroy]
   def create
    @registration = Registration.new(registration_params)
    
    if @registration
      case params['payment_method']
        when "paypal"
          redirect_to @registration.paypal_url(registration_path(@registration))
        when "card"
          if purchase
            redirect_to registration_path(@registration), notice: @registration.card.card_transaction.message
          else
            redirect_to registration_path(@registration), alert: @registration.card.card_transaction.message
          end
      end
    else
      render :new
    end
  end
  
  def registration_params
    params.require(:registration).permit(:course_id, :full_name, :company, :email, :telephone,                                      
                                              :first_name, :last_name, :card_type, :card_number,
                                              :card_verification, :card_expires_on)
  end


   def new
    @registration = Registration.new
    @registration.build_card
    @course = Course.find_by id: params["course_id"]
  end
 


  # GET /registrations
  def index
    @registrations = Registration.all
    #render :plain => @registrations.inspect

  end

  # GET /registrations/1
  def show
  end

  # GET /registrations/new
 
  # POST /registrations

def purchase

    response = GATEWAY.purchase(price_in_cents, credit_card, purchase_options)
    
    #create_card_transaction(action: "purchase", amount: price_in_cents, response: response)
    
    #@registration.update_attribute(:purchased_at, Time.now) if response.success?
    #response.success?
  end

  def credit_card
    render :plain => @registrations.inspect


    @credit_card ||= ActiveMerchant::Billing::CreditCard.new(
        type:                @registration.card_type,
        number:              @registration.card_number,
        verification_value:  @registration.card_verification,
        month:               @registration.card_expires_on.month,
        year:                @registration.card_expires_on.year,
        first_name:          @registration.first_name,
        last_name:           @registration.last_name
    )
  end

  def price_in_cents
    (@registration.course.price*100).round
  end

  private

  def purchase_options
    {
        ip: "122.222.211.222",
        billing_address: {
            name:      "Flaying Cakes",
            address1:  "123 5th Av.",
            city:      "New York",
            state:     "NY",
            country:   "US",
            zip:       "10001"
        }
    }
  end

  def validate_card
    unless credit_card.valid?
      credit_card.errors.full_messages.each do |message|
        errors.add :base, message
      end
    end
  end


 

  protect_from_forgery except: [:hook]
  def hook
    params.permit! # Permit all Paypal input params
    status = params[:payment_status]
    if status == "Completed"
      @registration = Registration.find params[:invoice]
      @registration.update_attributes notification_params: params, status: status, transaction_id: params[:txn_id], purchased_at: Time.now
    end
    render nothing: true
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_registration
      @registration = Registration.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def registration_params
    params.require(:registration).permit(:course_id, :full_name, :company, :email, :telephone,                                      
                                              :first_name, :last_name, :card_type, :card_number,
                                              :card_verification, :card_expires_on)
  end


end

class ChargesController < ApplicationController


  def new
  end

  def create
    # Amount in cents
    @amount = 500

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )
    #
 #   charge = Stripe::Charge.create(
 #     
  #    :amount      => @amount,
  #    :description => 'Rails Stripe customer',
  #    :currency    => 'usd'
 #   )
    
    plan = Stripe::Plan.create(
      :customer    => customer.id,
      :name => "Pro Plan",
      :id => "pro-monthly",
      :interval => "month",
      :currency => "usd",
      :amount => 3000,
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end









end

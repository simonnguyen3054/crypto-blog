class MerchantsController < ApplicationController
  def new
    @merchant = Merchant.new
  end

  def create 
    #render plain: params[:merchant].inspect
    @merchant = Merchant.new(merchant_params)
    if @merchant.save
      flash[:notice] = "Merchant was successfully created"
      redirect_to merchant_path(@merchant)
    else 
      render 'new'
    end
  end

  def show
    @merchant = Merchant.find(params[:id])
  end 

  #Need to whitelist merchant params
  private
    def merchant_params
      params.require(:merchant).permit(:name, :description)
    end

end
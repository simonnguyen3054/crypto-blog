class MerchantsController < ApplicationController
  before_action :set_merchant, only: [:edit, :update, :show, :destroy]

  def index 
    @merchants = Merchant.all
  end 

  def new
    @merchant = Merchant.new
  end

  def edit
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

  def update
    if @merchant.update(merchant_params)
      flash[:notice] = "Merchant was successfully updated"
      redirect_to merchant_path(@merchant)
    else 
      render 'edit'
    end
  end 

  def show
  end 

  def destroy
    @merchant.destroy
    flash[:notice] = "Merchant was successfully deleted"
    redirect_to merchants_path
  end 

  #Need to whitelist merchant params
  private
    def set_merchant 
      @merchant = Merchant.find(params[:id])
    end

    def merchant_params
      params.require(:merchant).permit(:name, :description)
    end

end
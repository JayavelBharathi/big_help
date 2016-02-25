class CustomersController < ApplicationController
  before_filter :authenticate_user!

  # before_action :set_customer, only: [:show, :edit, :update, :destroy]

  # GET /customers
  # GET /customers.json
  def index
    @customers = User.where(:roles => "Customer")
  end

  # GET /customers/1
  # GET /customers/1.json
  def show
  end

  # GET /customers/new
  def new
    @customer = User.new
  end

  # GET /customers/1/edit
  def edit
  end

  # POST /customers
  # POST /customers.json
  def create
    @customer = User.new(customer_params)
    respond_to do |format|
      if @customer.save
        format.html { redirect_to customers_path, notice: 'Customer was successfully created.' }
        format.json { render :show, status: :created, location: @customer }
      else
        format.html { render :new }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customers/1
  # PATCH/PUT /customers/1.json
  def update

  end

  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy

  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_params
      params.require(:user).permit(:name, :email, :roles, :password, :password_confirmation, :csrg)
    end
end

class CarsController < ApplicationController
  before_action :set_car, only: [:show, :edit, :update, :destroy]

  # GET /cars/new
  def new
    @car = Car.new
    @parts = Part.all
    @makes = Make.all
  end

  # GET /cars
  # GET /cars.json
  def index
    @cars = Car.all
    @cars = Car.search(params[:search])
  end

  # GET /cars/1
  # GET /cars/1.json
  def show
  end



  # GET /cars/1/edit
  def edit
    @parts = Part.all
    @makes = Make.all
  end

  # POST /cars
  # POST /cars.json
  def create
    @car = Car.new(car_params)
   # @parts = Part.all
   # @makes = Make.all

    respond_to do |format|
      if @car.save
        format.html { redirect_to @car, notice: 'Car was successfully created.' }
        format.json { render :show, status: :created, location: @car }
      else
        format.html { render :new }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cars/1
  # PATCH/PUT /cars/1.json
  def update
    respond_to do |format|
      if @car.update(car_params)
        format.html { redirect_to @car, notice: 'Car was successfully updated.' }
        format.json { render :show, status: :ok, location: @car }
      else
        format.html { render :edit }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cars/1
  # DELETE /cars/1.json
  def destroy
    @car.destroy
    respond_to do |format|
      format.html { redirect_to cars_url, notice: 'Car was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_car
      @car = Car.find(params[:id])
    end

  #test "Car name shouldn't be empty" do
   # assert Car.where("name like ?", "x5").length == 0
  #end

  #test "shouldn't find Maserati" do
    #get search_cars_url, params: { search: "Maserati" }
   # assert_select 'td', false
  #end



  # Never trust parameters from the scary internet, only allow the white list through.
    def car_params
      params.require(:car).permit(:name, :search, :make_id, :part_id)
    end
end

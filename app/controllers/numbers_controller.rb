class NumbersController < ApplicationController
  
  # GET /numbers
  # GET /numbers.json
  def index
    numbers = Number.all
    @numbers_hash = {}
    (1..90).each {|n| @numbers_hash[n] = false}
    numbers.each {|n| @numbers_hash[n.value] = true }

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @numbers_hash }
    end
  end
  
  def admin
    @number = Number.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @number }
    end
  end

  # POST /numbers
  # POST /numbers.json
  def create
    @number = Number.new(params[:number])

    respond_to do |format|
      if @number.save
        format.json { render json: @number, status: :created }    
      else
        format.json { render json: @number.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /numbers/1
  # DELETE /numbers/1.json
  def destroy
    @number = Number.where(:value => params[:number][:value]).first
    @number.destroy

    respond_to do |format|
      format.json { head :no_content }
    end
  end
end
class ScoutsController < ApplicationController

	def index
		@units = Unit.where(:Nazwa => params[:nazwa]).first
		@zastepowy = Scout.find(@units.Zastepowy)
	end
	
	def create
		@newunit = Unit.new
		@harcerze = Scout.all
	end
	
	def new
	@newunit = Unit.new(unit_params)
			if @newunit.valid?
			@newunit.save
			flash[:notice] = "Dodano zastęp o nazwie #{@newunit.Nazwa}."
			redirect_to units_index_path
		else
			flash[:notice] = "Nie udalo się dodać zastępu o nazwie #{@newunit.Nazwa}"
		end
	end
	
	def show
		@scouts = Scout.all
		@zastep = Unit.all
	end

end


private

	def unit_params
		params.require(:unit).permit(:id, :Nazwa, :opis, :Zastepowy)
	end
class EmployeesController < ApplicationController

  def index
    @employees = Employee.all
  end

  def new
    @employee = Employee.new
    @user_id = params["id"]
    print(@user_id)
  end

  def create
    @employee = Employee.new(user_params)

    respond_to do |format|
      if @employee.save
        format.html { redirect_to user_url(@employee), notice: "Employee was successfully created." }
        format.turbo_stream { render turbo_stream: turbo_stream.prepend('employees', partial: 'employees/employee', locals: {employee: @employee}) }
      else
        format.html { render :new, status: :unprocessable_entity }

        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def user_params
    params.require(:employee).permit(:user_id, :date_started, :date_employment_ended)
  end

end

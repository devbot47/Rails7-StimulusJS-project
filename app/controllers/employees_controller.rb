class EmployeesController < ApplicationController
  # before_action :set_employee, only: %i[ show edit update destroy ]

  def index
    @users = Employee.all
  end

  def show
  end

  def new
    @employee = Employee.new
    @user_id = params["id"]
    print(@user_id)
    # @user = User.find @user_id
  end

  def edit
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

  # def update
  #   respond_to do |format|
  #     if @user.update(user_params)
  #       format.turbo_stream { render turbo_stream: turbo_stream.replace(@user, partial: "users/user", locals: {user: @user}) }
  #       format.json { render :show, status: :ok, location: @user }
  #     else
  #       format.html { render :edit, status: :unprocessable_entity }
  #       format.json { render json: @user.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # def destroy
  #   @user.destroy
  #
  #   respond_to do |format|
  #     format.html { redirect_to users_url, notice: "User was successfully destroyed." }
  #     format.json { head :no_content }
  #   end
  # end

  private
  def set_employee
    @employee = Employee.find(params[:id])
  end

  def user_params
    params.require(:employee).permit(:user_id, :date_started, :date_employment_ended)
  end

end

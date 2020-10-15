class EmployeesController < ApplicationController
    
    before_action :set_emp, only: [:show, :edit, :update]


    def index
        @emps = Employee.all
    end

    def new
        @emp = Employee.new
        @dogs = Dog.all
    end

    def create
        @emp = Employee.new(emp_params)
        if @emp.save
        redirect_to employee_path(@emp)
        else
            flash[:errors] = @emp.errors.full_messages
            redirect_to new_employee_path
        end
    end

    def edit
        @dogs = Dog.all
    end

    def update
        @emp.update(emp_params)
        if @emp.valid?
            redirect_to employee_path(@emp)
        else
            flash[:errors] = @emp.errors.full_messages
            redirect_to edit_employee_path(@emp)
        end
    end

    private

    def set_emp
        @emp = Employee.find_by_id(params[:id])
    end

    def emp_params
        params.require(:employee).permit(:first_name,:last_name,:alias, :title, :office, :dog_id, :img_url)
    end
end


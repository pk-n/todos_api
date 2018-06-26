class TodosController < ApplicationController
	include Response

	before_action :set_todo, only: [:show, :update, :destroy]

	def index
		@todos = Todo.all
		json_response(data: @todos)
	end

	def create
		@todo = Todo.create!(todo_params)
		json_response(data: @todo, status: :created)
	end

	def show
		json_response @todo
	rescue ActiveRecord::RecordNotFound => e
		json_response(data: {message: e.message}, status: :not_found)
	end

	def update
		
	end

	def destroy
		
	end

	private
	
	def set_todo
		@todo = Todo.find(params[:id])
	end

	def todo_params
		params.require(:todo).permit(:created_by, :title)
	end
end

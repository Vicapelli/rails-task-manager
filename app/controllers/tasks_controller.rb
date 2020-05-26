class TasksController < ApplicationController

    before_action :set_task, only: [:show, :edit, :update, :destroy]

    def index
    # listar todos os task
      @tasks = Task.all
    end
    
    def show
    # mostrar detalhes de um task específico
    end
    
    def new
    # mostrar o formulário para criar um novo task
      @task = Task.new
    end
    
    def create
    # crio um novo task no meu BD com as infos que o usuário inputou
      new_task = Task.create(task_params)
      redirect_to tasks_path
    end
    
    def edit
    end
    
    def update
    # atualizo o meu task com as infos que o usuário inputou
      @task.update(task_params)
      redirect_to tasks_path
    end
    
    def destroy
      @task.destroy
      redirect_to tasks_path
    end

    private

    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      # pegue a hash task dentro de params e só permita os campos
      # title, details and completed (qualquer outro não passará)
      params.require(:task).permit(:title, :details, :completed)
    end

end

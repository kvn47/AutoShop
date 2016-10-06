module Admin
  class ComponentsController < BaseController
    before_action :set_component, except: :index

    def index
      @components = Component.ordered
      respond_to do |format|
        format.html
      end
    end

    def new
      respond_to do |format|
        format.html
      end
    end

    def create
      @component.assign_attributes component_params
      respond_to do |format|
        if @component.save
          format.html { redirect_to admin_components_path }
        else
          format.html { render :new }
        end
      end
    end

    def edit
      respond_to do |format|
        format.html
      end
    end

    def update
      respond_to do |format|
        if @component.update component_params
          format.html { redirect_to admin_components_path }
        else
          format.html { render :edit }
        end
      end
    end

    def destroy
      @component.destroy
      respond_to do |format|
        format.html
      end
    end

    private

    def set_component
      @component = params[:id] ? Component.find(params[:id]) : Component.new
    end

    def component_params
      params.require(:component).permit(:name, :group, :price)
    end
  end
end
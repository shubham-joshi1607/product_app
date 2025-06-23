class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy]

  def index
    @products = Product.all
  end

  def show; end

  def new
    @product = Product.new
    build_nested_fields
  end

  def edit
    build_nested_fields
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to @product, notice: 'Product created successfully.'
    else
      build_nested_fields
      render :new
    end
  end

  def update
    if @product.update(product_params)
      redirect_to @product, notice: 'Product updated successfully.'
    else
      build_nested_fields
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path, notice: 'Product deleted.'
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def build_nested_fields
    1.times { @product.technical_data.build }
    1.times { @product.ordering_informations.build }
    1.times { @product.connection_data.build }
    1.times { @product.dimensions.build }
  end

  def product_params
    params.require(:product).permit(
      :name, :description, :image,
      technical_data_attributes: [:id, :key, :value, :_destroy],
      ordering_informations_attributes: [:id, :key, :value, :_destroy],
      connection_data_attributes: [:id, :key, :value, :_destroy],
      dimensions_attributes: [:id, :key, :value, :_destroy]
    )
  end
end

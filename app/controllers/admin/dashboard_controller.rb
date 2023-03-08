class Admin::DashboardController < ApplicationController
  def show
    @total_product = Product.count(:all)
    @total_category = Product.distinct.count(:category_id)
    {total_product: @total_product, total_category: @total_category}
  end
end

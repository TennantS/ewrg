class PermittedParams < Struct.new(:params)
  %w(product user).each do |m|
    define_method(m) { params.require(m.to_sym).permit(*send("#{m}_attributes".to_sym)) }
  end

  def product_attributes
    [:name, :description, :part_number]
  end

  def user_attributes
    [:email, :password, :password_confirmation]
  end
end
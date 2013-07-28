class PermittedParams < Struct.new(:params)
  # %w(example).each do |m|
  #   define_method(m) { params.require(m.to_sym).permit(*send("#{m}_attributes".to_sym)) }
  # end

  # def example_attributes
  #   [:name]
  # end
end
class Business
  include ActiveModel::Validations

  attr_accessor :name, :distance, :display_address, :phone

  validates_presence_of :name, :distance, :display_address

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end
end
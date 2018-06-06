class SuperRepository
  attr_accessor :all
  
  def initialize
    @all = []
  end

  def find_by_id(id)
    @all.find do |element|
      element.id == id
    end
  end

  def delete(id)
    @all.delete_if do |element|
      element.id == id
    end
  end

  def inspect
    "#<#{self.class} #{@invoices.size} rows>"
  end
end
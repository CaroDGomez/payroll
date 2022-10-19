require "test_helper"

class EmployeeTest < ActiveSupport::TestCase

  #DB columns
  test "name column" do
    assert Employee.column_names.include?('name'), 'Column name exist in Employee table'
    assert_equal 'string', employee_type_column('name').type.to_s, 'correct type in column name'
    assert_equal false, employee_type_column('name').null, 'column name value required'
  end

  test "nit column" do
    assert Employee.column_names.include?('nit'), 'Column nit exist in Employee table'
    assert_equal 'string', employee_type_column('nit').type.to_s, 'correct type in column nit'
    assert_equal false, employee_type_column('nit').null, 'column nit value is required'
  end

  test "email column" do
    assert Employee.column_names.include?('email'), 'Column email exist in Employee table'
  end
  #Associations
  #Index
  #Validations
  #Methods

  def employee_type_column(column)
    Employee.columns.detect { |each| each.name == column.to_s}
  end
end

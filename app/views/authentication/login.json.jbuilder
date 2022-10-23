json.data do
  json.token @token
  json.exp @time.strftime("%m-%d-%Y %H:%M")
  json.employee_name @employee.name
end
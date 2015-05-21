user_input = Array.new
i = 0
results = Array.new
loop do
  abort('ERR') if (user_input[i] = gets.chomp + $/) == $/
  if user_input[i].downcase.include? 'quit'
    user_input.delete(user_input[i])
    break
  end
  i += 1
end

user_input.each do |equation|
  op_stack = Array.new
  equation.each_char do |char|
    if char == '('
      op_stack.push(char)
    elsif char == ')'
      op_stack.pop()
    end
  end
  begin
    if !op_stack.empty?
      raise "EXCEPTION"
    end
    results << eval(equation.to_s)
  rescue Exception => e
    abort('ERR')
  end

end
results.each {|result| puts result}
print 'SUCCESS'
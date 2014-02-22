# Prepare students and absent students array
students = [
  {:first_name => "Jasminder", :middle_name => "Kaur", :last_name => "Bajwa"},
  {:first_name => "Jatinder", :middle_name => "Pal Singh", :last_name => "Bajwa"},
  {:first_name => "Terjeevan", :middle_name => "Kaur", :last_name => "Bajwa"},
  {:first_name => "David", :middle_name => "", :last_name => "Harrison"},
  {:first_name => "Thomas", :middle_name => "", :last_name => "Gospel"},
  {:first_name => "Hollie", :middle_name => "", :last_name => "Jepson"},
  {:first_name => "Kate", :middle_name => "", :last_name => "Ball"},
  {:first_name => "Liam", :middle_name => "", :last_name => "McArdle"},
  {:first_name => "Samuel", :middle_name => "", :last_name => "Marshall"},
  {:first_name => "Caroline", :middle_name => "", :last_name => "Ingledew"},
  {:first_name => "Jasleen", :middle_name => "Kaur", :last_name => "Dwarika"}
]

def print_s(students)
  if students.length != 1
    return "s"
  end
end

def print_header
  # Print instructions and some information
  puts "Welcome to the register. Enter 'P' for Present, 'A' for Absent."
end

def check_student_attendence(students)
  # Create counters for present and absent
  student_data = {:present => 0, :absent => 0, :absent_students => []}

  # Iterate through students arrary
  students.each { |student|
    puts "#{student[:first_name]} #{student[:middle_name]} #{student[:last_name]}".sub '  ', ' '

    # Get input on whether student is present or absent
    attendence = gets.chomp.upcase
    until attendence == "P" || attendence == "A"
      puts "Incorrect Entry, please enter 'P' for Present or 'A' for Absent"
      student_name = "#{student[:first_name]} #{student[:middle_name]} #{student[:last_name]}".sub '  ', ' '
      attendence = gets.chomp.upcase
    end
    if attendence == "P"
      student_data[:present] += 1
    elsif attendence == "A"
      student_data[:absent] += 1
      student_data[:absent_students] << student[:first_name]
    end
  }
  return student_data
end

def print_footer(students, student_data)
  puts "That is the end of the register of #{students.length} student#{print_s(students)}"
  puts "#{student_data[:present]} are present and #{student_data[:absent]} are absent. Please contact the parents of:"
  puts student_data[:absent_students]
end

print_header
student_data = check_student_attendence(students)
print_footer(students, student_data)


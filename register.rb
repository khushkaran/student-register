text_width = 75

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

# Allows plural of student
def print_s(students)
  if students.length != 1
    return "s"
  end
end

# Print instructions and some information
def print_header(text_width)
  puts "=================".center(text_width)
  puts "Welcome to the Register".center(text_width)
  puts "Enter 'P' for Present, 'A' for Absent, 'L' for Late".center(text_width)
  puts "=================".center(text_width)
end

def check_student_attendence(students,text_width)
  # Create counters for present and absent
  student_data = {:present => 0, :absent => 0, :late => 0, :absent_students => [], :late_students => []}

  # Iterate through students arrary
  students.each { |student|
    student_name = "#{student[:first_name]} #{student[:middle_name]} #{student[:last_name]}".sub '  ', ' '
    puts student_name.center(text_width)
    # Get input on whether student is present or absent
    attendence = gets.chomp.upcase
    until attendence == "P" || attendence == "A" || attendence == "L"
      puts "Incorrect Entry, please enter 'P' for Present, 'A' for Absent 'L' for Late".center(text_width)
      puts student_name.center(text_width)
      attendence = gets.chomp.upcase
    end

    # Add data from entry 
    if attendence == "P"
      student_data[:present] += 1
    elsif attendence == "A"
      student_data[:absent] += 1
      student_data[:absent_students] << student[:first_name]
    elsif attendence == "L"
      student_data[:late] += 1
      student_data[:late_students] << student[:first_name]
    end
  }
  return student_data
end

# Print footer, and provide information to teacher
def print_footer(students, student_data, text_width)
  print "\n"
  puts "=================".center(text_width)
  puts "That is the end of the register of #{students.length} student#{print_s(students)}".center(text_width)
  puts "#{student_data[:present]} are present, #{student_data[:absent]} are absent and #{student_data[:late]} are late.".center(text_width)
  if student_data[:late] != 0 || student_data[:absent] != 0
    puts "Please contact the parents of:".center(text_width)
  end
  if student_data[:late] != 0
    print "\n"
    puts "==== Late ====".center(text_width)
    student_data[:late_students].each { |student|
      puts student.center(text_width)
    }
  end

  if student_data[:absent] != 0
    print "\n"
    puts "==== Absent ====".center(text_width)
    student_data[:absent_students].each { |student|
      puts student.center(text_width)
    }
  end
end

print_header(text_width)
student_data = check_student_attendence(students,text_width)
print_footer(students, student_data, text_width)


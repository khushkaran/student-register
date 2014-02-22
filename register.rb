students = [
  {:name => "Jasminder Kaur Bajwa"},
  {:name => "Jatinder Pal Singh Bajwa"},
  {:name => "Terjeevan Kaur Bajwa"},
  {:name => "David Harrison"},
  {:name => "Thomas Gospel"},
  {:name => "Hollie Jepson"},
  {:name => "Kate Ball"},
  {:name => "Liam McArdle"},
  {:name => "Samuel Marshall"},
  {:name => "Caroline Ingledew"},
  {:name => "Jasleen Kaur Dwarika"}
]

def print_header
  # Print instructions and some information
  puts "Welcome to the register. Enter 'P' for Present, 'A' for Absent."
end

def check_student_attendence(students)
  students.each { |student|
    puts student[:name]
    attendence = gets.chomp.upcase
    until attendence == "P" || attendence == "A"
      puts "Incorrect Entry, please enter 'P' for Present or 'A' for Absent"
      puts student[:name]
      attendence = gets.chomp.upcase
    end
    if attendence == "P"
      puts "Present"
    elsif attendence == "A"
      puts "Absent"
    end
  }
end

print_header
check_student_attendence(students)
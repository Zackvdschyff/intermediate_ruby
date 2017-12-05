#Intermediate_Ruby

class User
  attr_reader :first_name, :last_name

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
  end
end

class Student < User
  def initialize(first_name, last_name, university)
    super(first_name, last_name)
    @university = university
    @enrollments =[]
  end

  def enroll(course)
      enrollment = Enrollment.new(self, course)
      @enrollments << enrollment
      enrollment
  end

  def enrolled?(course)
    found = false
    @enrollments.each do |enrollment|
      if enrollment.course == course
        found = true
      end
    end
    found
  end
end

class Course
  attr_reader :course

  def initialize(course)
    @course = course
  end
end

class Enrollment
  attr_reader :course

  def initialize(student, course)
    @student = student
    @course = course
  end

  def check_student
    "#{@student.first_name} #{@student.last_name} is enrolled in #{@course.course}"
  end
end

#---------------------

student1 = Student.new(first_name:'John', last_name:'Lee', university:'UVA')
student2 = Student.new(first_name:'Mary', last_name:'G', university:'Berkley')

course1 = Course.new('Product Management')
course2 = Course.new('Consulting')

enrollments = []
enrollments << student1.enroll(course1) # gives an instance of enrollment
enrollments << student2.enroll(course2) # gives an instance of enrollment

p student1.enrolled?(course1)  # => true
p student1.enrolled?(course2)  # => false
p student2.enrolled?(course1)  # => true
p student2.enrolled?(course2)  # => false

enrollments.each do |enrollment|
  puts enrollment.check_student
end



class User
  @@all_users = []
  attr_accessor :name, :username, :password, :friends, :picture, :posts

# create users
  def initialize(name, username, password)
    if(@@all_users.detect{|x| x==username})
      puts "Username already exits"
    else
      @username = username
      @name = name
      @password = password
      @posts = []
      @pictures = []
      @friends = []
      @@all_users << username
    end
  end

# add messages to an array
  def post(message)
    posts << message
  end

# add friends to an array
  def add_friend(friend)
    friends << friend
    friend.friends << self
  end

# add pictures to an array
  def add_picture(picture)
    pictures << picture
  end

  def view_own_posts
    posts.each {|b| puts b}
  end

  def view_friends
    friends.each {|b| puts b}
  end

  def self.all_users
    @@all_users
  end

  def show_feed
    self.friends.each do |f|
      puts "#{f.name}: #{f.posts.last}"
    end
  end
end

saber = User.new("Saber Khan", "skhan", "shurjo")
aaron = User.new("Aaron Grill", "agrill", "aaron")
danny = User.new("Daniel Fenjves", "dfenjves", "danny")

puts User.all_users

danny.post("Hello world")
saber.post("Hello test")
aaron.post("one more")

danny.post("Hello world1")
saber.post("Hello test1")
aaron.post("one more1")

danny.post("Hello world2")
saber.post("Hello test2")
aaron.post("one more2")

danny.add_friend(saber)
danny.add_friend(aaron)

danny.show_feed

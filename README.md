#Setup

1. git clone https://github.com/mayuresh-srivastava/pch
2. cd pch
3. bundle
4. Run below command in psql console to create a user or use any user/password in your system and specify that in database.yml. 
  psql=# create user lenny password 'leonard' createdb;
5. rails db:setup
6. rails s
7. Signup with a new user

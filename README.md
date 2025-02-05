#Setup

1. git clone https://github.com/mayuresh-srivastava/pch
2. cd pch
3. bundle
4. Run below command in psql console to create a user or use any user/password in your system and specify that in database.yml. 
  psql=# create user lenny password 'leonard' createdb;
5. rails db:setup
6. rails s
7. Signup with a new user

#ExpectedQuestions-Answers

Q: Who can leave comments?
A: Any authenticated user.

Q: Who can change the project status?
A: Only project owners or admins.

Q: What statuses can a project have?
A: pending, in_progress, completed, archived.

Q: How should conversation history be displayed?
A: Chronologically, newest first.

Q: Should comments and status changes be separate models?
A: No, they should be stored in the same model with a type field.

Q: Should we filter between comments and status changes?
A: Yes, a filter would be good.

Q: Should we notify users about new comments or status changes?
A: Yes, but only project members. (Not implemented)

Q: Should users be able to edit or delete their comments?
A: Yes.

Q: Should we allow attachments in comments?
A: No, text only for now.

Q: Should we support real-time updates?
A: Yes, using ActionCable. (Not imlemented)

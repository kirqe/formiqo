Plan.create(name: "Personal", description: "10 mailboxes", cost: 4.99, n_mailboxes: 10)
User.create(email: ENV["user_email"], password: ENV["user_password"], admin: true)


# Sample data
# 30.times.each do |message|
#   Message.create(
#     mailbox_id: 2, # update mailbox_id
#     message_fields: {
#     email: FFaker::Internet.disposable_email,
#     subject: FFaker::CheesyLingo.title,
#     body: FFaker::CheesyLingo.sentence
#   },
#   comment: "")
# end
